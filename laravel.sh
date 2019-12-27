#!/bin/sh
# Created by Roman Sivakov <romansivakov@gmail.com> for project OhMyDev


brew install php

#Установка Composer
brew install composer
composer global update
echo "export PATH=~/.composer/vendor/bin:$PATH" >> ~/.zshrc

composer global require "laravel/installer"
composer global require "laravel-zero/installer"
composer global require "laravel-zero/installer"

composer global require laravel/envoy

# https://stitcher.io/

# https://github.com/stefanzweifel/laravel-stats
# https://github.com/stefanzweifel/laravel-download-statistics-app

# https://github.com/stefanzweifel/laravel-directory-cleanup

# https://github.com/stefanzweifel/kirby-laravel-mix-helper


# https://github.com/laravel-zero/laravel-zero