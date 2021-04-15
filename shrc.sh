#!/usr/bin/env sh


# set default editor
export EDITOR="code"
export VISUAL="$EDITOR"
export DOTFILES_PATH=$HOME/.dotfiles
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export STARSHIP_CONFIG=$HOME/.dotfiles/starship.toml

source "$DOTFILES_PATH"/aliases.sh
source "$DOTFILES_PATH"/functions.sh

# mac or linux
if [ $(uname) = "Darwin" ]; then
  echo "> macOS profile loaded."
  export CLICOLOR=1
  export LSCOLORS=ExGxdxDxCxegedhbadaced
  alias ls="ls -1F"
elif [ $(uname) = "Linux" ]; then
  echo "> Linux profile loaded."
  alias ls="ls --color=auto"
fi


# starship shell theme
if [ $(basename $SHELL) = "zsh" ]; then
  eval "$(starship init zsh)"
  # reload
  alias rl="source $HOME/.zshrc; echo '$HOME/.zshrc reloaded.'"
  # zsh extras
  source "$DOTFILES_PATH"/zsh-autosuggestions/zsh-autosuggestions.zsh
  source "$DOTFILES_PATH"/zsh-history-substring-search/zsh-history-substring-search.zsh
  source "$DOTFILES_PATH"/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

elif [ $(basename $SHELL) = "bash" ]; then
  eval "$(starship init bash)"
  # reload
  alias rl="source $HOME/.bashrc; echo '$HOME/.bashrc reloaded.'"
fi
