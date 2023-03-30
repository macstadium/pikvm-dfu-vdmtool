#!/bin/bash 

#set -e 
#apt-get update
#apt-get install -y cmake libtool autoconf automake libreadline-dev python-dev libusb-1.0-0-dev libzip-dev zlib1g-dev libssl-dev libcurl4-openssl-dev git exfat-fuse exfat-utils

function makeproject () {
	
	github_account="$1"
	proj="$2"
	branch="$3"
	url="https://github.com/${github_account}/${proj}.git"  $branch
	echo "cloning $url"
	
	git clone "${url}"
	cd "${proj}"
	git checkout $branch 

	./autogen.sh
	make
	make install
	
	cd ..
		

}

projects=("libplist" "libimobiledevice-glue" "libusbmuxd" "libimobiledevice" "libirecovery")

for proj in ${projects[@]}; do
	makeproject libimobiledevice "${proj}" master 
done

makeproject twocanoes idevicerestore  usb3
makeproject libimobiledevice usbmuxd  master 


useradd usbmux

ldconfig

