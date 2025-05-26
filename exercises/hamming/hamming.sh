#!/usr/bin/env bash

main () {

       (( ${#*} < 2 )) && echo "Usage: $0 <string1> <string2>" && exit 1
       (( ${#1} != ${#2} )) && echo "strands must be of equal length" && exit 1

       counter=0

       for (( i = 0; i < ${#2}; i++))
       do
            [ "${1:$i:1}" != "${2:$i:1}" ] && ((counter++))
       done

       echo $counter

}

main "$@"
