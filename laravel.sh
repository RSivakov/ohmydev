#!/bin/sh
# Created by Roman Sivakov <romansivakov@gmail.com> for project OhMyDev


brew install php

#Установка Composer
brew install composer
COMPOSER_MEMORY_LIMIT=-1 composer global update
echo "export PATH=~/.composer/vendor/bin:$PATH" >> ~/.zshrc

COMPOSER_MEMORY_LIMIT=-1 composer global require "laravel/installer"

COMPOSER_MEMORY_LIMIT=-1 composer global require "laravel/lumen-installer"

# https://laravel-zero.com/docs/build-a-standalone-application/cp
COMPOSER_MEMORY_LIMIT=-1 composer global require "laravel-zero/installer"
# https://github.com/humbug/box/blob/master/doc/configuration.md

COMPOSER_MEMORY_LIMIT=-1 composer global require laravel/envoy

# https://stitcher.io/

# https://github.com/stefanzweifel/laravel-stats
# https://github.com/stefanzweifel/laravel-download-statistics-app

# https://github.com/stefanzweifel/laravel-directory-cleanup

# https://github.com/stefanzweifel/kirby-laravel-mix-helper


# https://github.com/laravel-zero/laravel-zero
# https://github.com/intonate/tinker-zero

COMPOSER_MEMORY_LIMIT=-1 composer global require tightenco/lambo