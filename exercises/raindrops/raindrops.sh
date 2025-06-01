#!/usr/bin/env bash

main () {

    result=""

    (( $1 % 3 )) || result+="Pling" # When it is zero, in bash, it's false, then command after || operator, is executed
    (( $1 % 5 )) || result+="Plang" # When it gets non-zero value, it's true in bash, then || does not allow to execute since it needs false value
    (( $1 % 7 )) || result+="Plong"

    echo ${result:-$1}
}

main "$@"
