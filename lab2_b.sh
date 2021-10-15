#!/bin/bash
X=`cat /etc/passwd | awk -F ":" '/:x:/ {print $1,$3,$4}'`
Y=`cat /etc/group | awk -F ":" '/:x:/ {print $1,$3,$4}'`

while read x
do
    GID=`echo "$x" | awk '{print $3}'`
    username=`echo "$x" | awk '{print $1}'` 
    groupscollection=""
    while read y
    do
        groupid=`echo $y | awk '{print $2}'`
        groupname=`echo $y | awk '{print $1}'`
        groups=`echo $y | awk '{print $3}'`
        grepout=`echo $groups | grep -w $username`
        if [ $GID = $groupid ]
        then
            groupscollection+=" ${groupname}, "
        fi
        if [ "$grepout" ]
        then
            groupscollection+=" ${groupname}, "
        fi
    done <<< $(echo "$Y")
    finalout=`echo "$x" | awk '{print $1,$2}'`
    echo "$finalout${groupscollection::-2}"
done <<< $(echo "$X")