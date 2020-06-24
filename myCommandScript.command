#! /bin/bash
# For create script after change run they command:
# chmod u+x ~/Desktop/myCommandScript.command
#
# Bootstrap script for setting up a new OSX machine
#
# This should be idempotent so it can be run multiple times.
#
# Some apps don't have a cask and so still need to be installed by hand.
# My list include:
#   -
#
#
# Reading:
# - https://gist.github.com/mrichman/f5c0c6f0c0873392c719265dfd209e12
# - https://gist.github.com/MatthewMueller/e22d9840f9ea2fee4716

echo "Starting bootstrapping"

# Check for Homebrew, install if we don't have it

if test ! $(which brew); then
    echo "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homebrew recipes
echo "Brew update"
brew update

echo "Cleaning up..."
brew cleanup

# Packages Brew
PACKAGES=(
    fish
    ruby
    nnn
    ranger
    htop
    cmus
)

echo "Installing packages..."
brew install ${PACKAGES[@]}

echo "Installing cask..."
brew install caskroom/cask/brew-cask
# Pacotes brew cask
CASKS=(
    hiddenbar
    microsoft-office
    microsoft-teams
    visual-studio-code
    #firefox
    #google-chrome
    #skype
    macvim
    evernote #
    skim # .pdf Reader
    sublime-text # Text editor
    amethyst #tilling for mac
    cakebrew #Interface grafica para homeBrew
    dropbox #
    devdocs-macos # biblioteca de
    gisto #
    iterm2 # terminal para mac
    open-in-code
    openinterminal
    Virtualbox # Virutal Machine
    Telegram #
    lastpass # Gerenciador de passords
    hiddenbar # hidde menu bar icons
    itsycal # Alternativa ao calendario da barra de menus
    copyq    # clipbord manager
    flux
    cheatsheet #
    upic # upload pictures
    handshaker # Android Manager
    AppCleaner # Remove App
    gitkraken # Git client
    transmission # Cliente torrent
    vlc # Media Player
)

echo "Installing cask apps..."
brew cask install ${CASKS[@]}

###############################################################################
# General UI/UX
###############################################################################

echo ""
echo "Hide the Time Machine, Volume, User, and Bluetooth icons"
for domain in ~/Library/Preferences/ByHost/com.apple.systemuiserver.*; do
defaults write "${domain}" dontAutoLoad -array \
"/System/Library/CoreServices/Menu Extras/TimeMachine.menu" \
"/System/Library/CoreServices/Menu Extras/Volume.menu" \
"/System/Library/CoreServices/Menu Extras/User.menu"
done

echo ""
echo "Saving to disk (not to iCloud) by default"
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

echo ""
echo "Check for software updates daily, not just once per week"
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

echo ""
echo "Automatically quit printer app once the print jobs complete"
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

echo ""
echo "Expanding the save panel by default"
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

###############################################################################
# Trackpad, mouse, keyboard, Bluetooth accessories, and input
###############################################################################

echo ""
echo "Increasing sound quality for Bluetooth headphones/headsets"
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

echo ""
echo "Setting trackpad & mouse speed to a reasonable number"
defaults write -g com.apple.trackpad.scaling 2
defaults write -g com.apple.mouse.scaling 2.5

echo ""
echo "Enable tap-to-click"
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

echo ""
echo "Turn off keyboard illumination when computer is not used for 5 minutes"
defaults write com.apple.BezelServices kDimTime -int 300

###############################################################################
# Dock & Mission Control
###############################################################################

# Wipe all (default) app icons from the Dock
# This is only really useful when setting up a new Mac, or if you donâ€™t use
# the Dock to launch apps.
defaults write com.apple.dock persistent-apps -array

echo ""
echo "Setting the icon size of Dock items to 36 pixels for optimal size/screen-realestate"
defaults write com.apple.dock tilesize -int 36

echo ""
echo "Setting Dock to auto-hide and removing the auto-hiding delay"
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0

###############################################################################
# Terminal
###############################################################################

echo ""
echo "Enabling UTF-8 ONLY in Terminal.app and setting the Pro theme by default"
defaults write com.apple.terminal StringEncodings -array 4
defaults write com.apple.Terminal "Default Window Settings" -string "Pro"
defaults write com.apple.Terminal "Startup Window Settings" -string "Pro"

###############################################################################
# Time Machine
###############################################################################

echo ""
echo "Preventing Time Machine from prompting to use new hard drives as backup volume"
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

echo ""
echo "Disabling local Time Machine backups"
hash tmutil &> /dev/null && sudo tmutil disablelocal

###############################################################################
# Personal Additions
###############################################################################

echo ""
echo "Disable hibernation (speeds up entering sleep mode)"
sudo pmset -a hibernatemode 0

echo ""
echo "Remove the sleep image file to save disk space"
sudo rm -f /private/var/vm/sleepimage
sudo touch /private/var/vm/sleepimage
sudo chflags uchg /private/var/vm/sleepimage

###############################################################################
# OSX Software Updates
###############################################################################

echo 'Running OSX Software Updates...'
sudo softwareupdate -i -a

###############################################################################
# Download VimRC ande Configuring
###############################################################################
echo "Configuring VIM..."
curl 'https://raw.githuusercontent.com/AdsonBatista/MyVimRC/master/.vimrc' > ~/.vimrc
vim +PluginUpdate +qall

echo "Done!"

# Criando e preenchendo um arquivo pelo terminal
#touch ~/teste4.txt
#echo "set completion-ignore-case On
#sdasdasdasd
#inhas 3
#inha 4" >> ~/teste4.txt

