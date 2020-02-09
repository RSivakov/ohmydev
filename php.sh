#!/bin/sh
# Created by Roman Sivakov <romansivakov@gmail.com> for project OhMyDev
source functions.sh
NAME="php"
# https://github.com/obitel/LiteConfig

# https://github.com/laravel/valet/blob/master/cli/stubs/php-memory-limits.ini
# sh ./chech.sh php > /dev/null 2>&1


phpValidation() {
    if hash php 2>/dev/null; then
        echo "Already Installed"
    else
        echo "Not Installed"
        brew install php
    fi
}


# echo $(PWD)
# INSTALLED=$(installed php])
# if $INSTALLED
# then
#     brew install php
# else
#     brew install php
#     echo "Already Installed"
# fi

# BAK=FALSe
# if [ ! "$BAK" ]
# then
#   mkdir -p "$BAK"
# fi

# [ ! -d ./backup ] && mkdir ./backup