#!/usr/bin/env bash

main () {

    result=""
    my_bool=1

    if [ $(($1 % 3)) -eq 0 ]
    then
            result+="Pling"
            my_bool=0
    fi

    if [ $(($1 % 5)) -eq 0 ]
    then
            result+="Plang"
            my_bool=0
    fi

    if [ $(($1 % 7)) -eq 0 ]
    then
            result+="Plong"
            my_bool=0
    fi

    if [ $my_bool -eq 1 ]
    then
            echo "$1"
    else
            echo "$result"
    fi
}

main "$@"
