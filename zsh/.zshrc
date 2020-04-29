#!/bin/zsh

# starship theme
eval "$(starship init zsh)"

source "$DOTFILES_PATH"/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source "$DOTFILES_PATH"/zsh-autosuggestions/zsh-autosuggestions.zsh
source "$DOTFILES_PATH"/zsh-history-substring-search/zsh-history-substring-search.zsh

source "$DOTFILES_PATH"/git/git-completion.bash
# fpath=(~/.zsh $fpath)
source "$DOTFILES_PATH"/git/git-prompt.sh
