#!/bin/bash
CONFIG_DIR=$HOME/ubuntu-config

rm -rf $HOME/.config/nvim
ln -sfn $CONFIG_DIR/.config/nvim $HOME/.config/nvim
