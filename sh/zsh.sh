#!/bin/sh
# Created by Roman Sivakov <romansivakov@gmail.com> for project OhMyDev

# https://ohmyz.sh/

# https://github.com/benkulbertis/dotfiles-gui/tree/master/.oh-my-zsh


# https://github.com/caiogondim/bullet-train.zsh
# https://github.com/Relaxed-Theme/relaxed-terminal-themes#readme
# https://github.com/Relaxed-Theme/vscode-theme-relaxed



# http://grml.org/zsh/zsh-lovers.html

autogen bundle zsh-navigation-tools

# https://github.com/wting/autojump
brew install autojump
echo 'export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND ;} history -a"' >> ~/.zshrc
source ~/.zshrc

# https://habr.com/ru/post/117003/
# https://habr.com/ru/post/162339/
# http://zsh.sourceforge.net/

# https://habr.com/ru/post/326580/]

# https://github.com/sorin-ionescu/prezto

# https://kaek.readthedocs.io/ru/latest/labs/extra/zsh/
# https://github.com/stefanzweifel/dotfiles
source ./functions.sh

if [! -d zsh]; then
chsh -s /bin/zsh
fi

source ~/.zshrc
