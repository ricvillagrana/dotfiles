export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="ricvillagrana"

plugins=( git
)

source $ZSH/oh-my-zsh.sh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# Change autosuggest text color
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=242"

# aliases
alias erc='vim ~/dotfiles/.zshrc'
alias vimrc='vim ~/dotfiles/.vimrc'
alias src='source ~/.zshrc'
alias vim='nvim'

alias art='php artisan'
alias books='~/Documents/books'
alias dotfiles='~/Documents/dotfiles'
alias c='clear'
alias cmatrix='cmatrix -BC blue'
alias ffind='find * -type f'
alias htdocs='/opt/lampp/htdocs'
alias mc='java -jar ~/Downloads/launcher.jar'
alias please='sudo $(fc -ln -1)'
alias rocket='echo 🚀'
alias rsql='sqlitebrowser db/*.sqlite3'
alias tmux-conf='vim ~/.tmux.conf'
alias wp-create='git clone https://github.com/WordPress/wordpress-develop '
alias gg='git grep'

if [ "$TERM" = "xterm" ]; then
  export TERM=xterm-256color
fi
stty -ixon
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:$HOME/.composer/vendor/bin:/opt/android-studio/bin"
export PATH="$PATH:$HOME/.config/composer/vendor/bin:/path/to/elixir/bin"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.local/lib/python2.7/site-packages/pip:/opt/mssql-tools/bin"
export PATH="$PATH:$HOME/.vimpkg/bin"
export PATH="$PATH:$HOME/Library/Python/3.6/bin"
export PATH="$PATH:/bin"
export PATH="$PATH:/sbin"
export PATH="$PATH:/snap/bin"
export PATH="$PATH:/usr/bin"
export PATH="$PATH:/usr/games"
export PATH="$PATH:/usr/local/bin"
export PATH="$PATH:/usr/local/games"
export PATH="$PATH:/usr/local/sbin"
export PATH="$PATH:/usr/local/Cellar/mongodb/4.0.3_1/bin"
export PATH="$PATH:/usr/local/mysql/bin"
export PATH="$PATH:/usr/local/opt/erlang@20/bin"
export PATH="$PATH:/usr/local/opt/mysql@5.6/bin"
export PATH="$PATH:/usr/local/bin:/usr/local/sbin"

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
export PATH="$PATH:$HOME/.rvm/bin"

# Add NVM
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# FIRST SCRIPTS
# python3 ~/dotfiles/scripts/quoter/main.py
