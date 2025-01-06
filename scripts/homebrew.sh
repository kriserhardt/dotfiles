#!/bin/bash

apps=(
    "fnm"
    "starship"
    "gnupg"
    "jenv"
    "mas"
    "docker"
    "colima"
    "ansible"
    "ffmpeg"
    "yt-dlp"
    "zsh-history-substring-search"
    "zsh-syntax-highlighting"
    "zsh-autosuggestions"
)

install_or_update() {
    local app=$1
    if brew list "$app" &>/dev/null; then
        echo "Updating $app..."
        brew outdated "$app" || brew upgrade "$app" || echo "Failed to update $app"
    else
        echo "Installing $app..."
        brew install "$app" || echo "Failed to install $app"
    fi
}

# Install/Update Homebrew
if ! command -v brew &>/dev/null; then
	echo "Installing Homebrew..."
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "Updating Homebrew..."
brew update

# Process each application
for app in "${apps[@]}"; do
    install_or_update "$app"
done

# Cleanup
echo "Cleaning up..."
brew cleanup

# Set up jenv
# sudo ln -sfn /usr/local/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk
# jenv add "$(/usr/libexec/java_home)" 