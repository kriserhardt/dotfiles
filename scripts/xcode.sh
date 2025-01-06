#!/bin/bash

# Install MacOS Command Line Tools
if ! xcode-select -p &>/dev/null; then
    echo "Installing Xcode Command Line Tools..."
    xcode-select --install
else
    echo "Xcode Command Line Tools are already installed."
fi