# remove fish shell greeting
set fish_greeting

# starship theme env variable
# set -x STARSHIP_CONFIG $HOME/.dotfiles/

# conda configs
eval $HOME/miniconda3/bin/conda "shell.fish" "hook" $argv | source

alias c="clear"

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
