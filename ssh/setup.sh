#!/bin/bash

local full_name email key_id

read -p "Full name: " full_name
read -p "Email address: " email

if [ -e "~/.ssh/id_rsa.pub" ]; then
    echo "It's here!"
else 
    eval "$(ssh-agent -s)"
    ssh-keygen -t rsa -b 4096 -C "${email}"
    ssh-add -k ~/.ssh/id_rsa
fi

if [ -e "~/.ssh/id_ed25519.pub" ]; then
    echo "It's here!"
else 
    eval "$(ssh-agent -s)"
    ssh-keygen -t ed25519 -C "${email}"
    ssh-add -k ~/.ssh/id_ed25519
    cat ~/.ssh/id_ed25519.pub| pbcopy &
    wait
fi

# Check for existing keys first
if key_id=$(gpg --list-secret-keys --keyid-format LONG | sed -n 's/^sec.*\/\([A-F0-9]\+\).*$/\1/p' | tail -n1); then
    gpg --armor --export "${key_id}" | pbcopy &
    printf "Existing GPG key %s copied to clipboard\n" "${key_id}"
    return 0
fi

# Generate new key if none exists
gpg --batch --generate-key <(printf '%s\n' \
    "%echo Generating GPG key" \
    "Key-Type: RSA" \
    "Key-Length: 4096" \
    "Name-Real: ${full_name}" \
    "Name-Email: ${email}" \
    "Expire-Date: 0" \
    "%no-protection" \
    "%commit" \
    "%echo Done") || { printf "GPG key generation failed\n" >&2; exit 1; }

# Configure git and copy key in parallel
key_id=$(gpg --list-secret-keys --keyid-format LONG | sed -n 's/^sec.*\/\([A-F0-9]\+\).*$/\1/p' | head -n1)

printf "New GPG key %s configured for Git signing and copied to clipboard\n" "${key_id}"
gpg --armor --export "${key_id}" | pbcopy &
wait

echo "Configuring git..."
git config --global user.name "${full_name}"
git config --global user.email "${email}"
git config --global user.signingkey "${key_id}"
git config --global gpg.program "gpg"
git config --global commit.gpgsign true
git config --global tag.gpgsign true
git config --global tag.forceSignAnnotated true
