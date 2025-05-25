#!/bin/bash

val=$1

[ $val -gt 1 ] && (( val + 30 ))
echo "$val Salut"

if [[ $1 =~ ^[1-9]+$ ]]
then
        echo "$1 >> Coucou"
fi

echo "$val"

i=$( echo "9223372036854775807 + 1" | bc )
echo "$i here"
