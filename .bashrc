#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# PATH
export PATH=$PATH:$HOME/.gem/ruby/2.3.0/bin

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

alias ll='ls -laF'

# Set default Qt version
export QT_SELECT=4

# Set default sound card to PCH
export ALSA_CARD=PCH

# Enable 256 colors in the terminal
export TERM=konsole-256color

# Visual
export VISUAL="vim"

# Bind GVIM
alias gv='gvim'

# Load my private key
alias pk='eval `ssh-agent -s` && ssh-add ~/.ssh/id_rsa'

# Apktool
alias apktool='java -jar ~/apktool-cli.jar'

# Default editor
export EDITOR=vim

# GIT
# - Git pull
alias gp='git pull'

# - Git pull --rebase
alias gpr='git pull --rebase'

# - Git log
alias gl='git log --pretty=format:"%h$%ci$%cn$%G?: %s" --graph | column -t -s $'

# - Git commit
alias gc='git commit -S -m'

# - Git add
alias ga='git add'

# JD-GUI
alias jd='java -jar ~/jd-gui-1.4.0.jar'

# Load private settings (stuff that you shits should not know about!)
. ~/.private_bashrc

# Computer Graphics course
export ASSIGNMENT1_ROOT=$HOME/Syncthing/Sync/Skola/UU/Computer\ Graphics/assignment1
export ASSIGNMENT2_ROOT=$HOME/Syncthing/Sync/Skola/UU/Computer\ Graphics/assignment2
export ASSIGNMENT3_ROOT=$HOME/Syncthing/Sync/Skola/UU/Computer\ Graphics/assignment3
export ASSIGNMENT4_ROOT=$HOME/Syncthing/Sync/Skola/UU/Computer\ Graphics/assignment4
