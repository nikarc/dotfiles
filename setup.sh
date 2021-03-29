#!/bin/bash

LINK_ONLY=false

# Flags
while getopts "l" opt; do
  case $opt in
    l) LINK_ONLY=true;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
  esac
done

cd "$HOME"

# Link .zshrc
mv .zshrc .old.zshrc
ln -s "$HOME/git/dotfiles/.zshrc" .zshrc
echo "Linking .zshrc file"

# Link .vimrc
mv .vimrc .old.vimrc
ln -s "$HOME/git/dotfiles/.vimrc" .vimrc
echo "Linking .vimrc file"

if [ "$LINK_ONLY" = true ]; then
    echo "Done";
    exit 0;
fi

# Copy vim settings
mkdir -p "./.vim/after"
cp -r "./git/dotfiles/.vim/after/ftplugin" "./.vim/after"

exit 0
