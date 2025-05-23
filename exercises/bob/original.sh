#!/usr/bin/env bash

# Plan >> 5 cases >> 
        # 1 >> anything if the last character is ? >> "Sure"
        # 2 >> all capital letters >> "Whoa, chill out!"
        # 3 >> if you yell a question
        # 4 >> for nothing or whitespaces >> "Fine. Be that way!"
        # 5 >> to anything else >> "Whatever"

    capital=1

    text=$1
    text=$(echo "$text" | sed 's/[^a-zA-Z? ]//g')
    text=${text//[0-9]/}
    text=${text//[$' \t\n\r']/}
    text=${text%%[[:space:]]*}

#    echo "Filtered: $text"

    [[ "$text" =~ ^[A-Z]+\??$ ]] && capital=0

    if [[ "${text:(( ${#text} - 1 )):1}" == "?" && "$capital" == "1" ]]
    then
            echo "Sure."

    elif [[ $capital == "0" && ! "$1" =~ .*\?$ ]]
    then
            echo "Whoa, chill out!"

    elif [[ "$1" =~ ^[WH].*\?$ ]]
    then
            echo "Calm down, I know what I'm doing!"

    elif [[ ($# -eq 0 || -z "$text") && ! "$1" =~ [0-9] ]]
    then
            echo "Fine. Be that way!"

    else
            echo "Whatever."
    fi
