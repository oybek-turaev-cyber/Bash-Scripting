#!/bin/env bash

main () {

word=${1,,}
total=0

for char in $(echo $word | grep -o .)
do
    case $char in
    [aeioulnrst]) (( total+= 1 )) ;;
    [dg]        ) (( total+= 2 )) ;;
    [bcmp]      ) (( total+= 3 )) ;;
    [fhvwy]     ) (( total+= 4 )) ;;
    k           ) (( total+= 5 )) ;;
    [jx]        ) (( total+= 8 )) ;;
    *           ) (( total+= 10 )) ;;
    esac
done

echo "$total"

}

main "$@"
