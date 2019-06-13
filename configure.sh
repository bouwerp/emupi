#!/bin/bash

QEMU=$(brew ls --versions qemu)

if [ -z "${QEMU}" ]; then
	echo "qemu not installed - installing"
	brew install qemu
else
	echo "qemu already installed"
fi

WGET=$(brew ls --versions wget)

if [ -z "${WGET}" ]; then
	echo "wget not installed - installing"
	brew install wget
else
	echo "wget already installed"
fi

if [ ! -f ./kernel-qemu-4.14.79-stretch ]; then
    echo "downloading kernel"
    wget "https://github.com/dhruvvyas90/qemu-rpi-kernel/raw/master/kernel-qemu-4.14.79-stretch"
else
    echo "kernal exists"
fi

if [ ! -f ./versatile-pb.dtb ]; then
    echo "downloading .dtb file"
    wget "https://github.com/dhruvvyas90/qemu-rpi-kernel/raw/master/versatile-pb.dtb"
else
    echo ".dtb file exists"
fi

if [ ! -f ./2019-04-08-raspbian-stretch-lite.img ] && [ ! -f ./2019-04-08-raspbian-stretch-lite.zip ] ; then
    echo "downloading 2019-04-08-raspbian-stretch-lite.zip"
    wget "http://director.downloads.raspberrypi.org/raspbian_lite/images/raspbian_lite-2019-04-09/2019-04-08-raspbian-stretch-lite.zip"
    unzip 2019-04-08-raspbian-stretch-lite.zip
else
    echo "2019-04-08-raspbian-stretch-lite file exists"
    if [ ! -f ./2019-04-08-raspbian-stretch-lite.zip ]; then
        unzip 2019-04-08-raspbian-stretch-lite.zip
    fi
fi
