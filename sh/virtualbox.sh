

LASH_PATH=$(PWD)
cd /tmp
wget https://download.virtualbox.org/virtualbox/6.0.14/VirtualBox-6.0.14-133895-OSX.dmg
open ./VirtualBox-6.0.14-133895-OSX.dmg
open /Volumes/VirtualBox/VirtualBox.pkg
wget https://download.virtualbox.org/virtualbox/6.0.14/Oracle_VM_VirtualBox_Extension_Pack-6.0.14.vbox-extpack
open ./Oracle_VM_VirtualBox_Extension_Pack-6.0.14.vbox-extpack
cd $LASH_PATH
