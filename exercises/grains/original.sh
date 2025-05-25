#!/usr/bin/env bash

main () {

    total=18446744073709551615
    current_val=1
    user_input=$1

    if [[ $user_input =~ ^[1-9]+$ && $user_input -le 64 ]]
    then

        for ((i = 1; i <= 64; i++))
        do
                [ $i -gt 1 ] && current_val=$( echo "$current_val * 2" | bc )

                if [ $user_input -eq $i ]
                then
                        echo "$current_val"
                fi
        done

    elif [ "$1" == "total" ]
    then
            echo "$total"
    else
            echo "Error: invalid input"
            exit 1
    fi

}

main "$@"
