alias c="clear"

# apt alias
alias ai="sudo apt install"
alias arm="sudo apt remove"
alias ap="sudo apt purge"
alias aud="sudo apt update"
alias aug="sudo apt upgrade"
alias aarm="sudo apt autoremove"
alias afug="sudo apt full-upgrade"
alias as="sudo apt search"
alias ash="sudo apt show"

# dnf alias
alias di="sudo dnf install"
alias drm="sudo dnf remove"
alias dcu="sudo dnf check-update"
alias ddg="sudo dnf downgrade"
alias dug="sudo dnf upgrade"
alias darm="sudo dnf autoremove"
alias dif="sudo dnf info"
alias dri="sudo dnf reinstall"

# git alias
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

# conda shortcuts
function kai
    conda activate $argv
end

alias guan="conda deactivate"

# starship theme
starship init fish | source
