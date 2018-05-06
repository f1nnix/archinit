# format partitions
mkfs.ext4 /dev/sda1
mkswap /dev/sda2
swapon /dev/sda2

# install
mount /dev/sda1 /mnt
pacstrap /mnt base

genfstab -U /mnt >> /mnt/etc/fstab

# copy chroot-install scripts
CHROOT_CMD="echo 'local' > /etc/hostname
mkinitcpio -p linux
echo 'Setup root password':
passwd

# grub
pacman -Suy grub
grub-install --target=i386-pc /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg"
echo $CHROOT_CMD > /mnt/root/install.sh
arch-chroot /mnt /root/install.sh
reboot
