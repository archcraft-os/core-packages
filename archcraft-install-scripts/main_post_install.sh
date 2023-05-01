#!/bin/bash

## Copyright (C) 2023 Aditya Shakya <adi1090x@gmail.com>
##
## Post-Installation Script For Archcraft Prime, Executed by Calamare's `contextualprocess` module.

## ---------------------------------------------------------------------------------------

## Dirs ----------
USER=`cat /etc/passwd | grep "/home" | cut -d: -f1 | head -1`
HOME_DIR="/home/${USER}"

## Remove Package ----------
_remove_pkg_if_installed() {
	pacman -Q "$1" &>/dev/null
	if [[ "$?" == 0 ]]; then
		echo "[*] Removing package : $1"
		pacman -Rnscu --noconfirm ${1}
	fi
}

## Remove File ----------
_remove_file_if_exist() {
	if [[ -e "$1" ]]; then
		echo "[*] Deleting file/folder : $1"
		rm -rf ${1}
	fi
}

## Remove Files & Packages ----------
_remove_for_wm() {
    for _pkg in "${_pkgs_to_remove[@]}"; do
		_remove_pkg_if_installed ${_pkg}
	done

    for _file in "${_files_to_remove[@]}"; do
		_remove_file_if_exist ${_file}
	done
}

## ---------------------------------------------------------------------------------------

## Remove Openbox ----------
remove_openbox() {
	## List Of Packages To Remove
	_pkgs_to_remove=('archcraft-openbox'
					 'openbox'
					 'perl-linux-desktopfiles'
					 'xfce4-settings'
					 'xfce4-terminal'
					 'nitrogen'
					 'xmlstarlet'
					 )

	## List Of File & Dirs To Remove
	_files_to_remove=("$HOME_DIR"/.config/{openbox,openbox-themes})

	## Remove Packages, File & Dirs
	_remove_for_wm
}

## Remove Bspwm ----------
remove_bspwm() {
	_pkgs_to_remove=('archcraft-bspwm')
	_files_to_remove=("$HOME_DIR"/.config/bspwm)
	_remove_for_wm
}

## ---------------------------------------------------------------------------------------

## Install Openbox ----------
install_openbox() {
	echo "[*] Installing Openbox Window Manager..."
	remove_bspwm
}

## Install Bspwm ----------
install_bspwm() {
	echo "[*] Installing Bspwm Window Manager..."
	remove_openbox
}

## Install Everything ----------
install_everything() {
	echo -e "\nMaking a Sandwich for you!\n"
}

## ---------------------------------------------------------------------------------------

## Execute In Target ----------
if [[ "$1" == '--openbox' ]]; then
	install_openbox
elif [[ "$1" == '--bspwm' ]]; then
	install_bspwm
elif [[ "$1" == '--everything' ]]; then
	install_everything
fi
