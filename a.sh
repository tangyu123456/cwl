#!/bin/bash
read -p "请输入虚拟机名称:" name
if [ `virsh domstate $name | grep -q running`  ] ;then
        echo "破解,需要关闭虚拟机"
        virsh destroy $name
fi
mountpoint="/media/virtimage"
[ ! -d $mountpoint ]&& mkdir $mountpoint
        echo "请稍后..."
if [ `mount | grep -q "mountpoint"` ] ;then
        umount $mountpoint
fi
guestmount -d $name -i $mountpoint
sed -i "/^root/s/x//" $mountpoint/etc/passwd

