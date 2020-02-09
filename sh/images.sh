#!/bin/sh
# Created by Roman Sivakov <romansivakov@gmail.com> for project OhMyDev




# https://github.com/jarun/imgp
# Чтобы установить библиотеку PIL в Ubuntu, запустите:

# $ sudo apt-get install python3-pil
# или, используя pip3:

# $ sudo pip3 install pillow

git clone git@github.com:jarun/imgp.git
cd imgp
sudo make install


# https://github.com/stefanzweifel/multi-photo-crop