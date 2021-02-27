#Check input is exist or not
if [ $# -eq 0 ]
then
	echo 'Please provide a filename.'
	exit 1
else
    #Check input is valid or not
	if [ -f "$1" ]
  	then
        #If input is valid, I even up filepath variable
		filePath=$1
	else
		echo 'Please give a valid argument.'
		exit 1
	fi
fi
#Change the numbers in txt file
while read -n1 c; do
        if [[ $c == '0' ]]
        then
           sed -i 's/'$c'/zero/g' $filePath
        elif [[ $c == '1' ]]
        then 
            sed -i 's/'$c'/one/g' $filePath
        elif [[ $c == '2' ]]
        then 
            sed -i 's/'$c'/two/g' $filePath
        elif [[ $c == '3' ]]
        then 
            sed -i 's/'$c'/three/g' $filePath
        elif [[ $c == '4' ]]
        then 
            sed -i 's/'$c'/four/g' $filePath
        elif [[ $c == '5' ]]
        then 
            sed -i 's/'$c'/five/g' $filePath
        elif [[ $c == '6' ]]
        then 
            sed -i 's/'$c'/six/g' $filePath
        elif [[ $c == '7' ]]
        then 
            sed -i 's/'$c'/seven/g' $filePath
        elif [[ $c == '8' ]]
        then 
            sed -i 's/'$c'/eight/g' $filePath
        elif [[ $c == '9' ]]
        then 
            sed -i 's/'$c'/nine/g' $filePath
        fi
done < $filePath