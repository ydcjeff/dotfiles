# make in case they aren't already there
mkdir -p "/usr/local/lib"
mkdir -p "/usr/local/bin"

# upgrade the system
sudo apt upgrade

# Install common software
echo -e "\nDownloading Chrome...\n"
curl -L https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.deb --output Chrome.deb

echo -e "\nInstalling Brave...\n"
sudo apt install apt-transport-https curl
curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -

echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list

sudo apt update

sudo apt install brave-browser

echo -e "\nInstalling Telegram...\n"
curl -L https://updates.tdesktop.com/tlinux/tsetup.1.9.21.tar.xz --output telegram.tar.xz
tar -zxf telegram.tar.xz

echo -e "\nInstalling balenaEtcher...\n"
echo "deb https://deb.etcher.io stable etcher" | sudo tee /etc/apt/sources.list.d/balena-etcher.list

sudo apt-key adv --keyserver hkps://keyserver.ubuntu.com:443 --recv-keys 379CE192D401AB61

sudo apt-get update
sudo apt-get install balena-etcher-electron

echo -e "\nInstalling Nodejs...\n"
sudo apt install nodejs

echo -e "\nDownloading Miniconda...\n"
curl -L https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh --output miniconda.sh

echo -e "\nInstalling Starship shell theme...\n"
curl -fsSL https://starship.rs/install.sh | bash

echo -e "\nInstalling Sublime Text 3...\n"
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt-get install apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt update
sudo apt install sublime-text

xdg-open https://code.visualstudio.com/
xdg-open https://hyper.is/

echo -e "\nInstalling Git"
sudo apt install git-all

# install common used font
echo -e "\nDownloading Hack font...\n"
curl -L https://github.com/source-foundry/Hack/releases/download/v3.003/Hack-v3.003-ttf.tar.gz --output hack.tar.gz
tar -zxf hack.tar.gz

sudo cp -Rv ~/ttf/Hack-Regular.ttf ~/usr/local/share/fonts/
fc-cache -f -v
fc-list | grep "Hack"

# Install and use latest yarn, hugo and fish shell
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update && sudo apt install yarn fish

sudo cp -Rv ~/.dotfiles/hyper/.hyper.js ~/.hyper.js && sudo cp -Rv ~/.dotfiles/conda/.condarc ~/.condarc && sudo cp -Rv ~/.dotfiles/fish/config.fish ~/.config/fish/config.fish && sudo cp -Rv ~/.dotfiles/starship.toml ~/.config/starship.toml

# Some git defaults
git config --global color.ui true
git config --global push.default simple
git config --global user.name "ydcjeff"
git config --global user.email "ydc.jeff@gmail.com"

echo 'source ~/.dotfiles/bash/.profile' >> ~/.profile
source ~/.profile
