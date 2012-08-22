
olddir=$(pwd)

dots=~/dotfiles

# not used yet, still hardcoded
extentions_to_source=".path"


function addToPath(){
    #if [[ $FOO =~ "fii" ]]; then
    #    echo hi
    #fi
    PATH="$1:$PATH"
}


function sourceDir(){
    for file in *; do  # sets $file to * if empty directory
        #echo "saw $file";
        if [ -d $file ]; then
            # echo "Recursing into $file";
            cd $file;
            sourceDir $file;
            cd ..;
        elif [[ $file == *.path ]]; then
            # echo "$file is a .path";
            source $file;
        fi
    done
}
cd $dots

source ~/dotfiles/git-completion.bash

source prompt
sourceDir
cd $olddir



export EDITOR=vim
alias ls='ls -G'
#alias ll='ls -lA'
# Ignore line that start with spaces, and duplicate lines
export HISTCONTROL=ignoreboth




( [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm") || echo "Couldn't load rvm shell sccript" 
# Load RVM into a shell session *as a function*


