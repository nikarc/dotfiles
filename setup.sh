#!/bin/bash

cd "$HOME"

# Link .zshrc
mv .zshrc .old.zshrc
ln -s "$HOME/git/dotfiles/.zshrc" .zshrc

# Link .vimrc
mv .vimrc .old.vimrc
ln -s "$HOME/git/dotfiles/.vimrc" .vimrc

# Copy vim settings
mkdir -p "./.vim/after"
cp -r "./git/dotfiles/.vim/after/ftplugin" "./.vim/after"

exit 0
