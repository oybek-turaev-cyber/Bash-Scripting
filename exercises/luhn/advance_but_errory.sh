#!/usr/bin/env bash

quit() {

    echo false
    exit
}

main() {

    text="$*"
    num="${text// /}"

    [[ $num =~ ^[0-9]*$ ]] || quit
    [[ ${#num} -gt 1 ]] || quit

    declare -i sum=0 digit
    for ((i = 1; i < ${#num}; i++)); do
        digit=${num:$((-i)):1}

        ((i % 2 == 0)) && ((digit *= 2)) && ((digit > 9)) && ((digit -= 9))
        ((sum += digit))

    done

    ((sum % 10 == 0)) && echo true || echo false
}

main "$@"
