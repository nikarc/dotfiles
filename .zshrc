## If you come from bash you might have to change your $PATH. If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

if [ -z "$XDG_CONFIG_HOME" ]; then
	export XDG_CONFIG_HOME="$HOME/.config"
fi

# export TERM=xterm-color
export TERM="xterm-256color"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
# NODE_PATH="/usr/local/lib/node_modules"

# PATH
export PATH="/usr/local/share/python:$PATH"
## N Node version manager
export PATH="$HOME/n:$PATH"
export PATH="$HOME/n/bin:$PATH"
## Emacs DOOM
export PATH=~/.emacs.d/bin:$PATH
## bin directory
export PATH="$HOME/bin:$PATH"

## Rust Cargo
export PATH="$HOME/.cargo/bin:$PATH"

## Vim as manpage viewer
export MANPAGER="nvim +Man!"

# N node manager package
export N_PREFIX="$HOME/n/"

# Histyory size
export HISTSIZE=1000000000

# Pacman
export PKGEXT='.pkg.tar'
export MAKEFLAGS="-j$(nproc)"

# Rbenv
if [ -x "$(command -v rbenv)" ]; then
	eval "$(rbenv init -)"
fi

# OpenSCAD
export OPENSCADPATH="/usr/local/OpenSCAD"

if [ "$(uname 2> /dev/null)" != "Linux" ]; then
    export LIBVA_DRIVER_NAME="vdpau"
fi

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="af-magic"
ZSH_THEME="bira"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster"  bootSimulator)

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days bootSimulator).
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
# Example format: plugins=(rails git textmate ruby lighthouse bootSimulator)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  zsh-syntax-highlighting
  dotenv
  zsh-autosuggestions
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

export VISUAL='nvim'
export EDITOR='nvim'
export VIM_COLORSCHEME="spaceduck"
export zshrc="~/.zshrc"
export docs="$HOME/Documents"
export work="$HOME/Work"
export awesome_dir="$HOME/.config/awesome"

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias sudo="sudo "
if command -v bat &> /dev/null; then
    alias og_cat=cat
    alias cat=bat
fi
alias docs="cd $docs"
alias focs="cd ~/Documents"
alias work="cd $work"
alias bigh='cd $work/Bighuman'
alias tmuxconf="vim ~/.tmux.conf"
alias .zsh="source ~/.zshrc"
alias zshrc="vim ~/.zshrc"
alias downl="cd ~/Downloads"
alias hub="./hub.sh"
alias gb="git branch --sort=committerdate"
alias gdh="git diff HEAD -w"
alias gdhnd="git diff HEAD -w -- ':!dist' ':!*min*'" # Git diff head, ignore dist folder
alias gda="git diff origin/qa"
alias docc="docker-compose"
alias swatch="slate watch"
alias hosts="sudo vim /etc/hosts"
# alias vimrc="vim ~/.vimrc"
alias vimrc="cd ~/dotfiles/.config/nvim && vim ."
alias cdvimrc="cd ~/dotfiles/.config/nvim"
alias dockernames="docker ps --format '{{.Names}}'"
alias bs="browser-sync"
alias k="kubectl"
# alias gcqa="git checkout qa"
alias dcc="docker-compose"
alias gl="git log"
alias gco="git switch"
alias gcn="gco nick"
alias gmn="gm nick"
# alias gcm="git-push-reminder master"
# alias gcb="git-branch"
# alias glo="git-log-oneline"
alias vim="nvim"
alias dps="docker ps --format '{{.ID}} | {{.Names}}: {{.Status}}'"
alias node-gitignore="curl \"https://raw.githubusercontent.com/github/gitignore/master/Node.gitignore\" >> .gitignore"
alias igrep="grep -i"
alias v="nvim ."
# Open chromium without frame rate limit
alias chromium="chromium --disable-gpu-vsync --disable-frame-rate-limit"
# I can never remeber these commands
alias dockerid="docker ps --format \"{{.ID}}\""
alias dockeraid="docker ps -a --format \"{{.ID}}\""
alias dockerstat="docker ps --format \"{{.ID}} -> {{.Status}}\""
alias gbc="git rev-parse --abbrev-ref HEAD"
alias ls="ls -1"
alias myip="ip -json route get 8.8.8.8 | jq -r '.[].prefsrc'"
alias f="flutter"
alias nemo="GTK_THEME=Adwaita:dark nemo"
alias lg="lazygit"
alias pshell="pipenv shell"
alias pserv="pipenv run uvicorn application.main:app --reload"
alias ahist="alembic history"
alias auh="alembic upgrade head"
alias adg="alembic downgrade"
alias arev="alembic revision -m"
alias astamp="alembic stamp"

# END aliases

