# Bash Scripting Review

## Key Points

- **Windows Subsystem for Linux (WSL):** Bash can be run on Windows starting from May 2019.
- **Shebang:** The first line of a Bash script, starting with `#!`, specifies the interpreter to be used.
    - Example: `#!/bin/bash`
    - Example: `#!/usr/bin/env python`
    - Example: `#!/usr/bin/env perl`
- **Execution with `bash`:** If a script is executed using the `bash` command in the terminal (e.g., `bash script.sh`), it does not require execute (`-x`) permissions.
- **IFS (Internal Field Separator):** Used to define word boundaries for command substitution and other parsing operations.
- **Special Variables:**
    - `$#`: Number of arguments passed to the script.
    - `$@`: Array of all arguments passed to the script.
    - `$n`: Access the nth argument (e.g., `$1` for the first argument).
    - `$$`: Process ID (PID) of the currently executing script.
    - `$?`: Exit status of the last executed command (0 for success, non-zero for failure).
- **Variables:** All variables in Bash are treated as strings.
    - Examples: `domain=$1`, `domain=1`, `domain="hello"`
- **Arrays:** Ordered collections of elements.
    - Declaration:
        - `domains=(www.inlanefreight.com ftp.inlanefreight.com vpn.inlanefreight.com www2.inlanefreight.com)`
        - `domains=("www.inlanefreight.com ftp.inlanefreight.com" vpn.inlanefreight.com www2.inlanefreight.com)` (Note: the first two are treated as a single element here)
    - Accessing elements: `echo ${domains[0]}`
- **Variable Length:** Get the length of a variable using `${#variable}`.
- **Boolean Operators:** Used for conditional expressions.
    - `[[ <condition> ]]`: Returns "true" or "false". String comparisons are typically done within double square brackets.
    - Example: `if [[ ! $# -lt 0 && -e "$1" && ! -x "$1" || -r "$1" && -w "$1" ]]`
- **Functions:** Blocks of code that can be called by name.
    - Can accept and process parameters.
    - **Variable Scope:** By default, all variables in Bash are global.
    - **Local Variables:** Use the `local` keyword inside a function to declare a variable with local scope.
    - **Function Definition Syntax:**
        - `function name { commands }`
        - `name() { commands }`
- **Getting String Length:**
    - `salt=$(echo $var | wc -c)`: This command includes the newline character added by `echo`.
    - `salt=${#var}`: This provides the length of the string in `$var` without the newline.
    - **Note:** In some contexts (like HTB challenges), the `wc -c` method might be expected due to the inclusion of the newline character.
- **Checking for Empty String:**
    - `if [[ ! -z "$salt" ]]`
- **Integer Comparison Operators:**
    - `-eq`: Equal to (`==`)
    - `-ne`: Not equal to (`!=`)
    - `-lt`: Less than (`<`)
    - `-le`: Less than or equal to (`<=`)
    - `-gt`: Greater than (`>`)
    - `-ge`: Greater than or equal to (`>=`)
- **File Operators:** Used to test properties of files.
    - `-e`: Checks if a file or directory exists.
    - `-f`: Checks if a path is a regular file.
    - `-d`: Checks if a path is a directory.
    - `-L`: Checks if a path is a symbolic link.
    - `-N`: Checks if a file has been modified since the last read.
    - `-r`: Checks if the current user has read permission.
    - `-w`: Checks if the current user has write permission.
    - `-x`: Checks if the current user has execute permission.
    - `-s`: Checks if a file has a size greater than zero (is not empty).
    - `-G`: Checks if the file's group ID matches the current user's group ID.
    - `-O`: Checks if the current user owns the file.
    - **Examples:**
        ```bash
        if [ -e "$1" ]
        then
            echo "file exists"
        fi

        if [ -f "$1" ]
        then
            echo "it's a file"
        elif [ -d "$1" ]
        then
            echo "it's a directory"
        elif [ -x "$1" ]
        then
            echo "it has execute rights"
        fi
        ```
- **`grep` Alternation:** The `\|` operator in `grep` acts as an "OR" condition.
    - Example: `grep *NetRange\|CIDR*` will search for lines containing either "NetRange" or "CIDR".
- **`tee` Utility:** Reads from standard input, writes to standard output and files.
    - `tee -a file.txt`: Appends the input to `file.txt` and also displays it on the terminal.
- **Printing Last Characters of a Variable:**
    - Technique 1: `echo "$variable" | tail -c number_of_characters_or_bytes` (Bytes and characters are equivalent for standard ASCII)
    - Technique 2: `${variable: -number_of_characters}`
- **Checking if a String Contains Another String:**
    - Wildcard Method: `[[ "$var" == *"$value"* ]]`
    - `grep` Method: `echo "$var" | grep -q "$value"` (The `-q` option suppresses normal output)
- **Indirect Expansion:** `${!variable}` allows you to use the value of one variable as the name of another variable.
    - **Variable Scope in Shells:** Variables created directly in the terminal are part of the parent shell and are not automatically accessible to subshells where scripts are executed.
    - When a script runs, it's in a subshell, which has its own memory space.
    - Variables in the parent shell are not inherited by default and are destroyed when the shell session ends.
- **Variable Management:**
    - **Viewing Variables:** `set | grep variable` or `declare | grep variable`
    - **Deleting Variables:** `unset variable`
- **Conditional Variable Checks:**
    - `-v variable`: Checks if the variable exists.
    - `-z "$variable"`: Checks if the variable is empty (zero length).
    - `-n "$variable"`: Checks if the variable is not empty (non-zero length).

## Structures

- **Script Arguments:** When a script is executed with arguments:
    ```bash
    ./script.sh ARG1 ARG2 ARG3 ... ARG9
    ```
    The arguments are assigned to special variables:
    - `$0`: The name of the script itself (`./script.sh`).
    - `$1`: The first argument (`ARG1`).
    - `$2`: The second argument (`ARG2`).
    - ...
    - `$9`: The ninth argument (`ARG9`).

- **`if-else` Statement:**
    ```bash
    if [ condition ]
    then
        # commands to execute if condition is true
    elif [ another_condition ]
    then
        # commands to execute if another_condition is true
    else
        # commands to execute if none of the above conditions are true
    fi
    ```

- **`case` Statement:** Used for multi-way branching based on the value of a variable.
    ```bash
    ips=20

    case $ips in
        "10" ) echo "Salut, comment t'allest te?";;
        "20" ) echo "Bonjour, Monsieur et Madmoiselle Jackie";;
        *) echo "Unknown value";; # Optional default case
    esac
    ```
    - Each pattern is followed by `)`, the commands to execute, and `;;` to terminate the case for that pattern.
    - `*)` is a wildcard that matches any value not matched by previous patterns.

- **Loops:**
    - **`for` Loop:** Iterates over a sequence of items.
        ```bash
        for variable in file1 file2 file3 file4
        do
            echo $variable
        done

        for ip in "10.10.14.170 10.10.10.174 10.10.10.175"
        do
            ping -c 1 $ip
        done

        # Single line for loop
        for ip in 10.10.10.158 10.10.10.155 10.10.10.159; do ping -c 1 $ip; done
        ```

    - **`while` Loop:** Executes as long as a condition is true.
        ```bash
        counter=0
        while [ $counter -lt 10 ]
        do
            ((counter++))
            echo "counter is $counter"
        done
        ```

    - **`until` Loop:** Executes as long as a condition is false (continues until the condition becomes true).
        ```bash
        counter=0
        until [ $counter -eq 10 ]
        do
            ((counter++))
            echo "Counter: $counter"
        done
        ```
