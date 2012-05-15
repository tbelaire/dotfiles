
# To provide a coloured version of $?, wrapped in ().  Used in PS1
pretty_exit_code(){
  LAST_COMMAND_STATUS=$?
  if [ $LAST_COMMAND_STATUS = 0 ];
  then echo -e "\033[33m($LAST_COMMAND_STATUS)\033[0m";
  else echo -e "\033[31m($LAST_COMMAND_STATUS)\033[0m";
  fi
}
PS1="\$(pretty_exit_code)\[\e[32;1m\]\u@\h:\[\e[34;1m\]\w \n\$ \[\e[0m\]"

export EDITOR=vim
#alias ls='ls -F --color=auto'
#alias ll='ls -lA'
# Ignore line that start with spaces, and duplicate lines
export HISTCONTROL=ignoreboth


# set PATH so it includes user's private bin if it exists
if [ -d ~/bin ] ; then
    PATH=~/bin:"${PATH}"
fi
