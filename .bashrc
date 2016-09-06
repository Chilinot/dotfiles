#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# PATH
export PATH=$PATH:$HOME/.gem/ruby/2.3.0/bin

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

alias ll='ls -lF'

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
alias gl='git log --pretty=format:"%h$%ai$%cn$%G?: %s" --graph | column -t -s "$" | less'

# - Git commit
alias gc='git commit -S -m'

# - Git add
alias ga='git add -p'

# JD-GUI
alias jd='java -jar ~/jd-gui-1.4.0.jar'

# Load private settings (stuff that you shits should not know about!)
. ~/.private_bashrc

# Computer Graphics course
export ASSIGNMENT1_ROOT=$HOME/git/computer_graphics/assignment1
export ASSIGNMENT2_ROOT=$HOME/git/computer_graphics/assignment2
export ASSIGNMENT3_ROOT=$HOME/git/computer_graphics/assignment3
export PROJECT_ROOT=$HOME/git/computer_graphics/project

# Colorized man pages
# Source: http://boredzo.org/blog/archives/2016-08-15/colorized-man-pages-understood-and-customized
man() {
    env \
        LESS_TERMCAP_mb=$(printf "\e[1;31m") \
        LESS_TERMCAP_md=$(printf "\e[1;31m") \
        LESS_TERMCAP_me=$(printf "\e[0m") \
        LESS_TERMCAP_se=$(printf "\e[0m") \
        LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
        LESS_TERMCAP_ue=$(printf "\e[0m") \
        LESS_TERMCAP_us=$(printf "\e[1;32m") \
            man "$@"
}
