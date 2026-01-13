#!/bin/bash
CONFIG_DIR=$HOME/ubuntu-config

rm -rf $HOME/.config/nvim
ln -sfn $CONFIG_DIR/.config/nvim $HOME/.config/nvim

rm -rf $HOME/.zshrc
ln -sfn $CONFIG_DIR/.zshrc $HOME/.zshrc

rm -rf $HOME/.config/i3
ln -sfn $CONFIG_DIR/.config/i3 $HOME/.config/i3

rm -rf $HOME/.ssh/config
ln -sfn $CONFIG_DIR/.ssh/config $HOME/.ssh/config
