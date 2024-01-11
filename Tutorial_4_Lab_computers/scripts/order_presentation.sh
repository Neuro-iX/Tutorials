### Create the list

declare -a list=("Benoit" "Kaveh" "Sadaf" "Charles" "Ghazal" "Melanie" "Sukesh")
#echo ${list[@]}
#echo ${#list[@]}

### Select names
j=${#list[@]}

for (( k=0; k<j; k++ ))
do
	i=$(($RANDOM % (j-k)))
	
	echo "Current list: ${list[@]}"
	echo "Selected index: $i"
	echo "Selected name: ${list[$i]}"
	unset list[$i]
	list=( "${list[@]}" )
done
