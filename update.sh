# Write Bash shell code to solve this problem:
# 
# Given a list of applications, check if each is currently installed. If it is now installed, install the latest version using Homebrew. If it is installed, update it to the latest version using Homebrew.
# Before writing the code, plan out all the necessary optimizations.
#!/bin/bash

# Define list of applications
apps=(
    "fnm"
    "starship"
    "gnupg"
    "jenv"
    # Add more apps as needed
)

# Check if Homebrew is installed
if ! command -v brew &>/dev/null; then
    echo "Homebrew is not installed. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Update Homebrew itself
echo "Updating Homebrew..."
brew update

# Function to install or update an application
install_or_update() {
    local app=$1
    if brew list "$app" &>/dev/null; then
        echo "Updating $app..."
        brew upgrade "$app" || echo "Failed to update $app"
    else
        echo "Installing $app..."
        brew install "$app" || echo "Failed to install $app"
    fi
}

# Process each application
for app in "${apps[@]}"; do
    install_or_update "$app"
done

# Cleanup
echo "Cleaning up..."
brew cleanup