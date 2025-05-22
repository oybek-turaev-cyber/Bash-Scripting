#!/usr/bin/env bash

main () {

    order=$1
    input=$2
    input=$(echo "$input" | sed 's/[[:punct:] ]//g')
    input=${input,,}
    text_cipher=""
    count=0

    for ((i = 0; i < ${#input}; i++))
    do
            char=${input:$i:1}
            [[ $char =~ [a-z] ]] && char_cipher=$(replace $char) && text_cipher+="$char_cipher" || text_cipher+="$char"

            (( count++ ))
            if [ $order == "encode" ] && (( $i != 0 && count == 5 && ( $i + 1 ) !=  ${#input} ))
            then
                    text_cipher+=" "
                    count=0
            fi
    done

    echo "$text_cipher"
}

replace () {

    alpha=(a b c d e f g h i j k l m n o p q r s t u v w x y z)
    cipher=(z y x w v u t s r q p o n m l k j i h g f e d c b a)

    char_r=$1
    for ((j = 0; j < ${#alpha[@]}; j++))
    do
            if [ "$char_r" == "${alpha[$j]}" ]
            then
                    echo "${cipher[$j]}"
                    return
            fi
    done
}

main "$@"
