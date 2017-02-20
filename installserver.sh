#!/bin/bash

OPTS=""

if [ $VALIDATE == 1 ]; then
	OPTS="validate"
fi

eval "$(/credentials.sh)"

/root/steamcmd.sh +login $STEAM_USERNAME $STEAM_PASSWORD +force_install_dir /arma3 +app_update 233780 $OPTS +quit

unset OPTS
unset STEAM_USERNAME
unset STEAM_PASSWORD
