# maix_baremetal

## build & flash

please install [kflash](https://github.com/kendryte/kflash.py)

```sh
$ sudo pip install kflash           # install kflash
$ make                              # build
```

flash:

```sh
$ make flash                        # /dev/ttyUSB0
or
$ make flash PORT_K210=/dev/tty<XXX>
```

When you connect Maix bit to PC, two serial port will appear.

One of them is the K210 port. You need to specify the K210 port.



## debug

I'm trying to debug MAiX Bit with FT2232D and openocd-kendryte now....

- [openocd-kendryte](https://github.com/kendryte/openocd-kendryte)
