# The following lines were added by compinstall
zstyle :compinstall filename '/home/user/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install

# Default editor
export EDITOR=vim

# GIT
# - Git pull
alias gp='git pull'

# - Git pull --rebase
alias gpr='git pull --rebase'

# - Git log
#alias gl='git log --pretty=format:"%h$%ai$%cn$%G?: %s" --graph | column -t -s "$" | less'
alias gl='git log --all --decorate --oneline --graph --date=relative'

# - Git commit
alias gc='git commit -S -m'

# - Git add
alias ga='git add -p'

# Use Vimx instaed of regular vim (in order to access system clipboard)
alias vim='vimx'
