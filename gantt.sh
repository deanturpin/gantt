#!/bin/bash

declare -A tasks

tasks["one"]=4
tasks["two"]=7
tasks["three"]=10

# Clear the screen
clear

y=1
indent=0
for key in ${!tasks[*]}; do

	# Create bar
	bar=''
	length=${tasks[$key]}
	(( indent += $length ))

	for (( i=0; i < $length; ++i)); do bar+='#'; done

	echo -en "$bar $key"
	tput cup $y $indent

	(( ++y ))
done
