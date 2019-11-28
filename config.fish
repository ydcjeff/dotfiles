# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /Users/ydc/miniconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

export PATH="/usr/local/lib/ruby/gems/2.6.0/bin:$PATH"


# alias

alias guan="conda deactivate"
alias c="clear"
alias l="ls | lolcat -F"
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gp="git push"

function kai
    conda activate $argv
end

export PATH="$HOME/.cargo/bin:$PATH"

starship init fish | source
