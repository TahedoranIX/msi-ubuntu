# msi-ubuntu

Set of parameters and scripts to customize ubuntu for msi-modern-14 c7m

## Links

* [msi-ec](https://github.com/BeardOverflow/msi-ec)
* [Random brightness fix](https://askubuntu.com/a/1487963)

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
```

reboot the system

### Workaround for mute key LED

Follow this link: [link](https://askubuntu.com/questions/125367/enabling-mic-mute-button-and-light-on-lenovo-thinkpads)

And use the scripts provided in scripts directory

## GNOME extensions

[Gestures](https://github.com/jamespo/gnome-gesture-improvements/releases/tag/gnome46)

## Customization

## Battery energy-mode

Sometimes it has happened to me that the laptop doesn't charge up to **100%**, and when I check its maximum capacity, it's at **80%**. Therefore, the battery optimizer has activated the **medium** setting by himself (bug?).

To fix it:

1. `echo 'medium' > battery_mode`
2. Reboot
3. `echo 'max' > battery_mode`
4. Reboot
5. Charge it.

## Scripts

* performance_control: Change between different power modes (msi key)
