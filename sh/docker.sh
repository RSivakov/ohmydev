#!/bin/sh
# Created by Roman Sivakov <romansivakov@gmail.com> for project OhMyDev

brew install docker
# http://jasonwilder.com/blog/2014/10/13/a-simple-way-to-dockerize-applications/
# https://github.com/jwilder/dockerize#using-templates
brew install dockerize
brew install docker-compose

brew cask install docker

# https://github.com/moncho/dry

# Installation
# The easiest way to install the latest binaries for Linux and Mac is to run this in a shell:

# curl -sSf https://moncho.github.io/dry/dryup.sh | sudo sh
# sudo chmod 755 /usr/local/bin/dry
# Binaries
# If you dont like to curl | sh, binaries are provided.

# darwin 386 / amd64
# freebsd 386 / amd64
# linux 386 / amd64
# windows 386 / amd64
# Mac OS X / Homebrew
# If you're on OS X and want to use homebrew:

brew tap moncho/dry
brew install dry
# Docker
# docker run --rm -it -v /var/run/docker.sock:/var/run/docker.sock -e DOCKER_HOST=$DOCKER_HOST moncho/dry

# Arch Linux
# yaourt -S dry-bin

brew install jesseduffield/lazydocker/lazydocker

# https://kaek.readthedocs.io/ru/latest/project/runner/