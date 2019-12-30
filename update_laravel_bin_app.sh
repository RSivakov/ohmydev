#unlink ./bin/ohmydev
cd ./src/ohmydev
php ohmydev app:build -n
cd ../..

unlink ./bin/ohmydev
ln ./src/ohmydev/builds/ohmydev ./bin/ohmydev