_tinkerforge_device()
{
	local prev

	for (( i=$1; i > 0; i-- )); do
		prev="${COMP_WORDS[i-1]}"

		case "${prev}" in
		get-*|is-*|are-*|abort-async-file-read|allocate-list|allocate-string|append-to-list|calibrate|cardemu-get-state|continue-program-schedule|create-directory|create-pipe|create-session|define-program|edge-interrupt|expire-session|keep-session-alive|kill-process|modbus-master-read-coils|modbus-master-read-discrete-inputs|modbus-master-read-holding-registers|modbus-master-read-input-registers|modbus-master-write-multiple-coils|modbus-master-write-multiple-coils-low-level|modbus-master-write-multiple-registers|modbus-master-write-multiple-registers-low-level|modbus-master-write-single-coil|modbus-master-write-single-register|open-directory|open-file|p2p-get-state|p2p-read-ndef|p2p-read-ndef-low-level|purge-program|read|read-black-white|read-black-white-low-level|read-color|read-color-low-level|read-file|read-frame|read-frame-low-level|read-low-level|read-pixels|read-pixels-low-level|read-uid|read-wifi2-serial-port|reader-get-state|reader-get-tag-id|reader-get-tag-id-low-level|reader-read-ndef|reader-read-ndef-low-level|reader-read-page|reader-read-page-low-level|release-object|remove-custom-program-option|remove-from-list|reset-bus|rewind-directory|save-calibration|save-wifi2-configuration|search-bus|search-bus-low-level|set-bootloader-mode|set-custom-program-option-value|set-file-events|set-file-position|set-program-command|set-program-schedule|set-program-stdio-redirection|set-string-chunk|spawn-process|start-program|start-wifi2-bootloader|truncate-string|write|write-command|write-file|write-firmware|write-frame|write-frame-low-level|write-low-level|write-wifi2-serial-port|acceleration|acceleration-reached|adc-values|air-pressure|air-pressure-reached|alarm|alarm-finished|all-counter|all-data|all-input-value|all-signal-data|all-value|all-values|altitude|altitude-reached|ambient-temperature|ambient-temperature-reached|analog-value|analog-value-reached|angular-velocity|async-file-read|async-file-write|beep-finished|button-pressed|button-released|button-state-changed|cardemu-state-changed|co2-concentration|co2-concentration-reached|color|color-reached|color-temperature|continuous-acceleration-16-bit|continuous-acceleration-8-bit|coordinates|count|count-reached|counter|counter-finished|current|current-reached|current-velocity|date-time|decibel|detection-cycle-ended|distance|distance-reached|draw-status|dust-density|dust-density-reached|edge-count|emergency-shutdown|energy-data|error|error-callback|error-count|error-state|file-events-occurred|frame|frame-available|frame-error-count|frame-low-level|frame-read|frame-read-low-level|frame-rendered|frame-started|gravity-vector|gui-button-pressed|gui-slider-value|gui-tab-selected|heading|high-contrast-image|high-contrast-image-low-level|humidity|humidity-reached|iaq-index|illuminance|illuminance-reached|input-value|intensity|intensity-reached|interrupt|linear-acceleration|magnetic-field|magnetic-flux-density|modbus-master-read-coils-response|modbus-master-read-coils-response-low-level|modbus-master-read-discrete-inputs-response|modbus-master-read-discrete-inputs-response-low-level|modbus-master-read-holding-registers-response|modbus-master-read-holding-registers-response-low-level|modbus-master-read-input-registers-response|modbus-master-read-input-registers-response-low-level|modbus-master-write-multiple-coils-response|modbus-master-write-multiple-registers-response|modbus-master-write-single-coil-response|modbus-master-write-single-register-response|modbus-slave-read-coils-request|modbus-slave-read-discrete-inputs-request|modbus-slave-read-holding-registers-request|modbus-slave-read-input-registers-request|modbus-slave-write-multiple-coils-request|modbus-slave-write-multiple-coils-request-low-level|modbus-slave-write-multiple-registers-request|modbus-slave-write-multiple-registers-request-low-level|modbus-slave-write-single-coil-request|modbus-slave-write-single-register-request|moisture|moisture-reached|monoflop-done|morse-code-finished|motion|motion-detected|new-state|object-temperature|object-temperature-reached|orientation|over-current|p2p-state-changed|pm-concentration|pm-count|position|position-reached|power|power-reached|pressed|process-state-changed|program-process-spawned|program-scheduler-state-changed|pulse-per-second|quaternion|read|read-callback|read-low-level|reader-state-changed|reflectivity|reflectivity-reached|released|remote-status-a|remote-status-b|remote-status-c|resistance|resistance-reached|sensor-connected|sensor-data|spectrum|spectrum-low-level|stack-current|stack-current-reached|stack-voltage|stack-voltage-reached|state-changed|station-data|statistics|status|switching-done|temperature|temperature-image|temperature-image-low-level|temperature-reached|tilt-state|touch-gesture|touch-position|touch-state|under-voltage|usb-voltage|usb-voltage-reached|uv-light|uv-light-reached|uva|uvb|uvi|value|velocity|velocity-reached|voltage|voltage-reached|voltages|weight|weight-reached)
			COMPREPLY=($(compgen -W "--help --execute" -- ${cur}))
			break
			;;
		set-*|authenticate-mifare-classic-page|backlight-off|backlight-on|beep|calibrate|calibrate-offset|cardemu-start-discovery|cardemu-start-transfer|cardemu-write-ndef|cardemu-write-ndef-low-level|clear-display|dim-socket-b|disable|disable-error-count-callback|disable-frame-read-callback|disable-frame-rendered-callback|disable-laser|disable-position-reached-callback|disable-read-callback|disable-status-led|disable-tilt-state-callback|disable-velocity-reached-callback|disable-wifi2-status-led|draw|draw-box|draw-buffered-frame|draw-frame|draw-line|draw-text|drive-backward|drive-forward|enable|enable-error-count-callback|enable-frame-read-callback|enable-frame-rendered-callback|enable-laser|enable-position-reached-callback|enable-read-callback|enable-status-led|enable-tilt-state-callback|enable-velocity-reached-callback|enable-wifi2-status-led|expire-session-unchecked|fill-display|full-brake|led-off|led-on|leds-off|leds-on|light-off|light-on|modbus-slave-answer-read-coils-request|modbus-slave-answer-read-coils-request-low-level|modbus-slave-answer-read-discrete-inputs-request|modbus-slave-answer-read-discrete-inputs-request-low-level|modbus-slave-answer-read-holding-registers-request|modbus-slave-answer-read-holding-registers-request-low-level|modbus-slave-answer-read-input-registers-request|modbus-slave-answer-read-input-registers-request-low-level|modbus-slave-answer-write-multiple-coils-request|modbus-slave-answer-write-multiple-registers-request|modbus-slave-answer-write-single-coil-request|modbus-slave-answer-write-single-register-request|modbus-slave-report-exception|morse-code|new-window|orientation-calculation-off|orientation-calculation-on|p2p-start-discovery|p2p-start-transfer|p2p-write-ndef|p2p-write-ndef-low-level|read-file-async|reader-authenticate-mifare-classic-page|reader-request-ndef|reader-request-page|reader-request-tag-id|reader-write-ndef|reader-write-ndef-low-level|reader-write-page|reader-write-page-low-level|recalibrate|refresh-wifi-status|release-object-unchecked|remove-all-gui|remove-calibration|remove-gui-button|remove-gui-graph|remove-gui-slider|remove-gui-tab|request-page|request-tag-id|reset|reset-energy|restart|start-counter|stop|switch-socket|switch-socket-a|switch-socket-b|switch-socket-c|tare|update-frequency|update-volume|write|write-black-white|write-black-white-low-level|write-color|write-color-low-level|write-file-async|write-file-unchecked|write-frame|write-frame-low-level|write-line|write-page|write-pixels|write-pixels-low-level|write-uid)
			COMPREPLY=($(compgen -W "--help --expect-response" -- ${cur}))
			break
			;;
		call)
			local functions=$(tinkerforge call $2 --list-functions)
			COMPREPLY=($(compgen -W "--help --list-functions ${functions}" -- ${cur}))
			break
			;;
		dispatch)
			local callbacks=$(tinkerforge dispatch $2 --list-callbacks)
			COMPREPLY=($(compgen -W "--help --list-callbacks ${callbacks}" -- ${cur}))
			break
			;;
		*)
			;;
		esac
	done
}

