#!/bin/sh
# Created by Roman Sivakov <romansivakov@gmail.com> for project OhMyDev

installed(){
   # t stores $1 argument passed to fresh()
   t=$1
    if hash $1 2>/dev/null; then
        echo 'we have ' + $1
        return 1
    else
        echo 'no php' + $1
        return 0
    fi
}
