#!/usr/bin/env bash

main () {

    if [[ $# -eq 0 || $# -eq 1 ]]
    then
            echo "Usage: $0 <string1> <string2>"
            exit 1
    fi

    if [[ ${#1} == ${#2} ]]
    then

            counter=0

            strand_one=($(echo "$1" | grep -o .))
            strand_two=($(echo "$2" | grep -o .))

            for (( i = 0; i < ${#2}; i++))
            do
                char_one=${strand_one[$i]}
                char_two=${strand_two[$i]}

                if [[ ! "$char_one" == "$char_two" ]]
                then
                        ((counter++))
                fi

            done

            echo "$counter"
            exit 0

    else
            echo "strands must be of equal length"
            exit 1
    fi
}

main "$@"
