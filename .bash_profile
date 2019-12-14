
# Setting PATH for Python 3.7
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin:${PATH}"
export PATH
export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="/usr/local/lib/ruby/gems/2.6.0/bin:$PATH"

alias guan="conda deactivate"
alias c="clear"
alias l="ls | lolcat -F"
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gp="git push"
alias xin="sudo apt-get update && sudo apt-get upgrade && sudo apt-get dist-upgrade"


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/ydc/google-cloud-sdk/path.bash.inc' ]; then . '/Users/ydc/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/ydc/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/ydc/google-cloud-sdk/completion.bash.inc'; fi
