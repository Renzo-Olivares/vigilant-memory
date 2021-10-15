#!/bin/bash
FILE=/home/renzo/School/CS183/lab2_git/test.txt
TIMESTAMP=`date +'%m-%d-%Y %H:%M:%S'`
if test -f "$FILE"
then
    echo "$TIMESTAMP - File \"$FILE\" has been found" >> /home/renzo/School/Fall21/CS183/lab2_git/uptime.log
else
    echo "$TIMESTAMP - File \"$FILE\" has been lost" >> /home/renzo/School/Fall21/CS183/lab2_git/uptime.log
fi