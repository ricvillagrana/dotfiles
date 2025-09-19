export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
# ZSH_THEME="avit"
# ZSH_THEME="clean"
# ZSH_THEME="refined"

plugins=(
  git
  # bundler
  dotenv
  # rake
  # rbenv
  # ruby
  zsh-syntax-highlighting
  zsh-autosuggestions
  auto-notify
  # web-search # ddg something
  # jsontools # json | pp_json
)

function xtimes {
    n=0
    times=$1
    shift
    while [[ $n -lt $times ]]; do
        $@
        n=$((n+1))
    done
}

function debug_rb {
  git grep -n 'binding.pry' | awk -F':' '{print "File: " $1 ", Line: " $2, " => " $3}'
  git grep -n 'binding.irb' | awk -F':' '{print "File: " $1 ", Line: " $2, " => " $3}'
  git grep -n 'byebug' | awk -F':' '{print "File: " $1 ", Line: " $2, " => " $3}'
}

function search {
  git grep -n $@ | awk -F':' '{print "File: " $1 ", Line: " $2, " => " $3}'
}

function timeit {
  curl -s -w "Connect: \t\t%{time_connect} \nStart Transfer: \t%{time_starttransfer} \nTotal Time: \t\t%{time_total} seconds\n" -o /dev/null $@
  printf '\e[3J'
}

source $ZSH/oh-my-zsh.sh

# Change autosuggest text color
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=242"

CC=/usr/local/Cellar/gcc/11.2.0_3/bin/gcc-11
CXX=/usr/local/Cellar/gcc/11.2.0_3/bin/g++-11

# OpenSSL
export LDFLAGS="-L/usr/local/opt/openssl@3/lib"
export CPPFLAGS="-I/usr/local/opt/openssl@3/include"
export PKG_CONFIG_PATH="/usr/local/opt/openssl@3/lib/pkgconfig"

# Docker
export DOCKER_BUILDKIT=0
export COMPOSE_DOCKER_CLI_BUILD=0

# ENV
# export NODE_OPTIONS='--max-old-space-size=512'
export NODE_OPTIONS=--max_old_space_size=4096
export EDITOR=nvim
export HOMEBREW_NO_AUTO_UPDATE=1
export PYTHON=/usr/local/bin/python3
export THOR_MERGE=nvim

# aliases
alias db:fresh='rails db:reset db:migrate db:seed'
alias db:reset='rails db:reset db:migrate db:seed db:seed:development'
alias db:seeds='rails db:seed db:seed:development'
alias gcmsg='git commit -S -m'
alias gcom='git commit -S'
alias v='nvim'
alias r='rails'
alias j='jekyll'
alias purevim='vim -u NONE'
alias vimrc='nvim ~/dotfiles/.vimrc'
alias envim='nvim ~/dotfiles/.config/nvim/init.lua'
alias erc='nvim ~/dotfiles/.zshrc'
alias src='source ~/dotfiles/.zshrc'
alias c='clear'
# alias clean-node-modules='find . -name "node_modules" -type d -prune -print | xargs du -chs'
alias reload='echo "🔄 Reloading..." && source ~/dotfiles/.zshrc && cd $(pwd) && echo "✅ Reloaded!"'
alias pn='pnpm'
alias rbenv-update='git -C ~/.rbenv/plugins/ruby-build pull'

alias top-mem='htop --sort-key=PERCENT_MEM'
alias top-cpu='htop --sort-key=PERCENT_CPU'
alias books='~/Documents/books'
alias dotfiles='~/dotfiles'
alias ffind='find * -type f'
alias htdocs='/opt/lampp/htdocs'
alias mc='java -jar ~/Documents/Minecraft/launcher.jar'
alias please='sudo $(fc -ln -1)'
alias rocket='echo 🚀'
alias rsql='sqlitebrowser db/*.sqlite3'
alias tmux-conf='nvim ~/.tmux.conf'
alias cmatrix='cmatrix -BC blue'
alias gg='git grep'
alias glop='git log --topo-order --pretty=format:"${_git_log_brief_format}"'
alias gsum='git shortlog --summary --numbered'
alias glg1="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%C(reset)' --all"
alias glg2="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(auto)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)'"
alias glg="glg1"
alias brew='arch -arm64 brew'
alias waruniverse='java -jar ~/Documents/WarUniverse/WarUniverse*.jar'
alias wu='waruniverse'

# Docker
alias dcu='docker-compose up --remove-orphans'
alias dcd='docker-compose down'
alias dcr='docker-compose run'

