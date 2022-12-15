# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/.local/bin:$PATH

export PATH=$PATH:~/go/bin:
export PATH=$PATH:~/.cargo:
# add cuda to PATH
export PATH=$PATH:/usr/local/cuda/bin:
source $HOME/.cargo/env
export VENV_PATH=/pyenv

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# proxy

export HTTP_PROXY='http://127.0.0.1:7890'
export HTTPS_PROXY='http://127.0.0.1:7890'
export NO_PROXY=localhost,127.0.0.1,::1
# Color matching compatible with TMUX

#in my y7000p with ubuntu, It is not need it to add it
#export TERM=screen-256color

# plug: autojump configure
. /usr/share/autojump/autojump.sh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="robbyrussell"
#ZSH_THEME="agnoster"
#ZSH_THEME="ys"
#ZSH_THEME="theunraveler"
#ZSH_THEME="steeef"
#ZSH_THEME="astro"
#ZSH_THEME="xxf"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
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
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

# attention: zsh-syntax-highlighting should be the end of lists.
plugins=(zsh-autosuggestions git-open fzf-tab gitignore wakatime poetry docker cp safe-paste command-not-found zsh-syntax-highlighting )

# Commands starting with a space will not be recorded in the history file
# use for commands like: cd, ls, etc and type password
setopt HIST_IGNORE_SPACE

# This list is incomplete as there are too many frameworks / plugin managers to list them all here.

# zsh-history-substring-search
source $ZSH/oh-my-zsh.sh

# vim mode
bindkey -v

# let editor is vim default
export EDITOR=nvim

# zsh-history-substring-search
# source ~/.oh-my-zsh/custom/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANGUAGE=en_US
export LANG=en_US.UTF-8

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

# git

