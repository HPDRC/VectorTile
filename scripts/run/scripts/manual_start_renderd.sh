#!/bin/sh

sudo service apache2 restart
sudo -u mapnik renderd -f -c /tileservice/run/renderd.conf