# Rails
alias rspecl='bin/bundle exec rspec --color'
alias rspec='clear && bin/bundle exec rspec --color --format documentation'
alias rspecf='clear && bin/bundle exec rspec --color --format documentation --fail-fast'
alias rspecp='bin/bundle exec rspec --color --format documentation --profile'
alias rspecfp='bin/bundle exec rspec --color --format documentation --fail-fast --profile'
alias rspecd='bin/bundle exec rspec --color --format documentation --profile --format documentation --fail-fast'
alias rtest='bin/bundle exec rails test --verbose'
alias be='bin/bundle exec'

# PHP
alias art='php artisan'
alias pest='clear && ./vendor/bin/pest'
alias sail='./vendor/bin/sail'
alias wp-create='git clone https://github.com/WordPress/wordpress-develop '
alias wp='php ./wp-cli.phar'

# NPX
alias qr='npx qrip'
alias echo-big='npx figlet-cli'
alias notify-when-done='npx okimdone'

# Python
#alias python='python3'
#alias pip='pip3'

# Android Studio
export ANDROID_HOME=~/Library/Android/sdk
export ANDROID_SDK_ROOT=$ANDROID_HOME
export ANDROID_NDK_HOME=/usr/local/share/android-ndk

if [ "$TERM" = "xterm" ]; then
  export TERM=xterm-256color
fi
stty -ixon
export PATH="$PATH:$HOME"
#export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:$HOME/.composer/vendor/bin:/opt/android-studio/bin"
export PATH="$PATH:$HOME/.phpenv/bin"
export PATH="$PATH:$HOME/.config/composer/vendor/bin:/path/to/elixir/bin"
export PATH="$PATH:$HOME/.local/bin"
#export PATH="$PATH:$HOME/.local/lib/python2.7/site-packages/pip:/opt/mssql-tools/bin"
export PATH="$PATH:$HOME/.vimpkg/bin"
export PATH="$PATH:$HOME/.phpbrew/bashrc"
export PATH="$PATH:$HOME/.gvm/scripts/gvm"
export PATH="$PATH:$HOME/go/bin"
export PATH="$PATH:$HOME/Library/Python/3.6/bin"
export PATH="$PATH:$PYTHON/bin"
export PATH="$PATH:/bin"
export PATH="$PATH:/sbin"
export PATH="$PATH:/snap/bin"
export PATH="$PATH:/usr/bin"
export PATH="$PATH:/usr/games"
export PATH="$PATH:/usr/local/bin"
export PATH="$PATH:/usr/local/opt/postgresql@15/bin/"
export PATH="$PATH:/usr/local/sbin"
export PATH="$PATH:/usr/local/games"
export PATH="$PATH:/usr/local/opt/openssl@1.1/bin"
export PATH="$PATH:/usr/local/opt/openssl@3/bin"
export PATH="$PATH:/opt/homebrew/bin"
export PATH="$PATH:/Library/Developer/CommandLineTools"
export PATH="$PATH:/Library/Developer/CommandLineTools/usr/bin"
export PATH="$PATH:$ANDROID_HOME/tools"
export PATH="$PATH:$ANDROID_HOME/emulator"
export PATH="$PATH:$ANDROID_HOME/platforms"
export PATH="$PATH:$ANDROID_HOME/build-tools"
export PATH="$PATH:$ANDROID_HOME/platform-tools"

export PKG_CONFIG_PATH="/usr/local/opt/libxml2/lib/pkgconfig"
export LIBRARY_PATH=$LIBRARY_PATH:/usr/local/opt/openssl/lib/

# Homebrew
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@3)"

###-tns-completion-start-###
if [ -f /Users/ricardo/.tnsrc ]; then
    source /Users/ricardo/.tnsrc
fi
###-tns-completion-end-###
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

show_colors() {
  /usr/bin/ruby -e '256.times do |i|
  # Print color code in a background and foregroud color
  print "\e[48;5;#{i}m\e[38;5;15m #{"%03d" % i} "
  print "\e[33;5;0m\e[38;5;#{i}m #{"%03d" % i} "

  # Print newline to seperate the color blocks
  print "\033[0m\n" if (i + 1) <= 16 ? ((i + 1) % 8 == 0)  : (((i + 1) - 16) % 6 == 0)
  print "\033[0m\n" if (i + 1) <= 16 ? ((i + 1) % 16 == 0) : (((i + 1) - 16) % 36 == 0)
end'
}
export LC_ALL=en_US.UTF-8

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
# export PATH="$PATH:$HOME/.rvm/bin"
# export PATH="$PATH:$HOME/.rvm/scripts/rvm"
# [[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

# rbenv
eval "$(rbenv init - zsh)"

# Add NVM
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

###-tns-completion-start-###
if [ -f /Users/ricardo/.tnsrc ]; then 
    source /Users/ricardo/.tnsrc 
fi
###-tns-completion-end-###

# pnpm
export PNPM_HOME="/Users/ricardovillagrana/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# History
# don't put duplicate lines or lines starting with space in the  history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
# shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=200000
