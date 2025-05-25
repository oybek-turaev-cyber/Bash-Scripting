#!/usr/bin/env bash
main () {

files=()
pattern=""

# First Loop

for args in "$@"
do
    if [[ "$args" =~ (^[-][nlivx]) ]]
    then
            while getopts ":nlivx" flags
            do
                case ${flags} in
                    n ) numbered_lines=true ;;
                    l ) files_only=true ;;
                    i ) shopt -s nocasematch ;;
                    v ) invert_match=true ;;
                    x ) match_entire_line=true ;;
                esac
            done

    elif [[ "$args" =~ .txt$ ]]
    then
            files+=( $args )
    else
            pattern="$args"
    fi
done


# Second Loop

for file in "${files[@]}"
do
        if [[ "${#files[*]}" -gt 1 ]]
        then
                prefix="$file:"
        else
                prefix=""
        fi

        line_count=0

        while IFS= read -r line
        do
                (( line_count++ ))
                if [[ "$line" =~ $pattern ]] && [[ $files_only  ]];
                then
                        printf '%s\n' "$file"
                        break
                elif [[ $invert_match ]]
                then
                        if [[ $match_entire_line ]]
                        then
                                if ! [[ "$line" == "$pattern" ]]
                                then
                                        if [[ $numbered_lines ]]
                                        then
                                                printf '%s\n' "$prefix$line_count:$line"
                                        else
                                                printf '%s\n' "$prefix$line"
                                        fi
                                fi
                        fi
                elif [[ $match_line ]]
                then
                        if [[ "$line" == "$pattern" ]]
                        then
                                if [[ $numbered_lines ]]
                                then
                                        printf '%s\n' "$prefix$line_count:$line"
                                else
                                        printf '%s\n' "$prefix$line"
                                fi
                        fi
                else
                        if [[ "$line" == "$pattern" ]]
                        then
                                if [[ $numbered_lines ]]
                                then
                                        printf '%s\n' "$prefix$line_count:$line"
                                else
                                        printf '%s\n' "$prefix$line"
                                fi
                        fi
                fi
        done < "$file"
done







}

main "$@"
