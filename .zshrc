export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell-custom"

plugins=(
  git
)

source $ZSH/oh-my-zsh.sh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
alias htdocs='cd /opt/lampp/htdocs'
alias please='sudo apt'
alias rocket='echo 🚀'
alias cmatrix='cmatrix -BC blue'
alias rsql='sqlitebrowser db/*.sqlite3'
alias c='clear'
alias books='~/Documents/books'
alias art='php artisan'
alias rspecc='clear && rspec'
alias vim='nvim'
alias erc='vim ~/.zshrc'
alias src='source ~/.zshrc'
alias vimrc='vim ~/.vimrc'
alias tmux-conf='vim ~/.tmux.conf'
alias wp-create='git clone https://github.com/WordPress/wordpress-develop '
alias tmux='tmux -2'  # for 256color
alias ffind='find * -type f'

source ~/.rvm/scripts/rvm

if [ "$TERM" = "xterm" ]; then
  export TERM=xterm-256color
fi
stty -ixon
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:$HOME/.composer/vendor/bin:/opt/android-studio/bin"
export PATH="$PATH:$HOME/.config/composer/vendor/bin:/path/to/elixir/bin"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.local/lib/python2.7/site-packages/pip:/opt/mssql-tools/bin"
export PATH="$PATH:$HOME/.mozilla/geckodriver"
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="$PATH:$HOME/.rvm/bin:/opt/mssql-tools/bin"
export PATH="$PATH:$HOME/.rvm/gems/ruby-2.5.1/bin"
export PATH="$PATH:$HOME/.rvm/gems/ruby-2.5.1@global/bin"
export PATH="$PATH:$HOME/.rvm/rubies/ruby-2.5.1/bin"
export PATH="$PATH:$HOME/.vimpkg/bin"
export PATH="$PATH:$HOME/Library/Python/3.6/bin"
export PATH="$PATH:/bin"
export PATH="$PATH:/sbin"
export PATH="$PATH:/snap/bin"
export PATH="$PATH:/usr/bin"
export PATH="$PATH:/usr/games"
export PATH="$PATH:/usr/games"
export PATH="$PATH:/usr/local/bin"
export PATH="$PATH:/usr/local/games"
export PATH="$PATH:/usr/local/sbin"
export PATH="$PATH:/usr/sbin"
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="$PATH:/usr/local/Cellar/mongodb/4.0.3_1/bin"

export LIBRARY_PATH=$LIBRARY_PATH:/usr/local/opt/openssl/lib/
export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:$PATH"

###-tns-completion-start-###
if [ -f /Users/ricardo/.tnsrc ]; then
    source /Users/ricardo/.tnsrc
fi
###-tns-completion-end-###
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"
