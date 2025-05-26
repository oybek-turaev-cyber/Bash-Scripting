#!/bin/bash

input=$1
char=${input:$5:5}
echo "$char is my char"
chars=($(echo "$1" | grep -o .))

hi=${chars[0]}
echo "$hi is fine"
