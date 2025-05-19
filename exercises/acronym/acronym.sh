#!/bin/bash

m=""

for word in "$@"
do
    word=${word//-/ }

    word=${word//[[:punct:]]/}

    for each in $word
    do
        m+=${each:0:1}
    done

done
    echo "${m^^}"
