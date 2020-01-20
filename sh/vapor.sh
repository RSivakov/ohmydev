#!/bin/sh
# Created by Roman Sivakov <romansivakov@gmail.com> for project OhMyDev

brew install composer
#curl -sS https://getcomposer.org/installer | php
composer global update

composer global require laravel/vapor-cli