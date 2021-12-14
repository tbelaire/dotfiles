

dots=${DOTFILES:-~/dotfiles}

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
        # echo "saw $file";
        if [[ -d "$file" ]] && 
            [[ $(hostname -f) = *"${file}"* ]] || [[ $(uname) = "${file}" ]]; then
            # echo "Recursing into $file";
            cd "$file";
            sourceDir "$file";
            cd ..;
        elif [[ "$file" == *.path ]]; then
            # echo "$file is a .path";
            source "$file";
        fi
    done
}

pushd $dots > /dev/null

source ~/dotfiles/git-completion.bash

source colours
source prompt
sourceDir

popd > /dev/null


export EDITOR=nvim
# Ignore line that start with spaces, and duplicate lines
export HISTCONTROL=ignoreboth

if [ $TERM == "screen" ]; then
    TERM=screen-256color
fi


export PATH="$HOME/.cargo/bin:$PATH"

export PATH="$HOME/.poetry/bin:$PATH"
