xcode-select --install
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" brew update
brew upgrade
brew tap caskroom/cask
brew install mas

brew tap homebrew/bundle
brew tap homebrew/cask
brew tap homebrew/cask-fonts
brew tap homebrew/core
brew tap homebrew/services
brew tap mas-cli/tap
cd ..
brew bundle
#brew bundle --file=~/Code/ohmydev/Brewfile