_tinkerforge()
{
	COMPREPLY=()
	local prev cur
	prev="${COMP_WORDS[COMP_CWORD-1]}"
	cur="${COMP_WORDS[COMP_CWORD]}"

	case "${prev}" in
	--help)
		return 0
		;;
	--version)
		return 0
		;;
	--host)
		_known_hosts
		return 0
		;;
	--port)
		return 0
		;;
	--secret)
		return 0
		;;
	--item-separator)
		return 0
		;;
	--group-separator)
		return 0
		;;
	--no-symbolic-input)
		return 0
		;;
	--no-symbolic-output)
		return 0
		;;
	--duration)
		return 0
		;;
	--timeout)
		return 0
		;;
	--list-devices)
		return 0
		;;
	--list-functions)
		return 0
		;;
	--list-callbacks)
		return 0
		;;
	accelerometer-bricklet|accelerometer-v2-bricklet|air-quality-bricklet|ambient-light-bricklet|ambient-light-v2-bricklet|ambient-light-v3-bricklet|analog-in-bricklet|analog-in-v2-bricklet|analog-in-v3-bricklet|analog-out-bricklet|analog-out-v2-bricklet|analog-out-v3-bricklet|barometer-bricklet|barometer-v2-bricklet|can-bricklet|can-v2-bricklet|co2-bricklet|co2-v2-bricklet|color-bricklet|color-v2-bricklet|compass-bricklet|current12-bricklet|current25-bricklet|dc-brick|distance-ir-bricklet|distance-ir-v2-bricklet|distance-us-bricklet|distance-us-v2-bricklet|dmx-bricklet|dual-button-bricklet|dual-button-v2-bricklet|dual-relay-bricklet|dust-detector-bricklet|e-paper-296x128-bricklet|energy-monitor-bricklet|gps-bricklet|gps-v2-bricklet|hall-effect-bricklet|hall-effect-v2-bricklet|hat-brick|hat-zero-brick|humidity-bricklet|humidity-v2-bricklet|imu-brick|imu-v2-brick|industrial-analog-out-bricklet|industrial-analog-out-v2-bricklet|industrial-counter-bricklet|industrial-digital-in-4-bricklet|industrial-digital-in-4-v2-bricklet|industrial-digital-out-4-bricklet|industrial-digital-out-4-v2-bricklet|industrial-dual-0-20ma-bricklet|industrial-dual-0-20ma-v2-bricklet|industrial-dual-analog-in-bricklet|industrial-dual-analog-in-v2-bricklet|industrial-dual-relay-bricklet|industrial-quad-relay-bricklet|industrial-quad-relay-v2-bricklet|io16-bricklet|io16-v2-bricklet|io4-bricklet|io4-v2-bricklet|isolator-bricklet|joystick-bricklet|joystick-v2-bricklet|laser-range-finder-bricklet|laser-range-finder-v2-bricklet|lcd-128x64-bricklet|lcd-16x2-bricklet|lcd-20x4-bricklet|led-strip-bricklet|led-strip-v2-bricklet|line-bricklet|linear-poti-bricklet|linear-poti-v2-bricklet|load-cell-bricklet|load-cell-v2-bricklet|master-brick|moisture-bricklet|motion-detector-bricklet|motion-detector-v2-bricklet|motorized-linear-poti-bricklet|multi-touch-bricklet|multi-touch-v2-bricklet|nfc-bricklet|nfc-rfid-bricklet|oled-128x64-bricklet|oled-128x64-v2-bricklet|oled-64x48-bricklet|one-wire-bricklet|outdoor-weather-bricklet|particulate-matter-bricklet|piezo-buzzer-bricklet|piezo-speaker-bricklet|piezo-speaker-v2-bricklet|ptc-bricklet|ptc-v2-bricklet|real-time-clock-bricklet|real-time-clock-v2-bricklet|red-brick|remote-switch-bricklet|remote-switch-v2-bricklet|rgb-led-bricklet|rgb-led-button-bricklet|rgb-led-matrix-bricklet|rgb-led-v2-bricklet|rotary-encoder-bricklet|rotary-encoder-v2-bricklet|rotary-poti-bricklet|rotary-poti-v2-bricklet|rs232-bricklet|rs232-v2-bricklet|rs485-bricklet|segment-display-4x7-bricklet|segment-display-4x7-v2-bricklet|servo-brick|silent-stepper-brick|solid-state-relay-bricklet|solid-state-relay-v2-bricklet|sound-intensity-bricklet|sound-pressure-level-bricklet|stepper-brick|temperature-bricklet|temperature-ir-bricklet|temperature-ir-v2-bricklet|temperature-v2-bricklet|thermal-imaging-bricklet|thermocouple-bricklet|thermocouple-v2-bricklet|tilt-bricklet|uv-light-bricklet|uv-light-v2-bricklet|voltage-bricklet|voltage-current-bricklet|voltage-current-v2-bricklet|xmc1400-breakout-bricklet)
		local host port secret options
		host=""
		port=""
		secret=""
		options=""

		for (( i=${COMP_CWORD}; i > 0; i-- )); do
			case "${COMP_WORDS[i]}" in
			--host)
				case "${COMP_WORDS[i+1]}" in
				=)
					host="--host ${COMP_WORDS[i+2]}"
					;;
				*)
					host="--host ${COMP_WORDS[i+1]}"
					;;
				esac
				;;
			--port)
				case "${COMP_WORDS[i+1]}" in
				=)
					port="--port ${COMP_WORDS[i+2]}"
					;;
				*)
					port="--port ${COMP_WORDS[i+1]}"
					;;
				esac
				;;
			--secret)
				case "${COMP_WORDS[i+1]}" in
				=)
					secret="--secret ${COMP_WORDS[i+2]}"
					;;
				*)
					secret="--secret ${COMP_WORDS[i+1]}"
					;;
				esac
				;;
			call)
				options="--list-functions"
				;;
			dispatch)
				options="--list-callbacks"
				;;
			*)
				;;
			esac
		done

		local uids=$(tinkerforge ${host} ${port} ${secret} enumerate --duration 100 --execute "if [ {device-identifier} = '${COMP_WORDS[COMP_CWORD-1]}' ]; then echo {uid}; fi" 2> /dev/null)
		COMPREPLY=($(compgen -W "--help ${options} ${uids}" -- ${cur}))
		return 0
		;;
	--execute)
		return 0
		;;
	--expect-response)
		return 0
		;;
	*)
		;;
	esac

	for (( i=${COMP_CWORD}; i > 0; i-- )); do
		prev="${COMP_WORDS[i-1]}"

		case "${prev}" in
		tinkerforge)
			COMPREPLY=($(compgen -W "--help --host --port --secret --item-separator --group-separator --no-symbolic-input --no-symbolic-output call dispatch enumerate listen" -- ${cur}))
			break
			;;
		call)
			local devices=$(tinkerforge call --list-devices)
			COMPREPLY=($(compgen -W "--help --list-devices --timeout ${devices}" -- ${cur}))
			break
			;;
		dispatch)
			local devices=$(tinkerforge dispatch --list-devices)
			COMPREPLY=($(compgen -W "--help --list-devices --duration ${devices}" -- ${cur}))
			break
			;;
		enumerate)
			COMPREPLY=($(compgen -W "--help --duration --types --execute" -- ${cur}))
			break
			;;
		listen)
			COMPREPLY=($(compgen -W "--help --address --port --enable-host --enable-port --enable-execute" -- ${cur}))
			break
			;;
		accelerometer-bricklet|accelerometer-v2-bricklet|air-quality-bricklet|ambient-light-bricklet|ambient-light-v2-bricklet|ambient-light-v3-bricklet|analog-in-bricklet|analog-in-v2-bricklet|analog-in-v3-bricklet|analog-out-bricklet|analog-out-v2-bricklet|analog-out-v3-bricklet|barometer-bricklet|barometer-v2-bricklet|can-bricklet|can-v2-bricklet|co2-bricklet|co2-v2-bricklet|color-bricklet|color-v2-bricklet|compass-bricklet|current12-bricklet|current25-bricklet|dc-brick|distance-ir-bricklet|distance-ir-v2-bricklet|distance-us-bricklet|distance-us-v2-bricklet|dmx-bricklet|dual-button-bricklet|dual-button-v2-bricklet|dual-relay-bricklet|dust-detector-bricklet|e-paper-296x128-bricklet|energy-monitor-bricklet|gps-bricklet|gps-v2-bricklet|hall-effect-bricklet|hall-effect-v2-bricklet|hat-brick|hat-zero-brick|humidity-bricklet|humidity-v2-bricklet|imu-brick|imu-v2-brick|industrial-analog-out-bricklet|industrial-analog-out-v2-bricklet|industrial-counter-bricklet|industrial-digital-in-4-bricklet|industrial-digital-in-4-v2-bricklet|industrial-digital-out-4-bricklet|industrial-digital-out-4-v2-bricklet|industrial-dual-0-20ma-bricklet|industrial-dual-0-20ma-v2-bricklet|industrial-dual-analog-in-bricklet|industrial-dual-analog-in-v2-bricklet|industrial-dual-relay-bricklet|industrial-quad-relay-bricklet|industrial-quad-relay-v2-bricklet|io16-bricklet|io16-v2-bricklet|io4-bricklet|io4-v2-bricklet|isolator-bricklet|joystick-bricklet|joystick-v2-bricklet|laser-range-finder-bricklet|laser-range-finder-v2-bricklet|lcd-128x64-bricklet|lcd-16x2-bricklet|lcd-20x4-bricklet|led-strip-bricklet|led-strip-v2-bricklet|line-bricklet|linear-poti-bricklet|linear-poti-v2-bricklet|load-cell-bricklet|load-cell-v2-bricklet|master-brick|moisture-bricklet|motion-detector-bricklet|motion-detector-v2-bricklet|motorized-linear-poti-bricklet|multi-touch-bricklet|multi-touch-v2-bricklet|nfc-bricklet|nfc-rfid-bricklet|oled-128x64-bricklet|oled-128x64-v2-bricklet|oled-64x48-bricklet|one-wire-bricklet|outdoor-weather-bricklet|particulate-matter-bricklet|piezo-buzzer-bricklet|piezo-speaker-bricklet|piezo-speaker-v2-bricklet|ptc-bricklet|ptc-v2-bricklet|real-time-clock-bricklet|real-time-clock-v2-bricklet|red-brick|remote-switch-bricklet|remote-switch-v2-bricklet|rgb-led-bricklet|rgb-led-button-bricklet|rgb-led-matrix-bricklet|rgb-led-v2-bricklet|rotary-encoder-bricklet|rotary-encoder-v2-bricklet|rotary-poti-bricklet|rotary-poti-v2-bricklet|rs232-bricklet|rs232-v2-bricklet|rs485-bricklet|segment-display-4x7-bricklet|segment-display-4x7-v2-bricklet|servo-brick|silent-stepper-brick|solid-state-relay-bricklet|solid-state-relay-v2-bricklet|sound-intensity-bricklet|sound-pressure-level-bricklet|stepper-brick|temperature-bricklet|temperature-ir-bricklet|temperature-ir-v2-bricklet|temperature-v2-bricklet|thermal-imaging-bricklet|thermocouple-bricklet|thermocouple-v2-bricklet|tilt-bricklet|uv-light-bricklet|uv-light-v2-bricklet|voltage-bricklet|voltage-current-bricklet|voltage-current-v2-bricklet|xmc1400-breakout-bricklet)
			_tinkerforge_device ${COMP_CWORD} ${prev}
			break
			;;
		*)
			;;
		esac
	done

	return 0
}

complete -F _tinkerforge tinkerforge
