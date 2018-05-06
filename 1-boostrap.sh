# format partitions
mkfs.ext4 /dev/sda1
mkswap /dev/sda2
swapon /dev/sda2

# install
mount /dev/sda1 /mnt
pacstrap /mnt base

genfstab -U /mnt >> /mnt/etc/fstab

# copy chroot-install scripts
cp 2-postinstall.sh /mnt/root
arch-chroot /mnt /root/2-postinstall.sh
echo 'exited from chroot'
