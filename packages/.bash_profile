#!/bin/bash
#


# Get the aliases and functions
if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi


PATH=$PATH:$HOME/.local/bin:$HOME/bin

export PATH


source ~/.bash_aliases
# TODO: Update your timezone
export TZ=America/Los_Angeles
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH

# Define IP address of box
THEIP_TMP=$(ifconfig  | grep 'inet ' | head -n2 | grep -v '127.0.0.1' | cut -d: -f2 | awk '{ print $2","}')
THEIP=`echo -e  "[ ${THEIP_TMP//[$'\t\r\n']} ]"`

# Add Prompt for Git/Mercural/Subversion branch info
source ~/.bash_prompt
PROMPT_COMMAND=set_bash_prompt

clear

echo -e "${BBlue}"
echo " __   __  _______  _     _  ___      ___   __    _  _______      ";
echo "|  | |  ||       || | _ | ||   |    |   | |  |  | ||       |     ";
echo "|  |_|  ||   _   || || || ||   |    |   | |   |_| ||    ___|     ";
echo "|       ||  | |  ||       ||   |    |   | |       ||   | __      ";
echo "|       ||  |_|  ||       ||   |___ |   | |  _    ||   ||  |     ";
echo "|   _   ||       ||   _   ||       ||   | | | |   ||   |_| |     ";
echo "|__| |__||_______||__| |__||_______||___| |_|  |__||_______|     ";
echo "                        _______  _______  ___   ___      _______ ";
echo "                       |       ||   _   ||   | |   |    |       |";
echo "               ____    |  _____||  |_|  ||   | |   |    |  _____|";
echo "              |____|   | |_____ |       ||   | |   |    | |_____ ";
echo "                       |_____  ||       ||   | |   |___ |_____  |";
echo "                        _____| ||   _   ||   | |       | _____| |";
echo "                       |_______||__| |__||___| |_______||_______|";
echo ""
echo -e "${BGreen}Useful Command: mdviewer, sshkey, bsh, src, sssh, .2 .3 .4, c, path"
echo ""
echo -e "${BGWhite}"

alias sshkey='cat ~/.ssh/id_rsa.pub'
alias bsh='vim ~/.bash_profile'
alias src='source ~/.bash_profile'
alias sssh='ssh -i ~/.ssh/id_rsa'
# Use SSH with id_rsa file

alias ls='ls -Ca'			   
alias lss='ls -C'			   
alias cp='cp -iv'                         
alias mv='mv -iv'                           
alias mkdir='mkdir -pv'                     
alias ll='ls -FClAhp'                       
cd() { builtin cd "$@"; ls -Cp; }              
# Always list directory contents upon 'cd'

alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias .2='cd ../../'                       # Go back 2 directory levels
alias .3='cd ../../../'                     # Go back 3 directory levels
alias .4='cd ../../../../'                  # Go back 4 directory levels
alias .5='cd ../../../../../'               # Go back 5 directory levels
alias .6='cd ../../../../../../'            # Go back 6 directory levels

alias ~="cd ~"                              
# ~:            Go Home

alias c='clear'                             
# c:            Clear #terminal display

alias which='type -all'                     
# which:        Find #executables

alias path='echo -e ${PATH//:/\\n}'         
# path:         Echo all #executable Paths

alias show_options='shopt'                  
# Show_options: display #bash options settings

alias fix_stty='stty sane'                  
# fix_stty:     Restore #terminal settings when screwed up

alias cic='set completion-ignore-case On'   
# cic:          Make #tab-completion case-insensitive

mcd () { mkdir -p "$1" && cd "$1"; }        
# mcd:          Makes #new Dir and jumps inside

function mdviewer(){
  pandoc $* | lynx -stdin
}
