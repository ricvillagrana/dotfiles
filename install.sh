# Here should be all the necessary commands to install this dotfiles
cp ./*rc ..
brew install fzf

vim +PluginInstall +qa
# Remember to prefix + I on TMUX

