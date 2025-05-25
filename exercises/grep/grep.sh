#!/usr/bin/env bash

files=()
pattern=""

# First for loop
# If any begin with "-" and then contain "n","l","i","v","x", run them through getopts
# getopts then sets true or false for each letter as necessary
# n: Output must have numbered lines
# l: List files that match. NOTE: THIS FLAG TAKES PRECEDENCE OVER ALL OTHER FLAGS
# i: Case insensitive. It's easier to just set "shopt -s notcasematch"
# v: Output is lines that do NOT match
# x: Entire line has to match
#
# If they don't fall in those categories and end in .txt, add them to the files array
#
# If they don't fall into any of the above, add them to the pattern.
for args in "$@"; do
    if [[ "$args" =~ (^[-][nlivx]) ]]; then
        while getopts ":nlivx" flags; do
            case ${flags} in
                n) numberedLines=true;;
                l) filesOnly=true;;
                i) shopt -s nocasematch ;;
                v) invertMatch=true;;
                x) matchEntireLine=true;;
            esac
        done
    elif [[ "$args" =~ .txt$ ]]; then
            files+=( $args )
    else
        pattern="$args"
    fi
done
# Second for loop
# If there are more than one file, prefix all output with the filename
# Else, prefix it with nothing
#
# Set the $lineCount variable here; if it's set anywhere else, it will not reset after the end of a file
#
# Read in each line from the file as the variable $line
# Add 1 to $lineCount
# If some part of the pattern is found in line and the "l" option was used, output the file and break the loop
# REMEMBER, "l" TAKES PRECEDENCE OVER EVERYTHING ELSE
#
# Else, if the "v" option was used, check to see if the "x" option was used as well
# If the entire line does NOT match the pattern, output
# Check to see if the "n" option was used as well
# If so, prepend the line number
# If more than one file, prepend the filename first and foremost
# Else, print the prefix and line
#
# Check to see if "x" was used with "v"
# If not, check to see if any part of the pattern is found in the line
# Check to see if the "n" option was used
# If both are true and more than one file, output filename:line number:line
# Else, output prefix:line
#
# Check to see if "x" was used
# If the entire line matches the pattern, check to see if "n" was also passed through
# If both are true and more than one file, output filename:line number:line
# Else, output prefix:line
#
# Finally, if no options were passed, check to see if pattern matches any part of line
# If true and "n" option was used and multiple files, output filename:line number:line
# Else, output prefix:line
###
for file in "${files[@]}"; do
    if [[ "${#files[*]}" -gt 1 ]]; then
        prefix="$file:"
    else
        prefix=""
    fi
    lineCount=0
    while IFS= read -r line; do
        (( lineCount++ ))
        if [[ "$line" =~ $pattern ]] && [[ $filesOnly ]]; then
            printf '%s\n' "$file"
            break
        elif [[ $invertMatch ]]; then
            if [[ $matchEntireLine ]]; then
                if ! [[ "$line" == "$pattern" ]]; then
                    if [[ $numberedLines ]]; then
                        printf '%s\n' "$prefix$lineCount:$line"
                    else
                        printf '%s\n' "$prefix$line"
                    fi
                fi
            elif [[ ! $matchEntireLine ]]; then
                if ! [[ "$line" =~ $pattern ]]; then
                    if [[ $numberedLines ]]; then
                        printf '%s\n' "$prefix$lineCount:$line"
                    else
                        printf '%s\n' "$prefix$line"
                    fi
                fi
            fi
        elif [[ $matchEntireLine ]]; then
            if [[ "$line" == "$pattern" ]]; then
                if [[ $numberedLines ]]; then
                    printf '%s\n' "$prefix$lineCount:$line"
                else
                    printf '%s\n' "$prefix$line"
                fi
            fi
        else
            if [[ "$line" =~ $pattern ]] ; then
                if [[ $numberedLines ]]; then
                    printf '%s\n' "$prefix$lineCount:$line"
                else
                    printf '%s\n' "$prefix$line"
                fi
            fi
        fi
    done < "$file"
done
