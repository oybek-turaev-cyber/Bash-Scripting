#!/usr/bin/env bash

main () {

    case "$2" in
        "black" ) echo "0" ;;
        "brown" ) echo "1" ;;
        "red"   ) echo "2" ;;
        "orange") echo "3" ;;
        "yellow") echo "4" ;;
        "green" ) echo "5" ;;
        "blue"  ) echo "6" ;;
        "violet") echo "7" ;;
        "grey"  ) echo "8" ;;
        "white" ) echo "9" ;;
        *       ) echo -e "black\nbrown\nred\norange\nyellow\ngreen\nblue\nviolet\ngrey\nwhite" ;;

    esac


}

main "$@"
