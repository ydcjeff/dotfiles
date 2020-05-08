# make in case they aren't already there
mkdir -p "/usr/local/lib"
mkdir -p "/usr/local/bin"

pacman -S gtk-engine-murrine gtk-engines git wget unzip compton unrar terminology

git clone https://github.com/vinceliuice/vimix-gtk-themes.git ~/.vimix-gtk-themes
cd ~/.vimix-gtk-themes && ./install.sh

cd

echo -e "\nDownloading Papirus Icon theme...\n"
wget -qO- https://git.io/papirus-icon-theme-install | sh

# Install common software
echo -e "\nDownloading Chrome...\n"
git clone https://aur.archlinux.org/google-chrome.git ~/.chrome

echo -e "\nDownloading Brave...\n"
git clone https://aur.archlinux.org/brave.git ~/.brave

echo -e "\nInstalling Starship shell theme...\n"
curl -fsSL https://starship.rs/install.sh | bash

echo -e "\nInstalling Sublime Text 3...\n"
curl -O https://download.sublimetext.com/sublimehq-pub.gpg && sudo pacman-key --add sublimehq-pub.gpg && sudo pacman-key --lsign-key 8A8F901A && rm sublimehq-pub.gpg
echo -e "\n[sublime-text]\nServer = https://download.sublimetext.com/arch/stable/x86_64" | sudo tee -a /etc/pacman.conf

xdg-open https://hyper.is/
xdg-open https://balena.io/etcher/

# install common used font
echo -e "\nDownloading Hack font...\n"
curl -L https://github.com/source-foundry/Hack/releases/download/v3.003/Hack-v3.003-ttf.tar.gz --output hack.tar.gz
tar -zxf hack.tar.gz

sudo cp -Rv ~/.config/ttf/*.ttf /usr/share/fonts/
fc-cache -f -v
fc-list | grep "Hack"

sudo cp -Rv ~/.config/hyper/.hyper.js ~/.hyper.js

# Some git defaults
git config --global color.ui true
git config --global push.default simple

sudo pacman -S telegram-desktop nodejs npm fzf sublime-text yarn code python python-pip zsh neofetch i3 dmenu firefox pulseaudio ffmpeg parole xfce4-screenshooter volumeicon pulseaudio-alsa pulseaudio-bluetooth pulseaudio-equalizer pulseaudio-jack pulseaudio-lirc pulseaudio-zeroconf nitrogen pavucontrol bat

echo 'source ~/.config/bash/.bash_profile' >> ~/.bash_profile
echo 'source ~/.config/zsh/.zprofile' >> ~/.zshrc
source ~/.bash_profile
source ~/.zshrc

