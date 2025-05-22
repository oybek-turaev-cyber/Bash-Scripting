#!/usr/bin/env bash

    #TOD
    pow=${#1}

    if [ $pow -eq 1 ]
    then
            echo "true"
    elif [ $pow -gt 1 ]
    then
            sum=0

            for (( i = 0; i < $pow; i++ ))
            do
                num=${1:$i:1}
                sum=$(( $sum + $(( num ** pow ))))
            done

            if [ $sum -eq $1 ]
            then
                    echo "true"
            else
                    echo "false"
            fi
    else
            echo "false"
    fi

