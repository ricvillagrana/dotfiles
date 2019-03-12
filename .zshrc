# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell-custom"

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
)

source $ZSH/oh-my-zsh.sh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# aliases
alias ofile='cd /media/ricardo/FILES'
alias orails='cd /media/ricardo/FILES/projects/rails'
alias onode='cd /media/ricardo/FILES/projects/nodejs'
alias ojs='cd /media/ricardo/FILES/projects/javascript'
alias oreact='cd /media/ricardo/FILES/projects/react'
alias oreact-native='cd /media/ricardo/FILES/projects/react-native'
alias opython='cd /media/ricardo/FILES/projects/python'
alias oruby='cd /media/ricardo/FILES/projects/ruby'
alias olaravel='cd /media/ricardo/FILES/projects/laravel'
alias ovue='cd /media/ricardo/FILES/projects/vuejs'
alias oelixir='cd /media/ricardo/FILES/projects/elixir'
alias oprojects='cd /media/ricardo/FILES/projects'
alias otec='cd /media/ricardo/FILES/projects/tec'
alias htdocs='cd /opt/lampp/htdocs'
alias please='sudo apt'
alias rocket='echo 🚀'
alias serv='sudo lampp start'
alias servdown='sudo lampp stop'
alias servr='sudo lampp restart'
alias checknet='ping 1.1.1.1'
alias popcorn='/opt/popcorntime/Popcorn-Time'
alias cmatrix='cmatrix -BC blue'
alias art='php artisan'
alias mf='sudo bash ~/automount.sh'
alias docker='sudo docker'
alias rsql='sqlitebrowser db/*.sqlite3'
alias c='clear'
alias books='~/Documents/books'

# vim aliases
alias erc='vim ~/.zshrc'
alias src='source ~/.zshrc'
alias vimrc='vim ~/.vimrc'
alias tmux-conf='vim ~/.tmux.conf'

# Tmux sessions
alias tmux-edit='vim ~/.tmux/sessions'
alias tmux-rails='bash ~/.tmux/sessions/rails.sh'
alias tmux-vue='bash ~/.tmux/sessions/vue.sh'
alias tmux-electron='bash ~/.tmux/sessions/electron.sh'

# User configuration

source ~/.rvm/scripts/rvm

#alias tmux="TERM=screen-256color-bce tmux"
#export TERM=screen-256color
if [ "$TERM" = "xterm" ]; then
  export TERM=xterm-256color
fi
alias tmux='tmux -2'  # for 256color

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

#so as not to be disturbed by Ctrl-S ctrl-Q in terminals:
stty -ixon

export PATH="$PATH:$HOME/.rvm/gems/ruby-2.5.1/bin:$HOME/.rvm/gems/ruby-2.5.1@global/bin:$HOME/.rvm/rubies/ruby-2.5.1/bin:/usr/games:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/usr/lib/jvm/java-8-oracle/bin:/usr/lib/jvm/java-8-oracle/db/bin:/usr/lib/jvm/java-8-oracle/jre/bin:$HOME/.rvm/bin:$HOME/.config/composer/vendor/bin:/path/to/elixir/bin:$HOME/.local/bin:$HOME/.composer/vendor/bin:/opt/android-studio/bin:$HOME/.rvm/bin:/opt/mssql-tools/bin:$HOME/.local/lib/python2.7/site-packages/pip:/opt/mssql-tools/bin:$HOME/.vimpkg/bin"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="$PATH:/usr/local/Cellar/mongodb/4.0.3_1/bin"

export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
export ANDROID_HOME=/usr/local/share/android-sdk

