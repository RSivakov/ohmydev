# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/rsivakov/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

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
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
git
brew
vscode
vagrant
# themes
sudo
supervisor
osx
npm
yarn
composer
# urltools
# git-flow
gpg-agent
# history
# homestead
# ansible
# alias-finder
# autoenv
# autojump
# aws
# battery
# boot2docker
# bgnotify
# branch
cask
# chucknorris
# colorize
# common-aliases
# compleat
# dash
docker
docker-compose
# docker-machine
dotenv
# emoji
# emoji-clock
# encode64
# extract
# flutter
# frontend-search
# copydir
# cp
# copyfile
git-auto-fetch
git-extras
# git-flow-avh
git-prompt
# git-remote-branch
github
# gitignore
gulp
# helm
iterm2
# jump
jira
jsontools
keychain
kubectl
# lol
# laravel
laravel5
last-working-dir
# man
# marked2
microk8s
minikube
mix
mosh
nmap
node
npm
pip
postgres
# pyenv
python
# rails
# redis-cli
# rsync
# repo
# ruby
# salt
# sdk
# sudo
# symfony
# symfony2
# systemadmin
# supervisor
# systemd
# terraform
thefuck
# themes
# torrent
# timer
# transfer
# vagrant-prompt
# vi-mode
# vim-interaction
virtualenv
# virtualenvwrapper
# wakeonlan
# web-search
xcode
zsh-navigation-tools
zsh_reload
# kube-ps1
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

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

### Added by Zplugin's installer
source "$HOME/.zplugin/bin/zplugin.zsh"
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin
### End of Zplugin installer's chunk
# source ~/.zplugin/bin/zplugin.zsh
export GPG_AGENT_INFO="~/.gnupg/S.gpg-agent:$(pgrep gpg-agent):1"
# if status --is-interactive
#   set -x GPG_AGENT_INFO
#   set -x GPG_TTY (tty)
#   set -x PINENTRY_USER_DATA "USE_CURSES=1"
#   echo "UPDATESTARTUPTTY" | gpg-connect-agent >/dev/null 2>&1
#   keychain --eval --noinherit --stop others --agents ssh,gpg id_rsa 7BXXX4D C0YYYYF0 | source
#   set gpg_info $HOME"/.gnupg/S.gpg-agent:"(pidof gpg-agent)":1"
#   set -x GPG_AGENT_INFO $gpg_info

#   set sh_gpg_cmd "GPG_AGENT_INFO="$gpg_info"; export GPG_AGENT_INFO"
#   set gpg_sh_file $HOME"/.keychain/"(hostname)"-sh-gpg"
#   echo $sh_gpg_cmd >$gpg_sh_file

#   set csh_gpg_cmd "setenv GPG_AGENT_INFO "$gpg_info
#   set gpg_csh_file $HOME"/.keychain/"(hostname)"-csh-gpg"
#   echo $csh_gpg_cmd >$gpg_csh_file

#   set fish_gpg_cmd "set -e GPG_AGENT_INFO; set -x -U GPG_AGENT_INFO "$gpg_info
#   set gpg_fish_file $HOME"/.keychain/"(hostname)"-fish-gpg"
#   echo $fish_gpg_cmd >$gpg_fish_file
# end

LIFE=28800
export GPG_AGENT_INFO="~/.gnupg/S.gpg-agent:$(pgrep gpg-agent):1"
eval `keychain --noask --eval --agents gpg,ssh --inherit any --timeout $LIFE id_rsa`
export GPG_TTY=`tty`