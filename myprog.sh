#Take chooice from user
PS3='Please enter your choice: '
options=("Create histogram" "Encryption" "Delete oldest" "Convert numbers" "Organized files" "Exit")
select opt in "${options[@]}"
do
    #Check chooice valid or not, if chooice is valid run script which desired with arguments
    case $opt in
        ("Create histogram")
            echo "Please enter your argument with extension: "
            read param
            bash create_histogram.sh $param
            ;;
        ("Encryption")
            echo "Please enter your argument (String): "
            read param
            echo "Please enter your argument (number): "
            read paramTwo
            bash encryption.sh $param $paramTwo
            ;;
        ("Delete oldest")
            echo "Please enter your directory: "
            read param
            bash delete_oldest.sh $param
            ;;
	("Convert numbers")
            echo "Please enter your argument with extension: "
            read param
            bash convert_numbers.sh $param
            ;;
	("Organized files")
            echo "if you want please enter your option, press enter button for skip: "
            read param
            echo "Please enter your argument with extension: "
            read paramTwo
            bash organized_file.sh $param $paramTwo
            ;;
        ("Exit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
