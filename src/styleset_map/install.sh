#!/bin/sh

installDir=/tileservice/run/map

./make.py
carto $installDir/project.mml > $installDir/style.xml
./process_style.py $installDir/style.xml
echo '\nRemember to change map background color!!!\n'
