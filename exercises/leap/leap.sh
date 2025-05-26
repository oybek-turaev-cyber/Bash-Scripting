#!/usr/bin/env bash

main () {

    if [[ $1 =~ [^0-9]+ ]] || [ -z $1 ] || [ $# -gt 1 ]
    then
            echo "Usage: $0 <year>"
            exit 1
    else
            (( $1 % 4 == 0 && $1 % 100 != 0 )) || (( $1 % 400 == 0 )) && echo true || echo false
    fi
}

main "$@"
