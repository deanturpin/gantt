#!/bin/bash

declare -A tasks

tasks["1_this"]=4
tasks["2_that"]=7
tasks["3_something"]=10
tasks["4_else"]=10
tasks["5_foo"]=10
tasks["6_baa"]=10

# Clear the screen
clear

# Start week
start="1 feb 2017"

# Print tasks
y=1
indent=0
for key in ${!tasks[*]}; do

	# Create bar
	bar=''
	length=${tasks["$key"]}
	(( indent += $length ))

	for (( i=0; i < $length; ++i)); do bar+='-'; done

	echo -en "$bar $key"
	tput cup $y $indent

	(( ++y ))
done

# Calcuate number of weeks
tput cup $y 0
readonly weeks=$(( indent / 5 ))

# Print summary
echo Total weeks $weeks
echo $(date --date="$start")
echo $(date --date="$start" -d "$weeks weeks")
