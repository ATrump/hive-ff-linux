#!/usr/bin/env bash

# Part of agent

### some helper functions
nv_as=0
nv_mn=0
nv_af=0
nv_wd=0

function do_command () {
	#body=$1
	[[ -z $command ]] && command=`echo "$body" | jq -r '.command'` #get command for batch

	#Optional command identifier
	cmd_id=$(echo "$body" | jq -r '.id')
	[[ $cmd_id == "null" ]] && cmd_id=

	bench=0
	benchmark check > /dev/null 2>&1
	[[ $? == 0 ]] && bench=1 || bench=0

	case $command in

		OK)
			echo -e "${BGREEN}$command${NOCOLOR}"
		;;

		reboot)
			message ok "Rebooting" --id=$cmd_id
			echo -e "${BRED}Rebooting${NOCOLOR}"
			nohup bash -c 'sreboot' > /tmp/nohup.log 2>&1 &
			#superreboot
		;;

		upgrade)
			local version=$(echo "$body" | jq -r '.version')
			[[ $version == "null" ]] && version=
			nohup bash -c '
				payload=`selfupgrade '$version' 2>&1`
				upgrade_exitcode=$?
				echo "$payload"
				[[ $upgrade_exitcode -eq 0 ]] &&
					echo "$payload" | message ok "Selfupgrade successful" payload --id='$cmd_id' ||
					echo "$payload" | message error "Selfupgrade failed" payload --id='$cmd_id'
			' > /tmp/nohup.log 2>&1 &
		;;

		exec)
			local exec=$(echo "$body" | jq '.exec' --raw-output)
			nohup bash -c '
			log_name="/tmp/exec_"'$cmd_id'".log"
			('"$exec"') > $log_name 2>&1
			exitcode=$?
			payload=`cat $log_name`
			[[ $exitcode -eq 0 ]] &&
				echo "$payload" | message info "'"$exec"'" payload --id='$cmd_id' ||
				echo "$payload" | message error "'"$exec"' (failed, exitcode=$exitcode)" payload --id='$cmd_id'
			' > /tmp/nohup.log 2>&1 &
		;;

		config)
			config=$(echo $body | jq '.config' --raw-output)
			justwrite=$(echo $body | jq '.justwrite' --raw-output) #don't restart miner, just write config, maybe WD settings will be updated
			if [[ ! -z $config && $config != "null" ]]; then
				#scan for password change
				echo "$config" > /tmp/rig.conf.new
				while read line; do
					[[ $line =~ ^RIG_PASSWD=\"(.*)\" ]] && NEW_PASSWD=${BASH_REMATCH[1]} && break
				done < /tmp/rig.conf.new
				rm /tmp/rig.conf.new

				# Password change ---------------------------------------------------
				if [[ $RIG_PASSWD != $NEW_PASSWD ]]; then
					echo -e "${RED}New password:${NOCOLOR} $NEW_PASSWD";

					message warning "Password change received, wait for next message..." --id=$cmd_id
					request=$(jq -n --arg rig_id "$RIG_ID" --arg passwd "$RIG_PASSWD" \
					'{ "method": "password_change_received", "params": {$rig_id, $passwd}, "jsonrpc": "2.0", "id": 0}')
					response=$(echo $request | curl --insecure -L --data @- --connect-timeout 7 --max-time 15 --silent -XPOST "${HIVE_URL}?id_rig=$RIG_ID&method=password_change_received" -H "Content-Type: application/json")

					exitcode=$?
					[ $exitcode -ne 0 ] &&
						message error "Error notifying hive about \"password_change_received\"" --id=$cmd_id &&
						return $exitcode #better exit because password will not be changed

					error=$(echo $response | jq '.error' --raw-output)
					[[ ! -z $error && $error != "null" ]] && echo -e "${RED}Server error:${NOCOLOR} `echo $response | jq '.error.message' -r`" && return 1

					echo "$response" | jq '.'
					#after this there will be new password on server, so all new request should use new one
				fi

				# Write new config and load it ---------------------------------------
				source $RIG_CONF
				echo "$config" > $RIG_CONF
				[[ $bench -eq 1 ]] && sed -i "s/^MINER=.*/MINER=${MINER}/" $RIG_CONF
				sync
				. $RIG_CONF

				# Save wallet if given -----------------------------------------------
				if [[ $bench -eq 0 ]]; then
					wallet=$(echo $body | jq '.wallet' --raw-output)
					[[ ! -z $wallet && $wallet != "null" ]] &&
						echo "$wallet" > $WALLET_CONF
				fi

				# Save Powermeter config if given -----------------------------------------------
				powermeter=$(echo $response | jq '.result.powermeter' --raw-output)
				[[ ! -z $powermeter && $powermeter != "null" ]] &&
					echo "$powermeter" > $PM_CONF

				# Save Fanflap config if given -----------------------------------------------
				fanflap=$(echo $response | jq '.result.fanflap' --raw-output)
				[[ ! -z $fanflap && $fanflap != "null" ]] &&
					echo "$fanflap" > $FF_CONF

				# Final actions ---------------------------------------------------------
				if [[ $justwrite != 1 && $bench -eq 0 ]]; then
					hostname-check
				fi

				# Start Watchdog. It will exit if WD_ENABLED=0 ---------------------------
				#[[ $WD_ENABLED=1 && $bench -eq 0 ]] && wd restart

			else
				message error "No rig \"config\" given" --id=$cmd_id
			fi
		;;


		openvpn_set)
			local clientconf=$(echo $body | jq '.clientconf' --raw-output)
			local cacrt=$(echo $body | jq '.cacrt' --raw-output)
			local clientcrt_fname=$(echo $body | jq '.clientcrt_fname' --raw-output)
			local clientcrt=$(echo $body | jq '.clientcrt' --raw-output)
			local clientkey_fname=$(echo $body | jq '.clientkey_fname' --raw-output)
			local clientkey=$(echo $body | jq '.clientkey' --raw-output)
			local vpn_login=$(echo $body | jq '.vpn_login' --raw-output)
			local vpn_password=$(echo $body | jq '.vpn_password' --raw-output)

			systemctl stop openvpn@client
			(rm /hive-config/openvpn/*.crt; rm /hive-config/openvpn/*.key; rm /hive-config/openvpn/*.conf; rm /hive-config/openvpn/auth.txt) > /dev/null 2>&1

			#add login credentials to config
			[[ ! -z $vpn_login && $vpn_login != "null" && ! -z $vpn_password && $vpn_password != "null" ]] &&
				echo "$vpn_login" >> /hive-config/openvpn/auth.txt &&
				echo "$vpn_password" >> /hive-config/openvpn/auth.txt &&
				clientconf=$(sed 's/^auth-user-pass.*$/auth-user-pass \/hive-config\/openvpn\/auth.txt/g' <<< "$clientconf")

			echo "$clientconf" > /hive-config/openvpn/client.conf
			[[ ! -z $cacrt && $cacrt != "null" ]] && echo "$cacrt" > /hive-config/openvpn/ca.crt
			[[ ! -z $clientcrt && $clientcrt != "null" ]] && echo "$clientcrt" > /hive-config/openvpn/$clientcrt_fname
			[[ ! -z $clientkey && $clientkey != "null" ]] && echo "$clientkey" > /hive-config/openvpn/$clientkey_fname

			payload=`openvpn-install`
			exitcode=$?
			[[ $exitcode == 0 ]] && payload+=$'\n'"`hostname -I`"
			echo "$payload"
			if [[ $exitcode == 0 ]]; then
				echo "$payload" | message ok "OpenVPN configured" payload --id=$cmd_id
				hello #to give new ips and openvpn flag
			else
				echo "$payload" | message warn "OpenVPN setup failed" payload --id=$cmd_id
			fi
		;;

		openvpn_remove)
			systemctl stop openvpn@client
			(rm /hive-config/openvpn/*.crt; rm /hive-config/openvpn/*.key; rm /hive-config/openvpn/*.conf; rm /hive-config/openvpn/auth.txt) > /dev/null 2>&1
			openvpn-install #will remove /tmp/.openvpn-installed file
			hello
			message ok "OpenVPN service stopped, certificates removed" --id=$cmd_id
		;;

		"")
			echo -e "${YELLOW}Got empty command, might be temporary network issue${NOCOLOR}"
		;;

		*)
			message warning "Got unknown command \"$command\"" --id=$cmd_id
			echo -e "${YELLOW}Got unknown command ${CYAN}$command${NOCOLOR}"
		;;
	esac

	#Flush buffers if any files changed
	sync
}
