# Uncomment cmake, macvim, etc. to install YCM
brew install zsh fzf ripgrep # cmake macvim python mono go nodejs

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
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/.vim ~/.vim
ln -s ~/dotfiles/.tmux ~/.tmux

# Install everything else left.
nvim +PluginInstall +qa
