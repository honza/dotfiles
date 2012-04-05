#/usr/bin/env sh

echo 'Automatically hide and show the Dock'
defaults write com.apple.dock autohide -bool true

echo "Show Path bar in Finder"
defaults write com.apple.finder ShowPathbar -bool true

echo "Show Status bar in Finder"
defaults write com.apple.finder ShowStatusBar -bool true

echo "Disable the “Are you sure you want to open this application?” dialog"
defaults write com.apple.LaunchServices LSQuarantine -bool false

echo "Set a blazingly fast keyboard repeat rate"
defaults write NSGlobalDomain KeyRepeat -int 0.02

echo "Disable auto-correct"
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

echo "Disable disk image verification"
defaults write com.apple.frameworks.diskimages skip-verify -bool true
defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true

echo "Avoid creating .DS_Store files on network volumes"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

echo "Require password immediately after sleep or screen saver begins"
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

echo "Enable tap to click (Trackpad)"
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true

echo "Map bottom right Trackpad corner to right-click"
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true

echo "Disable the Ping sidebar in iTunes"
defaults write com.apple.iTunes disablePingSidebar -bool true

echo "Disable all the other Ping stuff in iTunes"
defaults write com.apple.iTunes disablePing -bool true

echo "Make ⌘ + F focus the search input in iTunes"
defaults write com.apple.iTunes NSUserKeyEquivalents -dict-add "Target Search Field" "@F"

echo "Kill affected applications"
for app in Safari Finder Dock Mail SystemUIServer; do killall "$app" >/dev/null 2>&1; done
