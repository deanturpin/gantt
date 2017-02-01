#!/bin/bash

readonly tasks=(
	"Sequi esse et occaecati perferendis	= 5"
	"Rerum laboriosam itaque cupiditate		= 10"
	"Commodi dolorem quas debitis					= 1"
	"Voluptas at repudiandae qui					= 2"
	"Earum nesciunt												= 4"
	"Possimus non et											= 7"
	"Amet																	= 8"
	"Amet sit															= 9"
	"Reiciendis														= 2"
	"Qui																	= 1"
)

readonly count=${#tasks[*]}
echo number of titles $count

for (( i = 0; i < $count; ++i )); do 

	task=${tasks[i]}

	[[ $task =~ =\ *(.*) ]] && duration=${BASH_REMATCH[1]}

	# Print each title
	echo ${task%=*} $duration

done

# declare -A tasks
# 
# tasks["1_this"]=4
# tasks["2_that"]=7
# tasks["3_something"]=10
# tasks["4_else"]=10
# tasks["5_foo"]=10
# tasks["6_baa"]=10

# # Clear the screen
# clear
# 
# # Start week
# start="1 feb 2017"
# 
# # Print tasks
# y=1
# indent=0
# for key in ${!tasks[*]}; do
# 
# 	# Create bar
# 	bar=''
# 	length=${tasks["$key"]}
# 	(( indent += $length ))
# 
# 	for (( i=0; i < $length; ++i)); do bar+='-'; done
# 
# 	echo -en "$bar $key"
# 	tput cup $y $indent
# 
# 	(( ++y ))
# done
# 
# # Calcuate number of weeks
# tput cup $y 0
# readonly weeks=$(( indent / 5 ))
# 
# # Print summary
# echo Total weeks $weeks
# echo $(date --date="$start")
# echo $(date --date="$start" -d "$weeks weeks")
