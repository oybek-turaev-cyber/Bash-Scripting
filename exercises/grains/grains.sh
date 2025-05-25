#!/usr/bin/env bash

main () {

    total=18446744073709551615
    current_val=1
    user_input=$1

    if [[ $user_input =~ ^[1-9]+$ && $user_input -le 64 ]]
    then
            echo $(echo "2^($user_input - 1)" | bc)

    elif [ "$1" == "total" ]
    then
            echo "$total"
    else
            echo "Error: invalid input"
            exit 1
    fi

}

main "$@"
