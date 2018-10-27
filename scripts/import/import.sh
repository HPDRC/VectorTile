#!/bin/sh

if [ "$#" -ne 3 -a "$#" -ne 4 ]; then
    echo "Usage: import.sh dir_or_file_to_import db_name table_name [-latin]"
    exit 1
fi

database=$2
table=$3
latin=""
if [ "$#" = 4 ]; then
   if [ "$4" = "-latin" ]; then
       latin="-W latin1"
   else
       echo "The 4th parameter is not -latin, exit script"
       exit 1
   fi
fi

# when input is a directory, import all files under the directory
if [ -d "$1" ]; then
    files=$(find $1 -name "*.shp")
    i=0
    for file in $files; do
        i=$((i+1))
        if [ $i = 1 ]; then
            shp2pgsql $latin -s 4326 -D $file $table | sudo -u postgres psql -d $database >> log
        else
            shp2pgsql $latin -s 4326 -D -a $file $table | sudo -u postgres psql -d $database >> log
        fi
    done
# when input is a file, import it
elif [ -f "$1" ]; then
    shp2pgsql $latin -s 4326 -D $1 $table | sudo -u postgres psql -d $database >> log
# else, prompt error
else
    echo "format of $1 is neither file nor directory"
fi
