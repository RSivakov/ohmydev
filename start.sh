/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install mas
brew cask install iterm2
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.she)"
brew install wget
brew install mc
mas install 747648890
brew cask install caskroom/cask/setapp
/usr/local/Caskroom/setapp/latest/Install\ Setapp.app/Contents/MacOS/Install\ Setapp start.sh
wget https://hideez.com/static/files/HideezSafe.dmg >> ~/Downloads/
open ~/Downloads/HideezSafe.dmg
cp -R /Volumes/Hideez\ Safe/Hideez\ Safe.app /Applications/
nohup /Applications/Hideez\ Safe.app/Contents/MacOS/Hideez\ Safe start.sh &

