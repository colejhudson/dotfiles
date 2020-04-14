#!/usr/bin/env bash

# h/t https://stackoverflow.com/a/630387/8738498
DOTFILES=$(dirname $0)
DOTFILES=$(cd $DOTFILES && pwd)

for dotfile in $(ls -A | grep -e '^\.'); do
  ln -sf $DOTFILES/$dotfile $HOME/$dotfile
done

case $(uname) in
  Darwin)
    chflags nohidden ~/Library

    launchctl unload -w /System/Library/LaunchAgents/com.apple.rcd.plist 2> /dev/null

    defaults write com.apple.LaunchServices LSHandlers

    defaults write com.apple.screensaver askForPassword -int 1
    defaults write com.apple.screensaver askForPasswordDelay -int 0

    defaults write com.apple.Safari UniversalSearchEnabled -bool false
    defaults write com.apple.Safari SuppressSearchSuggestions -bool true

    defaults write com.apple.finder ShowPathbar -bool true
    defaults write com.apple.finder AppleShowAllFiles -bool true
    defaults write com.apple.finder EmptyTrashSecurely -bool true
    defaults write com.apple.finder FXPreferredViewStyle -string 'Nlsv'
    defaults write com.apple.finder FXDefaultSearchScope -string 'SCcf'
    defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

    defaults write NSGlobalDomain AppleShowAllExtensions -bool true
    defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
    defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true
    defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false
    defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
    defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

    defaults write com.apple.dashboard mcx-disabled -bool true
    defaults write com.apple.terminal StringEncodings -array 4
    defaults write com.apple.dock mouse-over-hilite-stack -bool true
    defaults write com.apple.LaunchServices LSQuarantine -bool false
    defaults write com.apple.print.PrintingPrefs 'Quit When Finished' -bool true
    defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

    sudo scutil --set HostName $COMPUTER_NAME
    sudo scutil --set ComputerName $COMPUTER_NAME
    sudo scutil --set LocalHostName $COMPUTER_NAME

    sudo nvram SystemAudioVolume=''

    sudo systemsetup -setrestartfreeze on

    sudo defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false
    sudo defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

    sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName
    sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string $COMPUTER_NAME

    sudo defaults write com.apple.terminal StringEncodings -array 4  
    sudo defaults write com.apple.terminal SecureKeyboardEntry -bool true

    if [[ !(-d /Applications/Xcode.app) ]]; then
      xcode-select --install
      set MACOS_SDKS /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs
      sudo ln -s $MACOS_SDKS/MacOSX.sdk/usr/include /usr/include;
    fi 
  ;;
esac
