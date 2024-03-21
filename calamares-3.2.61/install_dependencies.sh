#!/usr/bin/env bash

# Install Calamares Deps

sudo pacman -S --needed --noconfirm \
		kconfig5 kcoreaddons5 kiconthemes5 ki18n5 kio5 solid5 kparts5 yaml-cpp kpmcore \
		boost-libs hwinfo qt5-svg polkit-qt5 gtk-update-icon-cache plasma-framework5 \
		qt5-xmlpatterns squashfs-tools extra-cmake-modules qt5-tools qt5-translations git \
		dmidecode boost mkinitcpio-openswap ckbcomp
