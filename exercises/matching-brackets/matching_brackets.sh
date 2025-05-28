#!/usr/bin/env bash

main () {

    input=$(echo "$1" | tr -dc '{}()[]')

    while test ! -z "$input"
    do
        if echo "$input" | grep -q "()"
        then
                input=$(echo "$input" | sed 's/()//g')
        elif echo "$input" | grep -q "{}"
        then
                input=$(echo "$input" | sed 's/{}//g')
        elif echo "$input" | grep -q "\[\]"
        then
                input=$(echo "$input" | sed 's/\[\]//g')
        else
                echo false
                exit 0
        fi
    done

    echo true
    exit 0
}

main "$@"
