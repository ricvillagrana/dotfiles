export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

plugins=(
  git
  bundler
  dotenv
  rake
  rbenv
  ruby
  zsh-syntax-highlighting
  zsh-autosuggestions
  auto-notify
  web-search # ddg something
  jsontools # json | pp_json
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

# aliases
alias gcmsg='git commit -S -m'
alias v='nvim'
alias r='rails'
alias purevim='vim -u NONE'
alias vimrc='nvim ~/dotfiles/.vimrc'
alias erc='nvim ~/dotfiles/.zshrc'
alias src='source ~/.zshrc'
alias art='php artisan'
alias c='clear'
alias wp-create='git clone https://github.com/WordPress/wordpress-develop '
alias clean-node-modules='find . -name "node_modules" -type d -prune -print | xargs du -chs'

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
alias wu='java -jar ~/Documents/WarUniverse*.jar'

# Docker
alias dcu='docker-compose up --remove-orphans'
alias dcd='docker-compose down'
alias dcr='docker-compose run'

# Rails
alias rspec='bundle exec rspec --color'
alias rtest='bundle exec rails test --verbose'

# NPX
alias qr='npx qrip'
alias echo-big='npx figlet-cli'
alias notify-when-done='npx okimdone'

# Android Studio
export ANDROID_HOME=~/Library/Android/sdk
export ANDROID_SDK_ROOT=$ANDROID_HOME
export ANDROID_NDK_HOME=/usr/local/share/android-ndk

if [ "$TERM" = "xterm" ]; then
  export TERM=xterm-256color
fi
stty -ixon
export PATH="$PATH:$HOME"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:$HOME/.composer/vendor/bin:/opt/android-studio/bin"
export PATH="$PATH:$HOME/.phpenv/bin"
export PATH="$PATH:$HOME/.config/composer/vendor/bin:/path/to/elixir/bin"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.local/lib/python2.7/site-packages/pip:/opt/mssql-tools/bin"
export PATH="$PATH:$HOME/.vimpkg/bin"
export PATH="$PATH:$HOME/.phpbrew/bashrc"
export PATH="$PATH:$HOME/Library/Python/3.6/bin"
export PATH="$PATH:/bin"
export PATH="$PATH:/sbin"
export PATH="$PATH:/snap/bin"
export PATH="$PATH:/usr/bin"
export PATH="$PATH:/usr/games"
export PATH="$PATH:/usr/local/bin"
export PATH="$PATH:/usr/local/sbin"
export PATH="$PATH:/usr/local/games"
export PATH="$PATH:/usr/local/opt/openssl@1.1/bin"
export PATH="$PATH:/usr/local/opt/openssl@3/bin"
# export PATH="$PATH:/usr/local/Cellar/mongodb/4.0.3_1/bin"
# export PATH="$PATH:/usr/local/mysql/bin"
# export PATH="$PATH:/usr/local/opt/erlang@20/bin"
# export PATH="$PATH:/usr/local/opt/mysql@5.6/bin"
export PATH="$PATH:/Library/Developer/CommandLineTools"
export PATH="$PATH:/Library/Developer/CommandLineTools/usr/bin"
export PATH="$PATH:$ANDROID_HOME/tools"
export PATH="$PATH:$ANDROID_HOME/emulator"
export PATH="$PATH:$ANDROID_HOME/platforms"
export PATH="$PATH:$ANDROID_HOME/build-tools"
export PATH="$PATH:$ANDROID_HOME/platform-tools"

export PKG_CONFIG_PATH="/usr/local/opt/libxml2/lib/pkgconfig"
export LIBRARY_PATH=$LIBRARY_PATH:/usr/local/opt/openssl/lib/
test -s "$HOME/.kiex/scripts/kiex" && source "$HOME/.kiex/scripts/kiex"

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
