#!/usr/bin/env bash

main () {

    colors=("black" "brown" "red" "orange" "yellow" "green" "blue" "violet" "grey" "white")

    [ $# -gt 3 ] && echo "invalid color" && exit 1

    check1="false"
    check2="false"
    for i in {0..9}
    do
            [ "$1" == "${colors[$i]}" ] && first="$i" && check1="true"
            [ "$2" == "${colors[$i]}" ] && second="$i" && check2="true"
    done

    sum="${first}${second}"
    [[ $check1 == "true" &&  $check2 == "true" ]] && echo "$(echo "$sum" | sed 's/^0//g')" || ( echo "invalid color" && exit 1 )

}

 main "$@"
