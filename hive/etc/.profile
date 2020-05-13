# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
# umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

export PATH

if [ -e /hive-config/branding-logo.txt ]; then
  BRANDING_LOGO=$(cat /hive-config/branding-logo.txt; echo .) #echo . to preserve new lines
  BRANDING_LOGO=${BRANDING_LOGO%.} #remove last .
elif [ -e /hive/etc/branding-logo.txt ]; then
  BRANDING_LOGO=$(cat /hive/etc/branding-logo.txt; echo .) #echo . to preserve new lines
  BRANDING_LOGO=${BRANDING_LOGO%.} #remove last .
else
  BRANDING_LOGO="${BYELLOW}
 _______ _______ ___ ___ _______   ________ ________
|   |   |_     _|   |   |    ___| |   ____/|   ____/
|       |_|   |_|   |   |    ___| |   |__/ |   |__/
|___|___|_______|\_____/|_______| |___|    |___|

"
fi
BRANDING_LOGO="${BRANDING_LOGO}${NOCOLOR}"

msg=$(cat <<EOF
$uname
${BRANDING_LOGO}
${CYAN}`hostname`${NOCOLOR}
${BPURPLE}`hostname -I`${NOCOLOR}

EOF
)

echo "$msg"


motd

exec sudo /bin/bash
