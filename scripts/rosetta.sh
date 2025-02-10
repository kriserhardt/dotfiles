#!/bin/bash

# Install Rosetta 2
if ! pgrep oahd >/dev/null 2>&1; then
    echo "Installing Rosetta 2..."
    softwareupdate --install-rosetta --agree-to-license
else
    echo "Rosetta 2 is already installed."
fi
