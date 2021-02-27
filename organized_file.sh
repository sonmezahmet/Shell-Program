#Check input is exist or not
if [ $# -eq 0 ]
then
	echo 'Please provide a filename.'
	exit 1
else
	#Check first input is exist or not
	if [[ $1 != "-R" ]]
  	then
	  	#If first argument is not exist, other input is valid or not
       	if [[ "$1" == *'"' && "$1" == '"'* && "$1" == *'.txt"' && "$1" == *'*'* ]] 
        then
			#If other argument is valid, find all files and copied in copied directory
			argu=$1
			length=${#1}
			argument=${argu:1:$length - 6}
        	files=$(find . -type f -name "$argument")
			mkdir copies
			cp $files copies
	    else
		    echo 'Please give a valid argument.'
		    exit 1
        fi
	else
		#If first argument is exist, other input is valid or not
		if [[ "$2" == '"'* && $1 == "-R" && "$2" == *'"' && "$2" == *'.txt"'  && "$2" == *'*'* ]] 
        then
			#If other argument is valid, find all files in directory recursivly and copied in copied directory
            argu=$2
			length=${#2}
			argument=${argu:1:$length - 6}
			directoris=$(find . -type d)
			for x in $directoris
			do
				mkdir "$x"/copies
				files=$(find $x -maxdepth 1 -type f -name "$argument")
				cp $files "$x"/copies
			done
	    else
		    echo 'Please give a valid argument.'
		    exit 1
        fi
	fi
fi