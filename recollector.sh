#!/bin/bash

FILE=red_$1.0.txt
touch $FILE
echo '' > $FILE

for IP in `seq 1 254`; do
    ping -c 1 $1.$IP | grep "bytes from" | cut -d " " -f 4 | cut -d ":" -f 1 >> VIP &
    NAME=`nslookup $1.$IP | grep "name =" | cut -d "=" -f 2`
    if [ $NAME ]; then
        echo $1.$IP $NAME >> $FILE
    fi
done
mv $FILE file/$FILE