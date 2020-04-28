
# check for uefi mode
ls /sys/firmware/efi/efivars

ip link

timedatectl set-ntp true

fdisk -l

fdisk /dev/sda

mkfs.ext4 /dev/sda1
mkswap /dev/sda2
swapon /dev/sda2

mount /dev/sda1 /mnt

pacstrap /mnt base base-devel linux linux-firmware vim nano make dhcpcd man-db man-pages texinfo

genfstab -U /mnt >> /mnt/etc/fstab

arch-chroot /mnt

ln -sf /usr/share/zoneinfo/Asia/Yangon /etc/localtime

hwclock --systohc

nano /etc/locale.gen

locale-gen

echo LANG=en_US.UTF-8 > /etc/locale.conf

export LANG=en_US.UTF-8

echo jeff > /etc/hostname

touch /etc/hosts

passwd

useradd -m jeff

passwd jeff

pacman -S grub intel-ucode amd-ucode coreutils tar less findutils diffutils grep gawk util-linux procps-ng file fzf

grub-install /dev/sda

grub-mkconfig -o /boot/grub/grub.cfg

pacman -S xorg xorg-server xorg-xinit networkmanager firefox pulseaudio ffmpeg
