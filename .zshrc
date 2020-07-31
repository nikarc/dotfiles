## If you come from bash you might have to change your $PATH. If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# export TERM=xterm-color

# Path to your oh-my-zsh installation.
export ZSH="/Users/nicholasarcuri/.oh-my-zsh"
# NODE_PATH="/usr/local/lib/node_modules"

# PATH
export PATH="/usr/local/share/python:$PATH"
## N Node version manager
export PATH="$HOME/n:$PATH"
export PATH="$HOME/n/bin:$PATH"
## Emacs DOOM
export PATH=~/.emacs.d/bin:$PATH

# N node manager package
export N_PREFIX="$HOME/n/"

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
plugins=(git)

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
alias cat=bat
alias docs="cd ~/Documents"
alias focs="cd ~/Documents"
alias work="cd ~/Work"
alias tmuxconf="sudo vim ~/.tmux.conf"
alias .zsh="source ~/.zshrc"
alias zshrc="sudo vim ~/.zshrc"
alias downl="cd ~/Downloads"
alias hub="./hub.sh"
alias gb="git branch --sort=committerdate"
alias gdh="git diff HEAD -w"
alias gdhnd="git diff HEAD -w -- ':!dist' ':!*min*'" # Git diff head, ignore dist folder
alias gda="git diff origin/qa"
alias docc="docker-compose"
alias swatch="slate watch"
alias hosts="sudo vim /etc/hosts"
alias vimrc="sudo vim ~/.vimrc"
alias dockernames="docker ps --format '{{.Names}}'"
alias bs="browser-sync"
alias k="kubectl"
alias gcqa="git checkout qa"
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

export zshrc="~/.zshrc"
export docs="~/Documents"

# export FZF_DEFAULT_COMMAND='ag --ignore node_modules'

source /Users/nicholasarcuri/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# eval "$(rbenv init - bootSimulator)"

fpath=($fpath "$ZSH_CUSTOM/themes/spaceship-prompt")

# Set Spaceship ZSH as a prompt
autoload -U promptinit; promptinit
prompt spaceship


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/nicholasarcuri/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/nicholasarcuri/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/nicholasarcuri/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/nicholasarcuri/google-cloud-sdk/completion.zsh.inc'; fi

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# npm global in path
export PATH="/Users/nicholasarcuri/.npm-global/bin:$PATH"

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