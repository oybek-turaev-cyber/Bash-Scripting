#!/usr/bin/env bash

main () {

        checker="Hello Jow"
        m=${checker:$1:1}

        echo "$m I am m"

}

main "$@"
