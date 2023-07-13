#!/bin/bash

# Attach PCI devices to host
virsh nodedev-reattach pci_0000_28_00_0
virsh nodedev-reattach pci_0000_28_00_1

# Unload vfio module
modprobe -r vfio-pci

echo 13 > /sys/bus/pci/devices/0000:28:00.0/resource0_resize
echo 8 > /sys/bus/pci/devices/0000:28:00.0/resource2_resize

# Load kernel modules
modprobe amdgpu

# Bind VTconsoles: might not be needed
echo 1 > /sys/class/vtconsole/vtcon0/bind
echo 1 > /sys/class/vtconsole/vtcon1/bind

# Restart Services
systemctl start gdm
systemctl start overclock
#systemctl start amdgpu-fancontrol
