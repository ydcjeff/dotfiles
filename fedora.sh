# make in case they aren't already there
mkdir -p "/usr/local/lib"
mkdir -p "/usr/local/bin"

# upgrade the system
sudo dnf upgrade

# Install common software
echo -e "\nDownloading Chrome...\n"
wget https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm

echo -e "\nInstalling Brave...\n"
sudo dnf install dnf-plugins-core

sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/x86_64/

sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc

sudo dnf install brave-browser

echo -e "\nInstalling Telegram...\n"
wget https://updates.tdesktop.com/tlinux/tsetup.1.9.21.tar.xz
tar -zxf tsetup.1.9.21.tar.xz

echo -e "\nInstalling balenaEtcher...\n"
sudo wget https://balena.io/etcher/static/etcher-rpm.repo -O /etc/yum.repos.d/etcher-rpm.repo

sudo dnf install -y balena-etcher-electron

echo -e "\nInstalling Nodejs...\n"
sudo dnf install nodejs fzf

echo -e "\nInstalling Starship shell theme...\n"
curl -fsSL https://starship.rs/install.sh | bash

echo -e "\nInstalling Sublime Text 3...\n"
sudo rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg
sudo dnf config-manager --add-repo https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo
sudo dnf install sublime-text

xdg-open https://code.visualstudio.com/
xdg-open https://hyper.is/

echo -e "\nInstalling Git"
sudo dnf install git-all bat

# install common used font
echo -e "\nDownloading Hack font...\n"
curl -L https://github.com/source-foundry/Hack/releases/download/v3.003/Hack-v3.003-ttf.tar.gz --output hack.tar.gz
tar -zxf hack.tar.gz

sudo cp -Rv ~/.config/ttf/*.ttf /usr/share/fonts/
fc-cache -f -v
fc-list | grep "Hack"

# Install and use latest yarn
curl --silent --location https://dl.yarnpkg.com/rpm/yarn.repo | sudo tee /etc/yum.repos.d/yarn.repo

sudo dnf install yarn python3 python3-wheel python3-pip neofetch

sudo cp -Rv ~/.config/hyper/.hyper.js ~/.hyper.js

# Some git defaults
git config --global color.ui true
git config --global push.default simple

echo 'source ~/.config/bash/.bash_profile' >> ~/.bash_profile
echo 'source ~/.config/zsh/.zprofile' >> ~/.zshrc
source ~/.bash_profile
source ~/.zshrc
