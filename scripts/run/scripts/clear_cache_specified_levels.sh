#!/bin/bash

levels=( 0 1 2 3 4 5 6 7 8 9 10 11 12 )

for level in "${levels[@]}"
do
    sudo rm -rf /tileservice/cache/hybrid/$level
    #sudo rm -rf /tileservice/cache/map/$level
done

touch /tileservice/cache/planet-import-complete
