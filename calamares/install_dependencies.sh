#!/usr/bin/env bash

# Install Calamares Deps

sudo pacman -S --needed --noconfirm \
		kconfig kcoreaddons kiconthemes ki18n kio solid yaml-cpp kpmcore kparts \
		boost-libs hwinfo qt5-svg polkit-qt5 gtk-update-icon-cache plasma-framework \
		qt5-xmlpatterns squashfs-tools extra-cmake-modules qt5-tools qt5-translations git \
		dmidecode boost mkinitcpio-openswap ckbcomp
