emupi
-----

Simple scripts to run a Raspberry Pi emulator, running raspbian, on MacOS.

First, run the `configure.sh` script to install Qemu and download the requisite files.

Then simply run `start.sh`. The emulator runs headless, and can be accessed via SSH as follows:

```
ssh -p 5022 pi@localhost
```

To copy files to the emulator:

```
rsync --rsh='ssh -p 5022' <PATH_TO_LOCAL_FILE> pi@localhost:<REMOTE_PATH>
```

The `<REMOTE_PATH>` can be left blank if the destination is the home directory of the _pi_ user.

## Authentication

The initial password for the _pi_ user is _raspberry_. To use SSH key authenitcation, run the following command:

```
ssh-copy-id -p 5022 pi@localhost
```

## Networking from guest to host

The property `guestfwd=tcp:10.0.2.200:1234-cmd:nc 192.168.0.100 8842` determines how the guest will access a port on the host, e.g. a web server running on the host. The first IP, `10.0.2.200`, is the ip that the guest will use to access the port. Port `1234` on the guest is mapped to port 8842 on the host, where `192.168.0.100` is the ip address of the host.
