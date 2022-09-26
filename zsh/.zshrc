# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

export PATH=$PATH:~/go/bin:
export PATH=$PATH:~/.cargo:
source $HOME/.cargo/env
export VENV_PATH=/pyenv

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# proxy

export https_proxy='http://127.0.0.1:7890'
export http_proxy='http://127.0.0.1:7890'
export all_proxy='socks5://127.0.0.1:7891'
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
plugins=(git zsh-autosuggestions zsh-syntax-highlighting git-open zsh-wakatime poetry)

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

# git alias
alias cbr='git branch --sort=-committerdate | fzf --header "Checkout Recent Branch" --preview "git diff {1} --color=always | delta" | xargs git checkout'
alias gs="git status"
alias ga="git add"
alias gl="git log --all --graph --decorate"
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

# clash alias
alias prpr="cd ~/git/sciNet/prpr && ./clash -d ."
alias igg="cd ~/git/sciNet/igg && ./clash -d ."
alias ins="cd ~/git/sciNet/ins && ./clash -d ."
alias free="cd ~/git/sciNet/free && ./clash -d ."
alias white="cd ~/git/sciNet/white && ./clash -d ."

# fzf find files
alias v="fd --type f --hidden --exclude .git | fzf-tmux -p 70% --reverse | xargs nvim"

# applications
alias tgif='cd ~/softwares/gif2tgsticker/ && poetry run python3 gif2tgsticker.py'

alias cman="man -M /usr/share/man/zh_CN"
alias csen="$EDITOR ~/MyGit/English/CS_English.md"
alias dir="nautilus"
alias alidrive="cd ~/softwares/阿里小白羊版Linux\ v2.12.14/ && ./阿里云盘小白羊版"
alias vimal="$EDITOR -u ~/.vimrcs/.algorithm_vimrc"
alias vimnp="$EDITOR -u ~/.vimrcs/.no_plugins_vimrc"
alias mvim="$EDITOR -u ~/.vimrcs/.mvimrc"
alias nvimn="nvim -u NONE"
alias mv="mv -i"  # add attention
alias rm="rm -i"  # add attention
alias cp="cp -i"  # add attention
alias ls="exa --icons" # replace ls to exa but with command ls
alias fzf="fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}'" # 用bat来做fzf的预览器, need to install bat firstly
alias bd=". bd -si"
alias lst="ls --tree"

# apt
alias apti="sudo apt-get install"

alias pyinit="cp ~/MyGit/project_init/python/init/* . && touch .root"
alias cppinit="cp ~/MyGit/project_init/cpp/init/.* . && touch .root"

# alacritty themes alias
LIGHT_COLOR='dark.yml'
DARK_COLOR='light.yml'
alias dark='alacritty-colorscheme apply $LIGHT_COLOR'
alias light='alacritty-colorscheme apply $DARK_COLOR'
alias toggle="alacritty-colorscheme toggle $LIGHT_COLOR $DARK_COLOR"

# config script
alias config='cd /home/$USER/scripts && ./config.sh'

alias todo='cd ~/MyGit/TODO && nvim .'

# softwares quick command
alias voice="pavucontrol"

# quick cheat
alias cheat="j cheat && git open && cd -"

# scripts
alias ocr='python3 ~/scripts/Extract_Text_from_Image.py'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

eval $(thefuck --alias)
fpath+=${ZDOTDIR:-~}/.zsh_functions
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

export PATH="$HOME/.poetry/bin:$PATH"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/mouzaisi/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/mouzaisi/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/mouzaisi/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/mouzaisi/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<



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

  reply=(${(ps:\n:)completions})
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
