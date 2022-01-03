#!/bin/bash 

set -e 
apt-get update
apt-get install -y cmake libtool autoconf automake libreadline-dev python-dev libusb-1.0-0-dev libzip-dev zlib1g-dev libssl-dev libcurl4-openssl-dev git exfat-fuse exfat-utils


projects=("libplist" "libimobiledevice-glue" "libusbmuxd" "libimobiledevice" "libirecovery" "idevicerestore" "usbmuxd")

for proj in ${projects[@]}; do

	url="https://github.com/libimobiledevice/${proj}.git"
	echo "cloning $url"
	
	git clone "${url}"
	cd "${proj}"
	./autogen.sh
	make
	make install
	
	cd ..


done
useradd usbmux

ldconfig

