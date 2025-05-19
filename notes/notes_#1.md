# 🧠 Bash Scripting Notes

---

## 🔧 File Modification Time

Numeric arguments can be specified as:

- `+n` for greater than n,
- `-n` for less than n,
- `n` for exactly n.

```bash
# Find files modified in the last 7 days
find . -type f -mtime -7

# Find files modified exactly 2 days ago
find . -type f -mtime 2

# Find files older than 5 days
find . -type f -mtime +5
````

---

## 📦 Sorting Files

### Sort by File Size

```bash
find . -type f -exec ls -lh {} + | sort -k 5 -n
```

* `-exec ls -lh {} +` → executes `ls -lh`, where `{}` is a placeholder for found results and `+` groups them.
* `sort -k 5 -n` → sorts based on 5th column (file size) numerically (ascending).
* Add `-r` for descending: `sort -k 5 -n -r`

### Sort by Modification Date

```bash
ls -lt       # Newest first
ls -lt -r    # Oldest first
```

---

## 🔍 Finding & Hashing in Loops

```bash
for file in $(find . -type f -size +1M -mtime -3)
do
    md5sum "$file" >> md5_hash.txt
done
```

---

## 🧮 Large Number Calculations with `bc`

* Bash 64-bit integers fail with `2^64 - 1`
* Use `bc` to avoid overflow:

```bash
echo "<calculation>" | bc
```

---

## 🔠 Case Conversion with `tr`

```bash
echo "Hello, World!" | tr 'a-z' 'A-Z'  # Convert lowercase to uppercase
```

---

## 🧵 Quotes in Bash

* `'single quotes'`: everything literal (no variable expansion)
* `"double quotes"`: allows variable expansion and escape sequences
* Escape `$` in double quotes: `"This is \$value"`

---

## 🔄 Reverse a String

```bash
input=$(echo "$input" | rev)
```

---

## 🧮 Arithmetic vs Test

* Use `[[ ... ]]` for string and file tests
* Use `(( ... ))` for arithmetic evaluations
* Don’t mix them.
* Use `$(( ... ))` inside `[[ ... ]]` for math inside string tests

---

## 🔢 Reverse Character Extraction

```bash
$((-i))
```

* Negative index means "from end of string"
* `i=1` → `${num:$((-i)):1}` gives **last character**

---

## 🎲 Set Parameters from Commands

```bash
# Generate 4 dice rolls, sort descending, set as positional parameters
set -- $( { for roll in {1..4}; do roll_dice; done; } | sort -nr )
```

---

## 📏 Conditional Checks with `bc`

```bash
if [[ $(echo "$val > 10" | bc) -eq 1 ]] && echo "message"
```

* `-eq 1` → means "true" because `bc` returns 1 for true, 0 for false

---

## 🧾 `declare` Usage

```bash
declare -r  # read-only
declare -i  # integer
declare -x  # export variable to child process
declare -a  # array
```

> If a variable had a value before `-a`, it becomes the first element (index 0)

---

## 🐚 `bash -c`

```bash
bash -c 'echo $a'
```

* `bash -c` starts a new shell instance
* To pass variables, use `declare -x` or `export`

```bash
a=2
declare -x a
bash -c 'echo $a'   # works
```

---



