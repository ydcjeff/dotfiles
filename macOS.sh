# make in case they aren't already there
mkdir -p "/usr/local/lib"
mkdir -p "/usr/local/bin"

# Install common software
echo "\nDownloading Chrome...\n"
wget https://dl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg

echo "\nDownloading Brave...\n"
wget https://brave-browser-downloads.s3.brave.com/latest/Brave-Browser.dmg

echo "\nDownloading Telegram...\n"
wget https://osx.telegram.org/updates/Telegram.dmg

echo "\nDownloading AndroidFileTransfer...\n"
wget https://dl.google.com/dl/androidjumper/mtp/5071136/AndroidFileTransfer.dmg

echo "\nDownloading balenaEtcher...\n"
wget https://github.com/balena-io/etcher/releases/download/v1.5.79/balenaEtcher-1.5.79.dmg

echo "\nDownloading Xiami...\n"
wget https://gxiami.alicdn.com/xiami-desktop/update/XiamiMac756.dmg

echo "\nDownloading VirtualBox...\n"
wget https://download.virtualbox.org/virtualbox/6.1.4/VirtualBox-6.1.4-136177-OSX.dmg

echo "\nDownloading Nodejs...\n"
wget https://nodejs.org/dist/v12.16.1/node-v12.16.1.pkg

echo "\nDownloading Starship shell theme...\n"
curl -fsSL https://starship.rs/install.sh | bash

open https://iterm2.com/
open https://python.org/
open https://www.mozilla.org/en-US/firefox/new/
open https://sublimetext.com/
open https://code.visualstudio.com/
open https://git-scm.com/downloads/

# install common used font
echo "\nDownloading Hack font...\n"
wget https://github.com/source-foundry/Hack/releases/download/v3.003/Hack-v3.003-ttf.tar.gz
tar -zxf Hack-v3.003-ttf.tar.gz

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing Homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homebrew recipes
brew update

# Install and use latest yarn, hugo
brew install yarn hugo

sudo cp -Rv ~/.config/hyper/.hyper.js ~/.hyper.js

# Some git defaults
git config --global color.ui true
git config --global push.default simple

echo 'source ~/.config/bash/.bash_profile' >> ~/.bash_profile
echo 'source ~/.config/zsh/.zprofile' >> ~/.zshrc
source ~/.bash_profile
source ~/.zshrc
