
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

addToPath ~/bin

function sourceDir(){
    for file in *; do  # sets $file to * if empty directory
        #echo "saw $file";
        if [ -d $file ] && [ $(hostname) = $file ]; then
            echo "Recursing into $file";
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
# Ignore line that start with spaces, and duplicate lines
export HISTCONTROL=ignoreboth



