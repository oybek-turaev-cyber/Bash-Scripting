#!/usr/bin/env bash

main () {

    codes=("wink" "double blink" "close your eyes" "jump" "")
    binary="$(echo "obase=2; $1" | bc)"

    counter=0
    text=""
    check_reverse="false"

    for ((i = ${#binary} - 1; i >= 0; i--))
    do
        [[ "${binary:$i:1}" == "1" ]] && text+="${codes[$counter]},"
        [[ ${#binary} -eq 5 && "${binary:0:1}" == "1" ]] && check_reverse="true"
        (( counter++ ))

    done

    text="$(echo "$text" | sed 's/,*$//g')"
    [ $check_reverse == "true" ] && echo "$(reverse "$text")" || echo "$text"

}

reverse () {

    rev_text=""
    IFS=',' read -ra words <<< "$1"
    for ((i = ${#words[@]} - 1; i >= 0; i--))
    do
            rev_text+="${words[$i]}"
            [[ $i -gt 0 ]] && rev_text+=","
    done

    echo "$rev_text"

}

main "$@"
