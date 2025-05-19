## Key Notes
>> ${1:-"argument"}
    echo ${1:-"you"} >> it parameter expansion technique

    If $1 is unset or empty then it assigns "you" to the $1 and prints it!
    If $1 is not empty, then its value is printed

>> In Bash, a non-zero remainder is considered true, while a zero remainder is considered false.

The || operator executes the command only if the condition before it is false
The && operator executes the command only if the condition before it is true

>> In Bash, to replace characters: some techniques
*With tr"
var=$(echo $var | tr '-' ' ') 
var=$(echo $var | tr '[[:punct:]]' '')

*With sed*
var=$(echo $var | sed 's/[-_*]/ /g') >> sed 's/pattern/replacement/g'

*With parameter expansion*

var=${variable//pattern/replacement}

var=${var//-/ } >> to replace dash(-) with space( )

var=${var//[[:upper:]]/} >> to replace or remove all punctuations

>> Access to the characters in string arguments:
*with parameter expansion*
char=${text:start:length}
char=${text:0:1} >> to retrieve the first character from the string

>> How to make uppercase letters
*using parameter expansion*

var=${var^^}

>> How to make lowercase letters
*With tr"
text=$(echo "$text" | tr '[:upper:]' '[:lower:]')

var=${var,,}

>>

[]	Traditional test command (conditions)

[[ ]]	Improved conditional expressions in Bash >> worked with regex =~

()	Subshell execution, array declaration, function parameters

{}	Command grouping (same shell execution)

((<condition>)) >> for arithmetic comparisons && calculations, inside if-else, no need for -eq, -gt..


>> How to replace characters in string with substring, 
*With tr* >> it removes all occurences of the each character of substring from the text string >> not substring itself

text=$(echo $text | tr -d "$substring")


### How To Group elements in CASE Statements using []

case $char in
    [aeioulnrst]) (( total+= 1 )) ;;
    [dg]        ) (( total+= 2 )) ;;
    [bcmp]      ) (( total+= 3 )) ;;
    [fhvwy]     ) (( total+= 4 )) ;;
    k           ) (( total+= 5 )) ;;
    [jx]        ) (( total+= 8 )) ;;
    *           ) (( total+= 10 )) ;;   # * to define anything else
esac












