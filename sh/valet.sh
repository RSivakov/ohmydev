#!/bin/sh
# Created by Roman Sivakov <romansivakov@gmail.com> for project OhMyDev

composer global update

composer global require laravel/valet
valet install
cd ~/Code
valet park


# https://laracasts.com/discuss/channels/servers/valet-and-memory-usage