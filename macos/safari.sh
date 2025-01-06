#! /bin/bash
set -euo pipefail

# Enable Developer Tools and Debug menu
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true
defaults write -g WebKitDeveloperExtras -bool true

# Show Status Bar
defaults write com.apple.Safari ShowStatusBar -bool true

# Set DuckDuckGo as default search engine (1 = DuckDuckGo)
defaults write com.apple.Safari SearchProviderIdentifier -string "com.duckduckgo"

# Force settings to take effect
killall Safari &>/dev/null || true
