#!/usr/bin/env sh

# COLORS
# https://en.wikipedia.org/wiki/ANSI_escape_code#8-bit

set -eo pipefail

export TERM=xterm-256color

RESET=$(tput sgr0)
RED=$(tput setaf 9)
GREEN=$(tput setaf 10)
YELLOW=$(tput setaf 11)
BLUE=$(tput setaf 12)
PURPLE=$(tput setaf 13)
CYAN=$(tput setaf 14)

info() {
  printf "%s\n" "${CYAN}> $*${RESET}"
}

warn() {
  printf "%s\n" "${YELLOW}! $*${RESET}"
}

error() {
  printf "%s\n" "${RED}x $*${RESET}"
}

success() {
  printf "%s\n" "${GREEN}✔ $*${RESET}"
}

clone_dotfiles() {
  info "Clone .dotfiles repo"
  if [ -d $HOME/.dotfiles ]; then
    info ".dotfiles dir exist, not cloning"
  else
    git clone https://github.com/ydcjeff/dotfiles $HOME/.dotfiles
    success "Cloned .dotfiles at $HOME"
  fi
}

setup_macos() {
  # brew
  info "Homebrew installation"
  if test ! $(which brew); then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    success "Homebrew installation done"
  else
    info "$(brew --version) exist, not installing"
  fi

  # git
  info "Git installation"
  if test ! $(which git); then
    brew update
    brew install git
    success "Git installation done"
  else
    info "$(git --version) exist, not installing"
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
    info "Opening ${l}"
    open ${l}
    sleep 1
  done
  success "macOS setup complete"
}

setup_archlinux() {
  info "Arch Linux setup"

  sudo pacman-key --init
  info "Add sublime text and merge repo"

  curl -O https://download.sublimetext.com/sublimehq-pub.gpg && \
  sudo pacman-key --add sublimehq-pub.gpg && sudo pacman-key --lsign-key 8A8F901A && rm sublimehq-pub.gpg
  echo -e "\n[sublime-text]\nServer = https://download.sublimetext.com/arch/stable/x86_64" | sudo tee -a /etc/pacman.conf

  sudo pacman -Syu --noconfirm --color always sublime-text sublime-merge
  sudo pacman -Syu --noconfirm --color always \
    git \
    wget \
    unzip \
    unrar \
    telegram-desktop \
    nodejs \
    npm \
    code \
    python \
    python-pip \
    zsh \
    neofetch \
    firefox \
    xfce4-screenshooter \

  info "Download Hack font"
  curl -fsSL https://github.com/source-foundry/Hack/releases/download/v3.003/Hack-v3.003-ttf.tar.gz --output hack.tar.gz
  tar -xzvf hack.tar.gz
  sudo cp -Rv ttf/*.ttf /usr/share/fonts/
  fc-cache -f -v
  fc-list | grep "Hack"

  success "Arch Linux setup complete"
}

install_starship() {
  info "Starship theme installation"

  if test ! $(which starship); then
    curl -fsSL https://starship.rs/install.sh --output ./install.sh
    chmod +x ./install.sh
    ./install.sh -y
    success "Starship installation done"
  else
    info "$(starship -V) exist, not installing"
  fi

  export STARSHIP_CONFIG=$HOME/.dotfiles/starship.toml
}

source_dot_files() {
  # source dot files
  info "Sourcing dotfiles"

  if [ $(basename $SHELL) = "zsh" ]; then
    echo "source $HOME/.dotfiles/shrc.sh" > $HOME/.zshrc
    source $HOME/.zshrc
  elif [ $(basename $SHELL) = "bash" ]; then
    echo "source $HOME/.dotfiles/shrc.sh" > $HOME/.bashrc
    source $HOME/.bashrc
  fi
}

main() {
  clone_dotfiles
  cd $HOME/.dotfiles
  git submodule update --init --recursive

  install_starship
  source_dot_files

  if [ $(uname) = "Darwin" ]; then
    setup_macos
  elif [ $(uname) = "Linux" ]; then
    setup_archlinux
  fi

  # Some git defaults
  git config --global color.ui true
  git config --global push.default simple
}

main
