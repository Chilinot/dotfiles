source "${ZDOTDIR:-${HOME}}/.zshrc-`uname`"

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="bira"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR='nvim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Git
alias gap='ga -p' # git add -p
alias gc='git commit'
alias gl='git log --branches --remotes --tags --graph --oneline --decorate'

# General
# - Always use nvim instead of regular vim
alias vim='nvim'

# Ansible
export ANSIBLE_INVENTORY=~/ansible_hosts

# Docker
export DOCKER_ID_USER="lucasemanuel"

# NPM
export NPM_PACKAGES=~/.npm-packages
export PATH="$NPM_PACKAGES/bin:$PATH"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# Stop all Docker containers
alias dsa='docker stop $(docker ps -q)'

# AWS
export AWS_DEFAULT_REGION=eu-west-1
# - Instruct the SDK to explicitly load the aws config.
# - Necessary to get aws-vault and terraform working when using `credential_process` in your config.
export AWS_SDK_LOAD_CONFIG=1

# - list active AWS keys
#alias awl='aws-jumpcloud list'

# - Get access keys for either production or my lab account
#alias awprod='aws-jumpcloud exec prod -- true && eval "$(aws-jumpcloud export prod)"'
alias awprod='export AWS_PROFILE=prod'
#alias awlab='aws-jumpcloud exec lab -- true && eval "$(aws-jumpcloud export lab)"'
alias awlab='export AWS_PROFILE=test-lucas'

# - List EC2 instances with some useful info
alias awec2="aws ec2 describe-instances --query 'Reservations[].Instances[].{Name: Tags[?Key==\`Name\`].Value | [0], ID: InstanceId, Type: InstanceType, PublicIp: PublicIpAddress, Tags: join(\`, \`, Tags[?Key != \`Name\`].[Key, Value][*].join(\`: \`, @)), PrivateIp: PrivateIpAddress }' --output table"
alias awvpc="aws ec2 describe-vpcs --query 'Vpcs[*].{Name: Tags[?Key == \`Name\`] | [0].Value, CIDR: CidrBlock, State: State, Tags: join(\`, \`, Tags[?Key != \`Name\`].[Key, Value][*].join(\`: \`, @))}' --output table"
alias awsub="aws ec2 describe-subnets --query 'Subnets[*].{AZ: AvailabilityZone, CIDR: CidrBlock, State: State, VPC: VpcId, Tags: join(\`, \`, Tags[?Key != \`Name\`].[Key, Value][*].join(\`: \`, @)), Name: Tags[?Key ==\`Name\`] | [0].Value}' --output table"

# History
# - set history size
export HISTSIZE=1000000
# - save history after logout
export SAVEHIST=1000000
# - history file
export HISTFILE=~/.zhistory
# - append into history file
setopt INC_APPEND_HISTORY
# - save only one command if 2 common are same and consistent
setopt HIST_IGNORE_DUPS
# - add timestamp for each entry
setopt EXTENDED_HISTORY

# Enable bash autocompletion
autoload -U +X bashcompinit && bashcompinit

# Add Hashicorp-vault auto completions
complete -o nospace -C /usr/local/bin/vault vault
