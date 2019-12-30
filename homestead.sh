brew cask install vagrant
cd /tmp
wget https://download.virtualbox.org/virtualbox/6.0.14/VirtualBox-6.0.14-133895-OSX.dmg
open ./VirtualBox-6.0.14-133895-OSX.dmg
open /Volumes/VirtualBox/VirtualBox.pkg
wget https://download.virtualbox.org/virtualbox/6.0.14/Oracle_VM_VirtualBox_Extension_Pack-6.0.14.vbox-extpack
open ./Oracle_VM_VirtualBox_Extension_Pack-6.0.14.vbox-extpack

vagrant box add laravel/homestead --provider=virtualbox

git clone https://github.com/laravel/homestead.git ~/Homestead
cd ~/Homestead

git checkout release

sh init.sh

sudo echo "192.168.10.10 homestead.test" >> /etc/hosts
vi ~/Homestead/Homestead.yamls
