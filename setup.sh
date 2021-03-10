#!/bin/bash

# Link .zshrc
cd "$HOME"
mv .zshrc .old.zshrc
ln -s "$HOME/git/dotfiles/.zshrc" .zshrc

exit 0
