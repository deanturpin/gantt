#!/bin/bash

# Start week
readonly start="1 feb 2017"

# Read tasks from stdin
mapfile tasks

# Initialise total days and task count
days=0
count=0

clear

# Iterate over tasks
for (( i = 0; i < ${#tasks[*]}; ++i )); do 

	task=${tasks[i]}

	# Only print bar if we can extract a duration
	if [[ $task =~ ([^\#]*)\ +([[:digit:]]+) ]]; then

        (( ++count ))

		# Store title and duration
		title=${BASH_REMATCH[1]}
		duration=${BASH_REMATCH[2]}

		# Construct task bar
		bar='|'
		for (( j = 0; j < $days; ++j )); do bar+=" "; done
		for (( j = 0; j < $(( duration-1 )); ++j )); do bar+="-"; done
		bar+='|'

		# Print bar and title
		echo "$bar" $count. $title "($duration days)"

		# Update days by current task length
		(( days += duration ))
	fi
done

# Calcuate number of weeks
readonly weeks=$(( days/5 ))

# Print summary
echo Tasks $count
echo Weeks $weeks
echo Start $(date +"%d %b %Y" --date="$start")
echo Compl $(date +"%d %b %Y" --date="$start" -d "$weeks weeks")
