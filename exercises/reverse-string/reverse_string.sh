#!/usr/bin/env bash

main () {
    echo "$(echo "$1" | rev)"
}

main "$@"
