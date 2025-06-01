#!/usr/bin/env bash

main () {

    colors=("black" "brown" "red" "orange" "yellow" "green" "blue" "violet" "grey" "white")

    for i in {0..9}
    do
            [ "$2" == "${colors[$i]}" ] && echo "$i" && exit 0
            [ "$1" == "colors" ] && echo "${colors[$i]}"
    done

}

main "$@"
