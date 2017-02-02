#!/bin/bash

# Start week
start="1 feb 2017"

# Read tasks from stdin
mapfile tasks

# Initialise total days
days=0

# Iterate over tasks
for (( i = 0; i < ${#tasks[*]}; ++i )); do 

	task=${tasks[i]}

	# Only print bar if we can extract a duration
	# if [[ $task =~ ^(.*)\ +([0-9]+)$ ]]; then
	if [[ $task =~ (.*)\ +([[:digit:]]+) ]]; then

		# Store title and duration
		title=${BASH_REMATCH[1]}
		duration=${BASH_REMATCH[2]}

		# Construct task bar
		bar='|'
		for (( j = 0; j < $days; ++j )); do bar+=" "; done
		for (( j = 0; j < $duration; ++j )); do bar+="#"; done

		# Print bar and title
		echo "$bar $(( i+1 )). $title"

		# Update days by current task length
		(( days += duration ))
	fi
done

# Calcuate number of weeks
readonly weeks=$(( days/5 ))

# Print bottom bar
echo -n '|'
for (( j = 0; j < $(( weeks+3 )); ++j )); do echo -n "_____"; done
echo

# Print summary
echo -e "\nTasks ${#tasks[*]}"
echo Weeks $weeks
echo Start $(date +"%d %b %Y" --date="$start")
echo Compl $(date +"%d %b %Y" --date="$start" -d "$weeks weeks")
