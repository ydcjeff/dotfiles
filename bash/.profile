#!/bin/bash

export STARSHIP_CONFIG=~/.dotfiles/starship.toml

DOTFILES_PATH=~/.dotfiles # $HOME/.dotfiles
BASH_SRC_PATH=$DOTFILES_PATH/bash # $HOME/.dotfiles/bash

. "$BASH_SRC_PATH"/.aliases # $HOME/.dotfiles/bash/.aliases

# edit this folder
alias dot="cd ~/.dotfiles"
# reload
alias rl="source ~/.profile; echo '~/.profile reloaded.'"
