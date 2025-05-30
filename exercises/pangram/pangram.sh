#!/usr/bin/env bash

    alphabet=(abcdefghijklmnopqrstuvwxyz)

#    echo "Unfiltered: $1"

    text=$1
    text=${text//[[:punct:]]/}
    text=${text// /}
    text=${text,,}

#    echo "Filtered: $text"

    alphabet=$(echo "$alphabet" | tr -d "$text")

#    echo "After: $alphabet"
#    echo "Number of Letters Left: ${#alphabet}"

    if [ ${#alphabet} -eq 0 ]
    then
            echo "true"
    else
            echo "false"
    fi

