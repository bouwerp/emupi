#!/bin/bash

qemu-system-arm -kernel kernel-qemu-4.14.79-stretch \
    -cpu arm1176 -m 256 -M versatilepb \
    -curses \
    -dtb versatile-pb.dtb -no-reboot \
    -serial stdio -append "root=/dev/sda2 panic=1 rootfstype=ext4 rw" \
    -drive "file=2019-04-08-raspbian-stretch-lite.img,index=0,media=disk,format=raw" \
    -net 'user,hostfwd=tcp::5022-:22,guestfwd=tcp:10.0.2.200:4029-cmd:nc 127.0.0.1 4029' \
    -net nic