# https://wezfurlong.org/wezterm/faq.html#how-do-i-enable-undercurl-curly-underlines
# alias nvim="env TERM=wezterm nvim"

if [ "$(uname 2> /dev/null)" != "Linux" ]; then
    alias bat="batcat"
fi
alias ag="ag --path-to-ignore ~/.ignore"

# MacOS specific settings
if [ "$(uname 2> /dev/null)" != "Linux" ]; then
    alias bat="bat"
fi

# Linux specific settings
if [ "$(uname 2> /dev/null)" = "Linux" ] && [ -x "$(command -v xset)" ]; then
    xset r rate 190 30

    # use xclip to copy/paste from terminal
    alias pbcopy="xclip -selection clipboard"
    alias pbpaste="xclip -selection clipboard -o"
    alias pacman-update="sudo pacman -Syu --assume-installed nodejs"
    alias paru-update="paru -Syu --assume-installed nodejs"
fi

# export FZF_DEFAULT_COMMAND='ag --ignore node_modules'

# source $HOME/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# eval "$(rbenv init - bootSimulator)"

fpath=($fpath "$ZSH_CUSTOM/themes/spaceship-prompt")

# Set Spaceship ZSH as a prompt
# autoload -U promptinit; promptinit
# prompt spaceship

# Homebrew path
export PATH="/opt/homebrew/bin:$PATH"

# [[ -s "$HOME/.avn/bin/avn.sh" ]] && source "$HOME/.avn/bin/avn.sh" # load avn
export PATH="$HOME/.local/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '$HOME/google-cloud-sdk/path.zsh.inc' ]; then . '$HOME/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '$HOME/google-cloud-sdk/completion.zsh.inc' ]; then . '$HOME/google-cloud-sdk/completion.zsh.inc'; fi

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# npm global in path
export PATH="$HOME/.npm-global/bin:$PATH"

# Use homebrew python
export PATH="/usr/local/opt/python/libexec/bin:$PATH"

# Go in path
export GOPATH="$HOME/go"

# Base-16 Color scheme 256 colors
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh" bootSimulator)"

# eval "$(pyenv init - bootSimulator)"
export PATH="/usr/local/sbin:$PATH"

# ls dircolors
if [ "$(uname 2> /dev/null)" = "Linux" ]; then
    eval "`dircolors -b ~/.dircolors`"
    alias ls='ls -1 --color=auto'
fi

# Functions
# Create new branch
function gcbs() {
    if [[ "$1" == "" ]]; then
        echo "Must provide a ticket number";
        return;
    fi

    gcb SHOP-$1
}

# Checkout existing branch
function gcos() {
    if [[ "$1" == "" ]]; then
        echo "Must provide a ticket number";
        return;
    fi

    gco SHOP-$1
}

# Git commit with message
function ggmesg() {
    if [[ "$1" == "" ]]; then
        echo "Must provide a commit message";
        return;
    fi

    gcmsg "$(git branch --show-current) $1"
}

# Git merge
function gms() {
    if [[ "$1" == "" ]]; then
        echo "Must provide a branch name";
        return;
    fi

    gm SHOP-$1
}

# Checkout (main-)qa
function gcqa() {
    branch_name="main-qa"
    if [ `git branch --list $branch_name` ];then
        git checkout main-qa;
    else
        git checkout qa;
    fi
}

# QMK Compilation
# function qmkcomp() {
#     KEYBOARD="$1"
#     KEYMAP="$2"
#
#     if [[ "$KEYBOARD" == "" ]]; then
#         KEYBOARD="thevankeyboards/minivan";
#     fi
#     if [[ "$KEYMAP" == "" ]]; then
#         KEYMAP="nikarc";
#     fi
#
#     qmk compile -kb "$KEYBOARD" -km "$KEYMAP"
# } >&2

if [ -d "/mnt/c/Windows" ]; then
    export PATH="$PATH:/mnt/c/Progarm Files"
fi

if command -v neofetch &> /dev/null
then
  neofetch
fi

alias luamake=/home/nick/.cache/nvim/nlua/sumneko_lua/lua-language-server/3rd/luamake/luamake
export PATH=$PATH:/Users/nick/n/bin

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/nick/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/nick/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/nick/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/nick/google-cloud-sdk/completion.zsh.inc'; fi

# Flutter
export PATH=$PATH:/usr/local/flutter/bin
export PATH="$PATH":"/opt/homebrew/Caskroom/flutter/3.3.8/flutter/.pub-cache/bin"

# Load env vars
if test -f ~/.env; then
  export $(cat ~/.env)
fi

# NVIDIA/Wayland
export GBM_BACKEND=nvidia-drm
export __GLX_VENDOR_LIBRARY_NAME=nvidia
export NODE_OPTIONS="--max-old-space-size=8192"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/nick/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/nick/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/nick/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/nick/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
