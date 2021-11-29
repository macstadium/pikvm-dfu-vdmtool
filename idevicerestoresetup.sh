#!/bin/bash 

set -e 
apt-get update
apt-get install -y libtool autoconf automake libreadline-dev python-dev libusb-1.0-0-dev libzip-dev zlib1g-dev libssl-dev libcurl4-openssl-dev

projects=("libplist" "libimobiledevice-glue" "libusbmuxd" "libimobiledevice" "libirecovery" "idevicerestore")

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

ldconfig

