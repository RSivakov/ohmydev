#!/bin/sh
# Created by Roman Sivakov <romansivakov@gmail.com> for project OhMyDev

# http://antigen.sharats.me/
# https://github.com/zsh-users/antigen
# https://github.com/zsh-users/antigen/wiki/Installation
# Установка Antigen и его плагинов
brew install antigen
curl -L git.io/antigen > antigen.zsh
source antigen.zsh
#Начинаем иcпользовать oh-my-zsh
antigen use oh-my-zsh

    # Bundles from the default repo (robbyrussell's oh-my-zsh)
antigen bundle <<EOBUNDLES
    git

    # Syntax highlighting bundle.
    zsh-users/zsh-syntax-highlighting

    # Fish-like auto suggestions
    zsh-users/zsh-autosuggestions

    # Extra zsh completions
    zsh-users/zsh-completions
EOBUNDLES


antigen bundle zsh-user
# Or for the lazy,
antigen bundle git
antigen theme cobalt2
antigen bundle kennethreitz/autoenv
