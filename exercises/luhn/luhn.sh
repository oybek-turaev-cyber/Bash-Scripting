#!/usr/bin/env bash

main () {

    input=$1
    input=$(echo $input | sed 's/[^0-9]//g')

    total=$(validate $input)
    if [[ ! $1 =~ [[:punct:][:alpha:]] ]] && (( total % 10 == 0  && (total != 0 | ${#input} > 1) ))
    then
            echo "true"
    else
            echo "false"
    fi
}


function validate {

     local sum=0
     for ((i = ${#1} - 1; i >= 0; i -= 2))
     do
         (( sum += ${1:$i:1} ))

         if (( (i - 1) >= 0 ))
         then
             digit=${1:$((i - 1)):1}

             (( digit *= 2 ))

             if (( digit > 9  && digit % 9 == 0 ))
             then
                     digit=9

             elif (( digit > 9 ))
             then
                 (( digit %= 9 ))
             fi

             (( sum += digit ))
        fi
    done

    echo "$sum"
}

main "$@"

