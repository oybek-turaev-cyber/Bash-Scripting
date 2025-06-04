#!/usr/bin/env bash

main () {

word=$1
word=${word^^}
total=0

for ((i = 0; i < ${#word}; i++))
do
#    echo "${word:$i:1} yooo"
    case ${word:$i:1} in
    'A') total=$(( $total + 1 )) ;;
    'E') total=$(( $total + 1 )) ;;
    'I') total=$(( $total + 1 )) ;;
    'O') total=$(( $total + 1 )) ;;
    'U') total=$(( $total + 1 )) ;;
    'L') total=$(( $total + 1 )) ;;
    'N') total=$(( $total + 1 )) ;;
    'R') total=$(( $total + 1 )) ;;
    'S') total=$(( $total + 1 )) ;;
    'T') total=$(( $total + 1 )) ;;
    'D') total=$(( $total + 2 )) ;;
    'G') total=$(( $total + 2 )) ;;
    'B') total=$(( $total + 3 )) ;;
    'C') total=$(( $total + 3 )) ;;
    'M') total=$(( $total + 3 )) ;;
    'P') total=$(( $total + 3 )) ;;
    'F') total=$(( $total + 4 )) ;;
    'H') total=$(( $total + 4 )) ;;
    'V') total=$(( $total + 4 )) ;;
    'W') total=$(( $total + 4 )) ;;
    'Y') total=$(( $total + 4 )) ;;
    'K') total=$(( $total + 5 )) ;;
    'J') total=$(( $total + 8 )) ;;
    'X') total=$(( $total + 8 )) ;;
    'Q') total=$(( $total + 10 )) ;;
    'Z') total=$(( $total + 10 )) ;;
    esac
done

echo "$total"

}

main "$@"
