
source vagrant.sh
source virtualbox.sh


vagrant box add laravel/homestead --provider=virtualbox

git clone https://github.com/laravel/homestead.git ~/Homestead
cd ~/Homestead

git checkout release

sh init.sh

echo "192.168.10.10 homestead.test" >> pbcopy
sudo vi /etc/hosts
vi ~/Homestead/Homestead.yamls
