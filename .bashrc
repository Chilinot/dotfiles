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

# Git pull
alias gp='git pull'

# Git pull --rebase
alias gpr='git pull --rebase'

# Better git log
alias gl='git log --pretty=format:"%h %cd - %cn: %s" --graph'

# JD-GUI
alias jd='java -jar ~/jd-gui-1.4.0.jar'
