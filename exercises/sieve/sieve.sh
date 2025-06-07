#!/usr/bin/env bash

main () {

    res=""

    for ((i = 2; i <= $1; i++))
    do
            prime="true"
            for ((j = 2; j <= $i / 2; j++))
            do
                    (( $i % $j == 0 )) && prime="false" && break
            done

            if [[ $prime == "true" ]]
            then
                    [[ $i -ne 2 ]] && res+=" "
                    res+="$i"
            fi
    done

    echo "$res"

}

main "$@"
