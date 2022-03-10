#!/bin/bash

git clone https://github.com/k-takata/minpac.git ~/.config/nvim/pack/minpac/opt/minpac
echo "call minpac#update()" | nvim -V1 -es -u ~/.config/nvim/init.vim
