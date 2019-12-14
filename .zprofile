
# Setting PATH for Python 3.7
# The original version is saved in .zprofile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin:${PATH}"
export PATH
export PATH="/usr/bin/subl:$PATH"
export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="/usr/local/lib/ruby/gems/2.6.0/bin:$PATH"
export PATH="/Users/ydc/.local/bin:$PATH"

# alias kai="source ./zzz/bin/activate"

alias guan="conda deactivate"
alias c="clear"
alias l="ls | lolcat -F"
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gp="git push"
alias xin="sudo apt-get update && sudo apt-get upgrade && sudo apt-get dist-upgrade"

export PATH=~/bin:/Users/ydc/.local/bin:/usr/local/lib/ruby/gems/2.6.0/bin:/usr/local/opt/ruby/bin:/Library/Frameworks/Python.framework/Versions/3.7/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/Apple/usr/bin:/Library/Apple/bin
export PATH=~/bin:/Users/ydc/bin:/Users/ydc/.local/bin:/usr/local/lib/ruby/gems/2.6.0/bin:/usr/local/opt/ruby/bin:/Library/Frameworks/Python.framework/Versions/3.7/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/Apple/usr/bin:/Library/Apple/bin

function kai(){
    conda activate "$1"
}
<<<<<<< HEAD
=======

export PATH="$HOME/.cargo/bin:$PATH"

if [ -d "$HOME/adb-fastboot/platform-tools" ] ; then
 export PATH="$HOME/adb-fastboot/platform-tools:$PATH"
fi

>>>>>>> 9403456a7874a12dea83b8e90a067040de09145d
