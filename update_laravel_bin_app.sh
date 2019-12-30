#rm ./bin/ohmydev
cd ./src/ohmydev
php ohmydev app:build -n
cd ../..

#rm ./bin/ohmydev
ln ./src/ohmydev/builds/ohmydev ./bin/ohmydev