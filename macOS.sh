# make in case they aren't already there
mkdir -p "/usr/local/lib"
mkdir -p "/usr/local/bin"

# Install common software
echo "Downloading Chrome..."
curl -L https://dl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg --output chrome.dmg
echo "Downloading Brave..."
curl -L https://brave-browser-downloads.s3.brave.com/latest/Brave-Browser.dmg --output brave.dmg
echo "Downloading Telegram..."
curl -L https://osx.telegram.org/updates/Telegram.dmg --output telegram.dmg
echo "Downloading AndroidFileTransfer..."
curl -L https://dl.google.com/dl/androidjumper/mtp/5071136/AndroidFileTransfer.dmg AndroidFileTransfer.dmg
echo "Downloading balenaEtcher..."
curl -L https://github.com/balena-io/etcher/releases/download/v1.5.79/balenaEtcher-1.5.79.dmg --output etcher.dmg
echo "Downloading Xiami..."
curl -L https://gxiami.alicdn.com/xiami-desktop/update/XiamiMac756.dmg --output xiami.dmg
echo "Downloading VirtualBox..."
curl -L https://download.virtualbox.org/virtualbox/6.1.4/VirtualBox-6.1.4-136177-OSX.dmg --output vbox.dmg
echo "Downloading Nodejs..."
curl -L https://nodejs.org/dist/v12.16.1/node-v12.16.1.pkg --output node.pkg
echo "Downloading Miniconda..."
curl -L https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh --output miniconda.sh
echo "Downloading Starship shell theme..."
curl -fsSL https://starship.rs/install.sh | bash
open https://www.alfredapp.com/
open https://iterm2.com/
open https://python.org/
open https://https://www.mozilla.org/en-US/firefox/new/
open https://sublimetext.com/
open https://code.visualstudio.com/
open https://git-scm.com/downloads/
open https://www.sublimetext.com/docs/3/osx_command_line.html/

# install common used font
echo "Downloading Hack font..."
curl -L https://github.com/source-foundry/Hack/releases/download/v3.003/Hack-v3.003-ttf.tar.gz --output hack.tar.gz
tar -zxf hack.tar.gz

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing Homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homebrew recipes
brew update

# Install and use latest bash
brew install bash yarn hugo fish
chsh -s /usr/local/bin/bash

sudo cp -R ~/.dotfiles/hyper/.hyper.js ~/.hyper.js && sudo cp -R ~/.dotfiles/conda/.condarc ~/.condarc && sudo cp -R ~/.dotfiles/fish/config.fish ~/.config/fish/config.fish

# Some git defaults
git config --global color.ui true
git config --global push.default simple
git config --global user.name "ydcjeff"
git config --global user.email "ydcjeff@outlook.com"

echo 'source ~/.dotfiles/bash/.profile' >> ~/.profile
source ~/.profile