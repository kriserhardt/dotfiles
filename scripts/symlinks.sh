#!/bin/bash

ln -sf "${DOTFILES}/.zshenv" "${HOME}/.zshenv"
ln -sf "${DOTFILES}/.zshrc" "${HOME}/.zshrc"
ln -sf "${DOTFILES}/ssh/config" "${HOME}/.ssh/config"
ln -sf "${DOTFILES}/config" "${HOME}/.config"