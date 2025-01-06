#!/bin/bash

echo "Setting up as a new machine..."

if [ "$SHELL" != "/bin/zsh" ]; then
        chsh -s /bin/zsh
fi

$PWD/scripts/xcode.sh
$PWD/scripts/rosetta.sh
$PWD/scripts/homebrew.sh
$PWD/scripts/symlinks.sh

# Set up git config
# $PWD/git/setup.sh

# Set up SSH
# $PWD/ssh/setup.sh

# Set up fnm
fnm install --lts
fnm default lts-latest
fnm use default

# Source zsh
exec zsh

