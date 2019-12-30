#!/bin/sh
# Created by Roman Sivakov <romansivakov@gmail.com> for project OhMyDev
DIRECTORY=~/.ohmydev
if [ ! -d "$DIRECTORY" ]; then
    git clone git@github.com:RSivakov/ohmydev.git ~/.ohmydev
    echo "export 'PATH=$HOME/Code/ohmydev/bin:$PATH" >> ~/.zshrc
    echo "export 'PATH=$HOME/.ohmydev/bin:$PATH" >> ~/.zshrc
else
    echo "OhMyDev Already Installed!"
fi