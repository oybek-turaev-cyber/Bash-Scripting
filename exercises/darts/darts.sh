#!/usr/bin/env bash

main () {
    ( [[ $1 =~ [^0-9.-] || $2 =~ [^0-9.-] ||  $# -ne 2 ]] ) && echo "invalid input" && exit 1

    x=$(echo "scale=2; $1 * $1" | bc -l)
    y=$(echo "scale=2; $2 * $2" | bc -l)
    sum=$( echo "scale=2; $x + $y" | bc -l )
    sum=$(echo "scale=2; sqrt($sum)" | bc)

    if [ $(echo "$sum <= 1" | bc -l) -eq 1 ]; then echo "10"; fi
    if [ $(echo "$sum <= 5" | bc -l) -eq 1 ] && [ $(echo "$sum > 1" | bc -l) -eq 1 ]; then echo "5"; fi
    if [ $(echo "$sum <= 10" | bc -l) -eq 1 ] && [ $(echo "$sum > 5" | bc -l) -eq 1 ]; then echo "1"; fi
    if [ $(echo "$sum > 10" | bc -l) -eq 1 ]; then echo "0"; fi

}

main "$@"
