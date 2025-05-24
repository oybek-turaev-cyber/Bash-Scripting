#!/usr/bin/env bash

main () {

    if [ $# -eq 1 ]
    then
            echo "Hello, $1"
            exit 0
    else
            echo "Usage: $0 <person>"
            exit 1
    fi

}

main "$@"
