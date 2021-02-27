# MAIN_GOAL: Print a histogram which presents distribution of numerical data in provided text file
# Input: fileName.txt
# Output: a histogram

# GOAL_1: Get input and check is it valid or not?
# CHECK_1_1: Is input file is provided by user?
if [ "$#" -lt 1 ]
then
    echo "Please provide an input which indicates text file."
    exit 1
elif [ "$#" -gt 1 ]
then
    echo "Please provide only one input."
else
    #CHECK_1_2: Does provided input exist?
    FILE="$1"
    if [ -e "$FILE" ]
    then
        # GOAL_1 Completed: Input is validated.
        # GOAL_2: Read input file line by line and count numbers between 0-9.
        COUNTS=(0 0 0 0 0 0 0 0 0 0)
        while read -r CURRENT_NUMBER
            do
            # CHECK_2: Is current number between 0-9?
            if [ "$CURRENT_NUMBER" -ge "0" ]
            then
                if [ "$CURRENT_NUMBER" -le "9" ]
                then
                    # GOAL_2 Completed: Current number between 0-9.
                    # GOAL_3: Increment index of COUNTS array depending on CURRENT_NUMBER.
                    ((COUNTS[$CURRENT_NUMBER]++))
                    # GOAL_3 Completed: Value at that index has incremented.
                else
                    echo "$CURRENT_NUMBER is not between 0-9"
                fi
            else
                echo "$CURRENT_NUMBER is not between 0-9"
            fi
        done < "$FILE"
        # GOAL_4: Print histogram to the screen.
        for (( i=0; i < 10; i++ ))
            do
                printf "$i "
                
                for (( j=0; j < ${COUNTS[$i]}; j++ ))
                    do
                        printf "*"
                done
                echo ""
        done
        # GOAL_4 Completed, MAIN_GOAL Completed
    else
        echo "$FILE doesn't exist."
        exit 1
    fi
fi