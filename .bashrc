#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

alias ll='ls -laF'

# Set default sound card to PCH
export ALSA_CARD=PCH

# Enable 256 colors in the terminal
export TERM=konsole-256color
