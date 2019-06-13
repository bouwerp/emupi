#!/bin/bash

QEMU=$(brew ls --versions qemu)

if [ -z "${QEMU}" ]; then
	echo "qemu not installed - installing"
	brew install qemu
else
	echo "qemu already installed"
fi
