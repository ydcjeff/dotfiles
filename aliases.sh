#!/usr/bin/env sh

# directory navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# some shortcuts
alias la="ls -A"
alias ll="ls -Al"
alias c="clear"
alias rem="rm -rf"

# npm shortcuts
alias n="npm"
alias p="pnpm"
alias y="yarn"

# python shortcuts
alias py="python3"
alias pt="pytest"

# git shortcuts
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gb="git branch"
alias gd="git diff"
alias gcl="git clone"
alias gco="git checkout"
alias gp="git push"
alias gl="git pull"
alias gt="git tag"
alias gm="git merge"
alias gf="git fetch"
alias gr="git rebase"
alias gg="git log --graph --pretty=format:'%C(bold red)%h%Creset -%C(bold yellow)%d%Creset %s %C(bold green)(%cr) %C(bold blue)<%an>%Creset %C(yellow)%ad%Creset' --abbrev-commit --date=short"
alias ggr="git log --reverse --pretty=format:'%C(bold red)%h%Creset -%C(bold yellow)%d%Creset %s %C(bold green)(%cr) %C(bold blue)<%an>%Creset %C(yellow)%ad%Creset' --abbrev-commit --date=short"

# dotfiles
alias dot="cd ~/.dotfiles"

# recursively delete .DS_Store
alias dds="find . -name '*.DS_Store' -type f -ls -delete"

# recursively delete node_modules
alias nodemodules="find . -name "node_modules" -exec rm -rf '{}' +"
