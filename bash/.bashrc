#!/bin/bash

export STARSHIP_CONFIG=~/.dotfiles

# starship theme
eval "$(starship init bash)"

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

source "$DOTFILES_PATH"/git/git-completion.bash
source "$DOTFILES_PATH"/git/git-prompt.sh
