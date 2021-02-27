# MAIN_GOAL: Convert the inputted string into ciphered string using inputted number.
# Input: string number
# Output: cipheredString

# FUNCTIONS
chr() { # Returns a character depending on ascii value.
  [ "$1" -lt 256 ] || return 1
  printf "\\$(printf '%03o' "$1")"
}

ord() { # Returns ascii code of arg.
  LC_CTYPE=C printf '%d' "'$1"
}

encryptChar() { # (asciiCode, number) Encrypts char with given number and returns it.
    NEW_ASCII=`expr $1 + $2`
    #CHECK: Is it lower case or upper case?
    if [ "$1" -ge 65 ]
    then
        if [ "$1" -le 90 ]
        then
            # Upper case
            # CHECK: Does it exceeds the 90 when asciiCode and number added
            if [ "$NEW_ASCII" -gt 90 ]
            then
                MODULO=`expr $NEW_ASCII % 90`
                NEW_ASCII=`expr 64 + $MODULO`
            fi
        fi
    fi

    if [ "$1" -ge 97 ]
    then
        if [ "$1" -le 122 ]
        then
            # Lower case
            # CHECK: Does it exceeds the 122 when asciiCode and number added
            if [ "$NEW_ASCII" -gt 122 ]
            then
                MODULO=`expr $NEW_ASCII % 122`
                NEW_ASCII=`expr 96 + $MODULO`
            fi
        fi
    fi
    
    chr $NEW_ASCII
}

# GOAL_1: Get input and check is it valid or not?
# CHECK_1_1: Are inputs provided by user?
if [ "$#" -ne 2 ]
then
    echo "Please provide two inputs (string number)."
    exit 1
fi
# CHECK_1_2: Are inputs in desired format?
STRING=$1
NUMBER=$2
if [ ${#STRING} -ne ${#NUMBER} ]
then
    if [ ${#NUMBER} -ne 1 ]
    then
        echo "Not valid input. Please sure that your number input's length equals your string input length or 1"
        exit 1
    fi
fi
# GOAL_1 Completed: Inputs are validated.

for (( i=0; i<${#STRING}; i++ ))
    do
        CHARS[$i]="${STRING:$i:1}"
done

# GOAL_2_1: If inputted number's length equals one, encrypt inputted string's all characters depending on this number.
if [ "${#NUMBER}" -eq 1 ]
then
    for (( i=0; i<${#CHARS[*]}; i++ ))
        do
            ASCII_CHAR=`ord ${CHARS[$i]}`
            encryptChar $ASCII_CHAR $NUMBER
    done
fi
# GOAL_2_1 Completed.

# GOAL_2_2: If inputted number's length equals inputted string's length, encyrpt each characters with depending number. 
for (( i=0; i<${#NUMBER}; i++ ))
    do
        NUMBERS[$i]="${NUMBER:$i:1}"
done


if [ "${#NUMBER}" -ne 1 ]
then
    for (( i=0; i<${#CHARS[*]}; i++ ))
        do
            ASCII_CHAR=`ord ${CHARS[$i]}`
            encryptChar $ASCII_CHAR ${NUMBERS[$i]}
    done
fi
# GOAL_2 Completed, MAIN_GOAL Completed.