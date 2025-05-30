#!/usr/bin/env bash

main () {

    args=("$@")
    if [[ $# -gt 1 ]]
    then

            for ((i = 0; i < $(( $# - 1 )); i++))
            do
                echo "For want of a ${args[$i]} the ${args[$(( $i + 1 ))]} was lost."
            done

            [ $# -ge 2 ] && echo "And all for the want of a ${args[0]}."
    elif [[ $# -eq 1 ]]
    then
            echo "And all for the want of a ${args[0]}."
    else
            echo ""
    fi
}

main "$@"
