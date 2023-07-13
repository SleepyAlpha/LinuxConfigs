#!/bin/bash

# Stop Services
systemctl stop gdm
systemctl stop overclock    
#systemctl stop amdgpu-fancontrol

# Unbind VTconsoles: might not be needed
echo 0 > /sys/class/vtconsole/vtcon0/bind
echo 0 > /sys/class/vtconsole/vtcon1/bind

# Unload kernel modules
modprobe -r amdgpu

echo 13 > /sys/bus/pci/devices/0000:28:00.0/resource0_resize
echo 1 > /sys/bus/pci/devices/0000:28:00.0/resource2_resize

# Detach PCI devices from host
virsh nodedev-detach pci_0000_28_00_0
virsh nodedev-detach pci_0000_28_00_1

# Load vfio module
modprobe vfio-pci
