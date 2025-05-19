.*"	    Greedy	     Last "	  "Hello" and then "
.*?"	Non-Greedy	First "	  "Hello"

In regex, anything inside parentheses () is a capturing group.

How Backreferences (\1, \2, etc.) Work

\1 refers to the first captured value
\2 refers to the second captured value, and so on

sed -E "s/.*User '([^']+)'.*/\1/"

We are telling sed:

Find the pattern User 'USERNAME' inside the text.
Capture (()) only USERNAME (inside the single quotes).
Replace the whole match with just USERNAME (\1).

>> \b >> to find the standalone words

Regex: \bdog\b

The dog is barking
hotdog
The quick dog

\bdog\b matches "dog" in the first and third lines but not "hotdog", as it's not a standalone word.

>> Email match
([\w.-]+@[\w.-]+\.\w+ >> (. - also added here) 

>> ip match for private
\b((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9][0-9]?)(\.|$)){4}\b >> or you can just repeat the firs octet for the rest octets

>> 
✅ [abc] → Matches a, b, or c
✅ [0-9] → Matches any digit
✅ \d → Matches any digit (0-9) (same as [0-9])
✅ \w → Matches word characters (letters, numbers, _)
✅ \s → Matches whitespace (spaces, tabs, newlines)
✅ \S > [^\n\t\r\ ]
✅ \W > [^\w]



>> 



>> Quantifier	Meaning
✅ *	0 or more times
✅ +	1 or more times
✅ ?	0 or 1 time (optional)
✅ {n}	Exactly n times
✅ {n,}	At least n times
✅ {n,m}	Between n and m times


>> Capturing groups >> ()
(\d{4})-(\d{2})-(\d{2})

>> Non-capturing groups (?: ) are useful when you don’t need to extract a part of the match.
(?:https?|ftp)://\S+

>> (.*) vs (.*?)
? >> character is too add laziness >> it stops at the first match and it is not greedy
User "heloo" match" >> User\s"(.*?)" >> now it stops at the end of helloo but if we use (.*) it stops at the end of match since it's greedy

>> Lookarounds
✅ Positive Lookahead (?=...) – Ensures something follows without including it
✅ Negative Lookahead (?!...) – Ensures something does not follow
✅ Positive Lookbehind (?<=...) – Ensures something precedes without including it
✅ Negative Lookbehind (?<!...) – Ensures something does not precede

>> User\s+\w+(?=\s+failed\s+login) >> ✅ Matches: User admin (only if followed by " failed login

>> User\s+\w+(?!\s+logged\s+in) >> Matches: User Mike (if NOT followed by " logged in")

>> (?<=User\s+)\w+ >> ✅ Matches: admin in User admin failed login attempt

>> (?<!User\s+)Guest >> ✅ Matches: Guest in Guest failed login attempt


>> Greedy Matching vs Lazy Matching 
Key character to define laziness is to add "?"

>>✅ \bre\w+ vs \bre\w*
It reads words starting with 're' >> + makes sure that at least one character we have while * allows no character at least 

>>✅  \b\w+\b$ >> to get the last word in the line

>>✅  (?:.*\n?){3} >> to read the first three lines

>>✅  Regex using ([^"]+) (Recommended) >> to capture anything except "

>> `(?=\s+(?:failed|accessed))` → Ensures that **either** `" failed"` **or** `" accessed"` **follows**, but does not include them in the match.

>> How To Detect Size of the Files
Content-Length:\s*(\d{8,}) >>  Matches any number with **8 or more digits**, ensuring the number is at least 10000000 (10 million), which is 10 MB in bytes

### **Fixed-Length vs Non-Fixed-Length Lookbehinds:**

- **Fixed-length:** The pattern behind the match has a **known and constant length**. For example, 
`(?<=abc)` will always check for "abc" behind the match, which is 3 characters long. This works fine in all regex engines.

- **Non-fixed-length:** When you're trying to check for **either `Content-Length` (14 characters) or `POST` (4 characters)**, 
the engine doesn’t know how many characters to look behind for, so it gets confused.




