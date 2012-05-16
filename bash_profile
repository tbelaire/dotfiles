
olddir=$(pwd)

dots=~/dotfiles

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
            echo "Recursing into $file";
            cd $file;
            sourceDir $file;
            cd ..;
        elif [[ $file == *.path ]]; then
            echo "$file is a .path";
            source $file;
        fi
    done
}
cd $dots
source prompt
sourceDir
cd $olddir



export EDITOR=vim
#alias ls='ls -F --color=auto'
#alias ll='ls -lA'
# Ignore line that start with spaces, and duplicate lines
export HISTCONTROL=ignoreboth



