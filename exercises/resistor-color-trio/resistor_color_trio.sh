#!/usr/bin/env bash

main () {

    colors=("black" "brown" "red" "orange" "yellow" "green" "blue" "violet" "grey" "white")

    for i in {0..9}
    do
            [ "$1" == "${colors[$i]}" ] && first="$i"
            [ "$2" == "${colors[$i]}" ] && second="$i"
            [ "$3" == "${colors[$i]}" ] && third="$i"
    done

    sum=$(echo "${first}${second}" | sed 's/^0//g')
    zeros=${third}

    if [[ "$first" =~ [0-9] ]] && [[ "$second" =~ [0-9] ]] && [[ "$third" =~ [0-9] ]]
    then
            (( sum *= 10 ** $zeros ))
    else
            echo "Invalid Third Color" && exit 1
    fi

    zeros=0
    for (( j = 0; j < ${#sum}; j++ ))
    do
            [[ "${sum:$j:1}" == "0" ]] && (( zeros++ ))
    done

    follow=""
    case $zeros in
    [345] ) follow="kiloohms" && (( sum /= 1000 ))      ;;
    [678] ) follow="megaohms" && (( sum /= 1000000 ))   ;;
    9 ) follow="gigaohms" && (( sum /= 1000000000 ));;
    * ) follow="ohms"     ;;
    esac

    echo "$sum $follow"

}

main "$@"
