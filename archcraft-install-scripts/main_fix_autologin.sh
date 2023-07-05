#!/bin/bash

## Copyright (C) 2023 Aditya Shakya <adi1090x@gmail.com>
##
## Fix Calamares Autologin 

## ---------------------------------------------------------------------------------------

## Dirs ----------
DM_FILE='/etc/sddm.conf'

## ---------------------------------------------------------------------------------------

enable_autologin() {
	_session_name="$1"

	if [[ `cat $DM_FILE | grep 'Autologin'` ]]; then
		sed -i -e "/\[Autologin\]/{ n; s/Session=.*/Session=$_session_name/g }" "$DM_FILE"
	fi
}

## ---------------------------------------------------------------------------------------

## Execute In Target ----------
if [[ "$1" == '--openbox' ]]; then
	enable_autologin 'openbox'
elif [[ "$1" == '--bspwm' ]]; then
	enable_autologin 'bspwm'
elif [[ "$1" == '--everything' ]]; then
	enable_autologin 'openbox'
fi
