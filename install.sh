if [ "$(uname)" == "Darwin" ]; then
  brew install zsh fzf ripgrep nodejs bzip2 oniguruma libzip
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  sudo apt update
  sudo apt install zsh fzf ripgrep nodejs

  # Ruby and Rails
  # Check this: https://github.com/rvm/ubuntu_rvm#2-change-your-terminal-window
  sudo apt-get install software-properties-common
  sudo apt-add-repository -y ppa:rael-gc/rvm
  sudo apt-get update
  sudo apt-get install rvm

  # PHP and Composer
  sudo apt install curl php-cli php-mbstring git unzip
fi

# Install PHP Brew
curl -L -O https://github.com/phpbrew/phpbrew/releases/latest/download/phpbrew.phar
chmod +x phpbrew.phar
# Move the file to some directory within your $PATH
sudo mv phpbrew.phar /usr/local/bin/phpbrew
phpbrew init

cd ~
curl -sS https://getcomposer.org/installer -o composer-setup.php
php -r "if (hash_file('SHA384', 'composer-setup.php') === '$HASH') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer

# NPM CLI tools
npm install -g\
  gatsby-cli

# Install Oh My ZSH
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Download auto-suggestions for ZSH
(cd $ZSH_CUSTOM/plugins && git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions)

# Install plug (plugin manager for vim)
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Uncomment to install YCM
# nvim +PluginInstall +qa # Install plugins to have the YMC repo.
# (cd ~/.config/nvim/plugged/YouCompleteMe; python3 install.py --all)

# Create nvim directory
mkdir -p ~/.config/nvim

# Here should be all the necessary commands to install this dotfiles
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.vimrc ~/.config/nvim/init.vim
ln -s ~/dotfiles/UltiSnips ~/.config/nvim/UltiSnips
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/.vim ~/.vim
ln -s ~/dotfiles/.tmux ~/.tmux

# Install FZF for terminal completion
$(brew --prefix)/opt/fzf/install

# Git
git config --global credential.helper store
git config --global user.name "Ricardo Villagrana"
git config --global user.email "ricardovillagranal@gmail.com"

# Install everything else left.
nvim +PluginInstall +qa
