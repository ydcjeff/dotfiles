#!/bin/sh

# COLORS
# https://en.wikipedia.org/wiki/ANSI_escape_code#8-bit

export TERM=xterm-256color
RESET=$(tput sgr0)
RED=$(tput setaf 9)
GREEN=$(tput setaf 10)
YELLOW=$(tput setaf 11)
BLUE=$(tput setaf 12)
PURPLE=$(tput setaf 13)
CYAN=$(tput setaf 14)
INSTALL_DONE="installation done"
EXIST="exist, not installing"

clone_dotfiles() {
  echo "${YELLOW}==> Clone .dotfiles repo"
  if [ -d ~/.dotfiles ]; then
    echo "${CYAN}==> .dotfiles dir exist, not cloning${RESET}"
  else
    git clone https://github.com/ydcjeff/dotfiles ~/.dotfiles
    echo "${GREEN}==> cloned .dotfiles at ~${RESET}"
  fi
}

setup_macos() {
  # brew
  echo "${YELLOW}==> Homebrew installation${RESET}"
  if test ! $(which brew); then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo "${GREEN}==> Homebrew ${INSTALL_DONE}${RESET}"
  else
    echo "${CYAN}==> $(brew --version) ${EXIST}${RESET}"
  fi

  # git
  echo "${YELLOW}==> Git installation${RESET}"
  if test ! $(which git); then
    brew update
    brew install git
    echo "${GREEN}==> Git ${INSTALL_DONE}${RESET}"
  else
    echo "${CYAN}==> $(git --version) ${EXIST}${RESET}"
  fi

  links=(
    https://dl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg
    https://osx.telegram.org/updates/Telegram.dmg
    https://dl.google.com/dl/androidjumper/mtp/5071136/AndroidFileTransfer.dmg
    https://dl.devmate.com/com.macpaw.site.theunarchiver/TheUnarchiver.dmg
    https://iterm2.com/
    https://python.org/
    https://www.mozilla.org/en-US/firefox/new/
    https://discord.com/
    https://authy.com/download/
    https://bitwarden.com/download/
    https://sublimetext.com/
    https://www.sublimemerge.com/
    https://code.visualstudio.com/
    https://github.com/source-foundry/Hack/releases/download/v3.003/Hack-v3.003-ttf.tar.gz
  )

  for l in ${links[@]}
  do
    echo "${GREEN}==> opening ${l}${RESET}"
    open ${l}
    sleep 3
  done
  echo "${GREEN}==> macOS setup complete${RESET}"
}

setup_archlinux() {
  echo "${YELLOW}==> Arch Linux setup${RESET}"
  echo "${YELLOW}==> add sublime text and merge repo${RESET}"

  curl -O https://download.sublimetext.com/sublimehq-pub.gpg && \
  sudo pacman-key --add sublimehq-pub.gpg && sudo pacman-key --lsign-key 8A8F901A && rm sublimehq-pub.gpg
  echo -e "\n[sublime-text]\nServer = https://download.sublimetext.com/arch/stable/x86_64" | sudo tee -a /etc/pacman.conf

  sudo pacman -Syu --noconfirm --color always \
    git \
    wget \
    unzip \
    unrar \
    telegram-desktop \
    nodejs \
    npm \
    sublime-text \
    sublime-merge \
    code \
    python \
    python-pip \
    zsh \
    neofetch \
    firefox \
    xfce4-screenshooter \

  echo "${YELLOW}==> download Hack font${RESET}"
  curl -L https://github.com/source-foundry/Hack/releases/download/v3.003/Hack-v3.003-ttf.tar.gz --output hack.tar.gz
  tar -xzvf hack.tar.gz
  sudo cp -Rv ~/.config/ttf/*.ttf /usr/share/fonts/
  fc-cache -f -v
  fc-list | grep "Hack"

  echo "${GREEN}==> Arch Linux setup complete${RESET}"
}

install_starship() {
  echo "${YELLOW}==> Starship installation${RESET}"

  if test ! $(which starship); then
    curl -fsSL https://starship.rs/install.sh | bash
    echo "${GREEN}==> Starship ${INSTALL_DONE}${RESET}"
  else
    echo "${CYAN}==> $(starship -V) ${EXIST}${RESET}"
  fi

  export STARSHIP_CONFIG=~/.dotfiles/starship.toml
}

source_dot_files() {
  # source dot files
  if [ $(basename $SHELL) = "zsh" ]; then
    echo "source ~/.dotfiles/shrc" > ~/.zshrc
    source ~/.zshrc
  elif [$(basename $SHELL) = "bash" ]; then
    echo "source ~/.dotfiles/shrc" > ~/.bashrc
    source ~/.bashrc
  fi
}

main() {
  clone_dotfiles
  cd ~/.dotfiles
  git submodule update --init --recursive

  if [ $(uname) = "Darwin" ]; then
    setup_macos
  elif [ $(uname) = "Linux" ]; then
    setup_archlinux
  fi

  install_starship
  source_dot_files

  # Some git defaults
  git config --global color.ui true
  git config --global push.default simple
}

main
