#Check input is exist or not
if [ $# -eq 0 ]
then
    #If input is not exist, I search files in current directory
	filePath=$(find . -maxdepth 1 -type f | ls -t | tail -1)
	echo "Do you want to delete $filePath? (y/n)"
        #take input
        read ans
        #if answer is y or Y then program will delete this file.
        if [[ $ans == "y" || $ans == "Y" ]]
        then
            rm $filePath
            echo "1 file deleted."
            echo " "
         #if answer is n or N then program will continue.
        elif [[ $ans == "n" || $ans == "N" ]]
        then 
            echo " "
        else
        #other options is invalid.
            echo "Invalid input."
        fi
else
    #Check input is valid or not
    if [ -d "$1" ]
  	then
         #If input is exist, I search files in current directory
		filePath=$(find $1 -maxdepth 1 -type f | ls $1 -t | tail -1)
	else
		echo 'Please give a valid argument.'
		exit 1
	fi
	echo "Do you want to delete $filePath? (y/n)"
        #take input
        read ans
        #if answer is y or Y then program will delete this file.
        if [[ $ans == "y" || $ans == "Y" ]]
        then
            $(find $1 -name $filePath -type f -delete)
            echo "1 file deleted."
            echo " "
         #if answer is n or N then program will continue.
        elif [[ $ans == "n" || $ans == "N" ]]
        then 
            echo " "
        else
        #other options is invalid.
            echo "Invalid input."
        fi
fi