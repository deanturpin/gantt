#!/bin/bash

declare -A tasks

tasks["one"]=4
tasks["two"]=7
tasks["three"]=10
tasks["four"]=10
tasks["five"]=10
tasks["six"]=10

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
	length=${tasks[$key]}
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
