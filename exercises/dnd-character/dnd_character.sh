#!/usr/bin/env bash

# initialize the D&D character
character=(
    strength
    dexterity
    constitution
    intelligence
    wisdom
    charisma
)

generate() {

    local abi cha hit

    # loop over character elements
    for cha in "${character[@]}"
    do
        # calculate the ability
        abi=$(ability)
        # list character and ability
        printf "%s %d\n" "$cha" "$abi"
        # add hitpoints to output
        [[ "$cha" == "constitution" ]] && hit=$(( 10 + $(modify $abi) ))
    done
    echo "hitpoints ${hit}"
}

ability() {

    # roll the dice four times and sort the results
    set -- $( { for roll in {1..4}; do roll_dice; done; } | sort -nr )
    # take the sum of the 3 largest dice rolls
    echo $(( $1 + $2 + $3 ))
}

roll_dice() {

    echo $(( 1 + RANDOM % 6 )) # Random number entre 1 et 6
}

modify() {

    local -i n=$1
    (( $n % 2 && n-- )) # reduce by one if number is odd
    echo $(( (n - 10) / 2 )) # calculate modifier
}

main () {

    case $1 in
        generate ) generate    ;;
        modifier ) modify "$2" ;;
        *        ) exit 1      ;;
    esac
}

main "$@"
