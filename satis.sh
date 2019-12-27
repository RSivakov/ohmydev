#!/bin/sh
# Created by Roman Sivakov <romansivakov@gmail.com> for project OhMyDev

composer global update


# https://github.com/AOEpeople/composer-satis-builder
# https://github.com/realshadow/satis-control-panel
# http://txt.fliglio.com/satis-go/
# https://php.libhunt.com/satis-alternatives

#Установка Satis
docker pull composer/satis
cd ~/Code
git clone git@github.com:benschw/satis-go.git



# Get Composer/Satis and install in path

    # apt-get install -y php5-cli
    # curl -sS https://getcomposer.org/installer | php
    # php ./composer.phar create-project composer/satis /opt/satis --stability=dev --keep-vcs
    # ln -s ~/Code/satis/bin/satis /usr/local/bin/satis

# Install satis-go server & config


    mkdir ~/Code/satis-go
    wget -qO- https://github.com/benschw/satis-go/releases/download/0.1.1/satis-go-`uname`-`uname -m`.gz | \
        gunzip > ~/Code/satis-go/satis-go
    chmod +x satis-go/satis-go
    wget -qO-  https://github.com/benschw/satis-go/releases/download/0.1.1/config.yaml > \
        ~/Code/satis-go/config.yaml

# Install admin ui for satis-go server


    wget -qO-  https://github.com/benschw/satis-admin/releases/download/0.1.1/admin-ui.tar.gz | \
        tar xzv -C ~/Code/satis-go

# Start the server


    ~/Code/satis-go/satis-go

# Открываем Satis ui
open http://localhost:8080/admin
