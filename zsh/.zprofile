#!/bin/zsh

DOTFILES_PATH=~/.config
ZSH_SRC_PATH=$DOTFILES_PATH/zsh

source "$ZSH_SRC_PATH"/.aliases
source "$ZSH_SRC_PATH"/.zshrc
source "$ZSH_SRC_PATH"/.functions

if [[ ! "$SSH_TTY" && "$OSTYPE" =~ ^darwin ]]; then
	source "$ZSH_SRC_PATH"/.macos
else
	source "$ZSH_SRC_PATH"/.linux
fi

# edit this folder
alias dot="cd ~/.config"
# reload
alias rl="source ~/.zshrc; echo '~/.zprofile reloaded.'"
