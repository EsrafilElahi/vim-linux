# bash structure, need to run bash script
#!/bin/bash

# how to run script.sh files
# 1- chmod +x script.sh
# 2- bash script.sh
# 3- bash script.sh arg1 arg2

###### VARIABLES ######
NAME="John"
AGE=25

echo $NAME
echo "${NAME}'s age is $AGE"

###### USER INPUT ######
read -p "Enter your name: " USERNAME
echo "Hello, $USERNAME!"

###### CONDITIONS ######
read -p "Enter a number: " NUMBER

if [ $NUMBER -gt 10 ]; then
    echo "Number is greater than 10" as true
elif [ $NUMBER -eq 10 ]; then
    echo "Number is exactly 10" as true
elif [ $NUMBER -lt 10 ]; then
    echo "Number is Less than 10" as false
else
    echo "Number is less than 10" as false
fi

# Comparison Examples
if [ "$a" -eq "$b" ];  # Equal
if [ "$a" -ne "$b" ];  # Not Equal
if [ "$a" -gt "$b" ];  # Greater Than
if [ "$a" -lt "$b" ];  # Less Than

###### LOOP ######
# For Loop
FRUITS=("Apple" "Banana" "Cherry")
for fruit in "${FRUITS[@]}"; 
do
    echo "I like $fruit"
done

# While Loop
COUNTER=0
while [ $COUNTER -lt 5 ]; do
    echo "Counter is $COUNTER"
    ((COUNTER++))
done

# Range-based For Loop
for i in {1..5}; do
    echo $i
done

###### FUNCTIONS ######
# Function Declaration
function greet() {
    echo "Hello, $1!"
}

# Calling Function
greet "World Fn Called"

# local variable
HELLO=HelloOutside
function hello {
  local HELLO=WorldIutside
  echo $HELLO
}
echo $HELLO
hello
echo $HELLO

# with parameter
function quit {
  exit
}  
function e {
  echo $1 
}  
e Hello
e World
quit

###### FILE OPERATIONS ######
# Check file existence
FILE="example.txt"

if [ -f "$FILE" ]; then
    echo "$FILE exists"
else
    echo "Creating $FILE"
    touch "$FILE"
fi

# Write to file
echo "Hello, File!" > "$FILE"

# Read from file
cat "$FILE"

###### COMMAND LINE ARGS ######
# Access Arguments
echo "Total arguments: $#"
echo "First argument: $1"
echo "Second argument: $2"

for arg in "$@"; do
    echo "Argument: $arg"
done

###### ERROR HANLDING ######
divide() {
    if [ $2 -eq 0 ]; then
        echo "Error: Division by zero"
        return 1
    fi
    echo $((${1} / ${2}))
}

divide 10 2   # Successful division
divide 10 0   # Error handling

######## tip ########
# automatically whitespace key (or space)
TXT = "this is a test text"
awk '{print $2}' ---> is
awk '{print $4}' ---> test
