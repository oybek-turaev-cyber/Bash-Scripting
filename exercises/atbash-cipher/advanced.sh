#!/usr/bin/env bash

main() {
    input=$(echo "${2,,}" | tr -dc 'a-z0-9')
    output=""

    for ((i = 0; i < ${#input}; i++)); do
        [[ $1 == 'encode' ]] && ! ((i % 5 || i == 0)) && output+=' '
        output+=$(echo "${input:i:1}" | tr 'a-z' 'zyxwvutsrqponmlkjihgfedcba')
    done

    echo "$output"
}

main "$@"