# gi for command line to create .gitignore
function gi() { curl -sLw n https://www.toptal.com/developers/gitignore/api/$@ ;}

# Git alias
# More in https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git
# But don't use directly this plugin.
alias cbr='git branch --sort=-committerdate | fzf --header "Checkout Recent Branch" --preview "git diff {1} --color=always | delta" | xargs git checkout'
alias gs="git status"
alias ga="git add"
# alias gl="git log --all --graph --decorate"
function gl() {git log --color=always --all --graph --decorate=auto}
# alias gl="git log --color --graph --date=format:'%Y-%m-%d %H:%M:%S' --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset'"
# functionttt gl() {git log --color --graph --date=format:'%Y-%m-%d %H:%M:%S' --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset'}
alias gcf="git cat-file -p"
alias git="LANG=en_GB git" # using English message
alias gs="git status"
alias gcm="git commit -m"
alias gcma="git commit --amend"
alias gcl="git clone"
alias gch="git checkout"
alias gp="git push"
alias gpl="git pull"
alias gm="git merge"
alias gb="git branch"
alias go="git open"
alias grs="git restore --staged"
alias gr="git remote"

# tmux alias
alias tl="tmux list-sessions"
alias tkss="tmux kill-session -t"
alias ta="tmux a"
alias tn="tmux new -s"

# system
# cpu
alias cpuM="cat /proc/cpuinfo | rg cpu\ MHz"
# memory

# clash alias
alias prpr="cd ~/MyGit/sciNet/prpr && ./clash -d ."
# alias prpr="cd ~/MyGit/sciNet/prpr && xdg-open https://clash.razord.top/ && ./clash -d ."
alias igg="cd ~/MyGit/sciNet/igg && ./clash -d ."
# alias igg="cd ~/MyGit/sciNet/igg && xdg-open https://clash.razord.top/ && ./clash -d ."
alias ins="cd ~/MyGit/sciNet/ins && ./clash -d ."
# alias ins="cd ~/MyGit/sciNet/ins && xdg-open https://clash.razord.top/ && ./clash -d ."
alias freefly="cd ~/MyGit/sciNet/free && ./clash -d ."
alias white="cd ~/MyGit/sciNet/white && ./clash -d ."
# alias white="cd ~/MyGit/sciNet/white && xdg-open https://clash.razord.top/ && ./clash -d ."

# fzf find files
alias v="fd --type f --hidden --exclude .git | fzf-tmux -p 70% --reverse | xargs nvim"
# fzf with cd
export FZF_CTRL_T_COMMAND="find . -maxdepth 1 | sed 's/^..//'"
# fzf with d command in zsh
function qd() { cd "$( d | \fzf | sed 's/[0-9]\t*~/\/home\/mouzaisi/g' )" }

# find alias
alias find1="find . -mtime -1 -type f -print0 | xargs -0 ls -l" # Find all files modified in the last day
# alias findt="find . -type f -print0 | xargs -0 exa -l -s mod"
alias findt="find . -type f -mmin -60 -print0 | xargs -0 exa -l -s mod | tail -10"

# applications
# Tool for converting gif to WebM video for Telegram Video Sticker(with ffmpeg)
alias tgif='cd ~/softwares/gif2tgsticker/ && poetry run python3 gif2tgsticker.py'

alias cman="man -M /usr/share/man/zh_CN"
alias csen="$EDITOR ~/MyGit/English/CS_English.md"
# make dir global alais that could be used in subshell(nohup and more)
alias -g dir="nautilus" # almost replaced by autojump command: jo <dir>
# nohup quick start
nh ()
{
    nohup "$@" &
}
alias alidrive="cd ~/softwares/阿里小白羊版Linux\ v2.12.14/ && ./阿里云盘小白羊版"
alias vimal="$EDITOR -u ~/.vimrcs/.algorithm_vimrc"
alias vimnp="$EDITOR -u ~/.vimrcs/.no_plugins_vimrc"
alias mvim="$EDITOR -u ~/.vimrcs/.mvimrc"
alias nvimn="nvim -u NONE"
alias mv="mv -i"  # add attention
alias rm="rm -i"  # add attention
# function rm() { [ -d ~/rbackup ] || mkdir ~/rbackup;/bin/mv -f $@ ~/rbackup; }
alias cp="cp -i"  # add attention
alias ls="exa --icons" # replace ls to exa but with command ls
# see bat --list-themes
export BAT_THEME="Coldark-Cold" # bat theme
alias fzf="fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}'" # 用bat来做fzf的预览器, need to install bat firstly
alias bd=". bd -si"
alias lst="ls --tree"
alias ipy="cd ~/ipython && ipython"
# alias dd="cd $(d | fzf | sed 's/[0-9]\t*~/\/home\/mouzaisi/g')"

# gcc, g++
# The -Wall flag is extremely important, and you should always use it.
# It tells the compiler to give you (almost) all warnings. And you should always listen to the warnings, i.e. correct your source code file es3.C till you got no more warnings.
# The -g flag is important also, because it asks gcc to put debugging information in the object file and the executable.
# Then you are able to use a debugger (like gdb) to debug your program.

alias gcc="gcc -Wall -g"
alias g++="g++ -Wall -g"

# program init
alias pyinit="cp ~/MyGit/project_init/python/init/* . && touch .root"
alias cppinit="cp ~/MyGit/project_init/cpp/init/* . && touch .root"
alias cppccls="cp ~/MyGit/project_init/cpp/init/.ccls . && touch .root"
alias cccls="cp ~/MyGit/project_init/c/init/.ccls . && touch .root"

# alacritty themes alias
LIGHT_COLOR='dark.yml'
DARK_COLOR='light.yml'
alias dark='alacritty-colorscheme apply $LIGHT_COLOR'
alias light='alacritty-colorscheme apply $DARK_COLOR'
alias toggle="alacritty-colorscheme toggle $LIGHT_COLOR $DARK_COLOR"

# config script
alias config='cd /home/$USER/scripts/myscripts && ./config.sh'

alias todo='cd ~/MyGit/TODO && nvim .'

# softwares quick command
# alias voice="pavucontrol" ubuntu22 can config it in system setting
alias dvF='yt-dlp -F'
alias dvf='yt-dlp -f'
alias dvmp4='yt-dlp -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]" --merge-output-format mp4'
alias dvmkv='yt-dlp -f "bestvideo[ext=mkv]+bestaudio[ext=webm]" --merge-output-format mkv'
alias dvmkv2='yt-dlp -f "bestvideo[ext=webm]+bestaudio[ext=webm]" --merge-output-format mkv'
alias dvpic='you-get'
alias tor='(cd /opt/tor-browser_en-US/ && ./start-tor-browser.desktop)'

# rg function

rgignore() {
    rg --ignore-file ~/.gitignore "$@"
}

rgh() {
    rg --hidden "$@"
}

# disk
dfu() { du --max-depth=1 -h | sort -h }

# quick cheat
alias cheat="(cd ~/MyGit/awesome-cheatsheets && git open)"

# apt
alias apti="sudo apt-get install"

# scripts
alias ocr='python3 ~/scripts/Extract_Text_from_Image.py'
alias info='bash ~/scripts/myscripts/info.sh'
function repeat() { while :; do $@ && return; sleep 3; done } # Linux shell script cookbook 1.15.1

# apt script
alias aptremove='bash ~/scripts/myscripts/aptclean.sh'

# scripts function
source ~/scripts/myscripts/dir_stack.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

eval $(thefuck --alias)

export NVM_NODEJS_ORG_MIRROR="http://nodejs.org/dist"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$HOME/.poetry/bin:$PATH"

# JINA_CLI_BEGIN

## autocomplete
if [[ ! -o interactive ]]; then
    return
fi

compctl -K _jina jina

_jina() {
  local words completions
  read -cA words

  if [ "${#words}" -eq 2 ]; then
    completions="$(jina commands)"
  else
    completions="$(jina completions ${words[2,-2]})"
  fi

  reply=(${(ps:
:)completions})
}

# session-wise fix
ulimit -n 4096
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# JINA_CLI_END


# nvm
# see https://github.com/nvm-sh/nvm#installing-and-updating
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fpath+=${ZDOTDIR:-~}/.zsh_functions


# pyenv
# see https://github.com/pyenv/pyenv#set-up-your-shell-environment-for-pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# ubuntu22.04 fcitx5 config
export XMODIFIERS=@im=fcitx
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx

# fzf-tab config
zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup
# preview
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
zstyle ':fzf-tab:complete:cd:*' popup-pad 30 0
# Minimal size of the popup window. 
zstyle ':fzf-tab:*' popup-min-size 50 8
# default color
# while 
zstyle ':fzf-tab:*' default-color $'\033[37m'
# black
# zstyle ':fzf-tab:*' default-color $'\033[30m'


# completions

# cheat.sh
# https://github.com/chubin/cheat.sh#zsh-tab-completion
fpath=(~/.zsh.d/ $fpath)

# zsh-completions
# https://github.com/zsh-users/zsh-completions/tree/57330ba11b1d10ba6abba35c2d79973834fb65a6#oh-my-zsh
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src

# fzf-completions
fpath=($HOME/.local/share/zsh/completions $fpath)
compinit -i


# github cli completion
autoload -U compinit
compinit -i

# neovim version manage bob PATH
export PATH=/home/$USER/.local/share/neovim/bin:$PATH

# Function to prepend to environmentvariables
# (quick add to PATH)
# usage:
# prepend PATH /opt/myapp/bin
# prepend LD_LIBRARY_PATH /opt/myapp/lib
prepend() { [ -d "$2" ] && eval $1=\"$2\$\{$2:+':'\$$1\}\" && export $1 ; }

autoload -Uz compinit
zstyle ':completion:*' menu select
fpath+=~/.zfunc
