fdisk -l

fdisk /dev/sda

ls /sys/firmware/efi/efivars

mkfs.ext4 /dev/sda1

pacman -Syy

pacman -S reflector

cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak

reflector -c "US" -f 12 -l 10 -n 12 --save /etc/pacman.d/mirrorlist

mount /dev/sda1 /mnt

pacstrap /mnt base linux linux-firmware vim nano make

genfstab -U /mnt >> /mnt/etc/fstab

arch-chroot /mnt

timedatectl list-timezones

timedatectl set-timezone Asia/Yangon

locale-gen
echo LANG=en_US.UTF-8 > /etc/locale.conf
export LANG=en_US.UTF-8

echo jeff > /etc/hostname

touch /etc/hosts

passwd

useradd -m jeff

passwd jeff

pacman -S grub

grub-install /dev/sda

grub-mkconfig -o /boot/grub/grub.cfg

pacman -S xorg xorg-server lightdm NetworkManager

systemctl start lightdm.service
systemctl enable lightdm.service
systemctl enable NetworkManager.service

exit

shutdown now
