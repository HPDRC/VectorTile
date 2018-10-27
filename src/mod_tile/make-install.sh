#!/bin/sh

./autogen.sh
./configure
make
sudo make install
sudo make install-mod_tile
sudo service apache2 reload
