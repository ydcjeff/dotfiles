# make in case they aren't already there
mkdir -p "/usr/local/lib"
mkdir -p "/usr/local/bin"

# update the system
sudo dnf update

# Install common software
echo "\nDownloading Chrome...\n"
curl -L https://dl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg --output chrome.dmg

echo "\nInstalling Brave...\n"
sudo dnf install dnf-plugins-core

sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/x86_64/

sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc

sudo dnf install brave-browser

echo "\nInstalling Telegram...\n"
curl -L https://updates.tdesktop.com/tlinux/tsetup.1.9.21.tar.xz --output telegram.tar.xz
tar -zxf telegram.tar.xz

echo "\nInstalling balenaEtcher...\n"
sudo wget https://balena.io/etcher/static/etcher-rpm.repo -O /etc/yum.repos.d/etcher-rpm.repo

sudo dnf install -y balena-etcher-electron

echo "\nInstalling Nodejs...\n"
sudo dnf install nodejs

echo "\nDownloading Miniconda...\n"
curl -L https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh --output miniconda.sh

echo "\nInstalling Starship shell theme...\n"
curl -fsSL https://starship.rs/install.sh | bash

echo "\nInstalling Sublime Text 3...\n"
sudo rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg
sudo dnf config-manager --add-repo https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo
sudo dnf install sublime-text

open https://code.visualstudio.com/
open https://hyper.is/

echo "\nInstalling Git"
sudo dnf install git-all

# install common used font
echo "\nDownloading Hack font...\n"
curl -L https://github.com/source-foundry/Hack/releases/download/v3.003/Hack-v3.003-ttf.tar.gz --output hack.tar.gz
tar -zxf hack.tar.gz

sudo cp -R ~/ttf/Hack-Regular.ttf ~/usr/local/share/fonts/
fc-cache -f -v
fc-list | grep "Hack"

# Install and use latest yarn, hugo and fish shell
curl --silent --location https://dl.yarnpkg.com/rpm/yarn.repo | sudo tee /etc/yum.repos.d/yarn.repo

sudo dnf install yarn hugo fish

sudo cp -Rv ~/.dotfiles/hyper/.hyper.js ~/.hyper.js && sudo cp -Rv ~/.dotfiles/conda/.condarc ~/.condarc && sudo cp -Rv ~/.dotfiles/fish/config.fish ~/.config/fish/config.fish && sudo cp -Rv ~/.dotfiles/starship.toml ~/.config/starship.toml

# Some git defaults
git config --global color.ui true
git config --global push.default simple
git config --global user.name "ydcjeff"
git config --global user.email "ydcjeff@outlook.com"

echo 'source ~/.dotfiles/bash/.profile' >> ~/.profile
source ~/.profile
