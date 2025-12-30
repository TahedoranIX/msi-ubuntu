# msi-ubuntu

Set of parameters and scripts to customize ubuntu for msi-modern-14 c7m

## Links

* [msi-ec](https://github.com/BeardOverflow/msi-ec)
* [Random brightness fix](https://askubuntu.com/a/1487963)
* [Auto switch light/dark mode GNOME Ubuntu](https://www.technowizardry.net/2024/06/auto-switch-between-light-and-dark-mode-on-gnome/)

## Hide boot messages

Add to /etc/default/grub:

```bash
GRUB_CMDLINE_LINUX="console=ttyS0"
```

Update grub : `update-grub`

## MSI-EC installation

In Ubuntu 23.10-24.04, install with dkms. Not compatible (23/04/24) with new EC Firmware 14JKEMS1.300

```bash
sudo make dkms-install
reboot
```

### Troubleshooting

If you updated the EC/BIOS, msi-ec may not support yet that version, add your EC version to `msi-ec.c`

If `sudo modprobe msi-ec` gives a key error, you need to generate a new MOK. Thanks [Vincent](https://vcheng.org/2023/01/22/ubuntu-linux-secure-boot-dkms/)

```
sudo update-secureboot-policy --new-key
sudo mokutil --import /var/lib/shim-signed/mok/MOK.der
```

### Workaround for mute key LED

Follow this link: [link](https://askubuntu.com/questions/125367/enabling-mic-mute-button-and-light-on-lenovo-thinkpads)

And use the scripts provided in scripts directory

## GNOME extensions

[Gestures](https://github.com/jamespo/gnome-gesture-improvements/releases/tag/gnome46)

## Customization

## Battery energy-mode

Sometimes it has happened to me that the laptop doesn't charge up to **100%**, and when I check its maximum capacity, it's at **80%**. Therefore, the battery optimizer has activated the **medium** setting by himself (bug?).

To fix it:

1. Don't connect the AC.
2. `echo 'medium' > battery_mode`
3. Reboot
4. `echo 'max' > battery_mode`
5. Reboot
6. Power Off
7. Charge it.

> ANOTHER WORKAROUND!

Reset the EC (press the back EC button for 30 seconds), let the laptop charge until the charging led goes off.

## Scripts

* performance_control: Change between different power modes (msi key)
