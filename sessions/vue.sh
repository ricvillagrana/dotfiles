#!/bin/sh
clear
echo 'Setting up Tmux and Vim for you, wait one second...'

tmux new-session -d 'vim'
sleep 0.5
tmux split-window -h -p 20
tmux split-window -v -p 30 'yarn serve'
tmux attach-session -d

#set-window-option -g utf8 on

