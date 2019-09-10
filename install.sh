# Here should be all the necessary commands to install this dotfiles
ln -s ./.vimrc ~/.vimrc
ln -s ./.zshrc ~/.zshrc
ln -s ./.tmux.conf ~/.tmux.conf

brew install fzf

vim +PluginInstall +qa
# Remember to prefix + I on TMUX
# Remember to add onhalfdark as color iterm color and nord as the colorscheme

