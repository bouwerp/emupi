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
