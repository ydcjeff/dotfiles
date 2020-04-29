#!/bin/bash

DOTFILES_PATH=~/.config
BASH_SRC_PATH=$DOTFILES_PATH/bash

source "$BASH_SRC_PATH"/.aliases
source "$BASH_SRC_PATH"/.bashrc
source "$BASH_SRC_PATH"/.functions

if [[ ! "$SSH_TTY" && "$OSTYPE" =~ ^darwin ]]; then
	source "$BASH_SRC_PATH"/.macos
else
	source "$BASH_SRC_PATH"/.linux
fi

# edit this folder
alias dot="cd ~/.config"
# reload
alias rl="source ~/.bash_profile; echo '~/.bash_profile reloaded.'"
