#unlink ./bin/ohmydev
cd ./src/ohmydev
php ohmydev app:build -n
cd ../..

unlink ./bin/ohmydev
ln ./src/ohmydev/builds/ohmydev ./bin/ohmydev
echo "Ohmydev собран в ./bin/ohmydev"

cd ./src/install
php install app:build -n
cd ../..

unlink ./bin/install
ln ./src/ohmydev/builds/install ./bin/install
echo "Install собран в ./bin/install"