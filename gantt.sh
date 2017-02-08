#!/bin/bash

# Read tasks from stdin
mapfile tasks

# Initialise
days=0
secs=0
count=0

# Iterate over tasks
for (( i = 0; i < ${#tasks[*]}; ++i )); do 

	task=${tasks[i]}

	# Extract task
	if [[ $task =~ ^([^\#]*)\ +([[:digit:]]+) ]]; then

		(( ++count ))

		# Store duration
		duration=${BASH_REMATCH[2]}

		# Store title and pad it
		p=35
		title=${BASH_REMATCH[1]:0:$p}
		padding=$(( p+2 - $(wc -c <<< $title) ))

		# Construct task bar
		bar=''
		for (( j = 0; j < $padding; ++j )); do bar+=" "; done
		bar+='| '
		for (( j = 0; j < $days; ++j )); do bar+=" "; done
		for (( j = 0; j < $duration; ++j )); do bar+="#"; done

		# Print bar and title
		echo -e $count "$title" "$bar"

		# Update days by current task length
		(( days += duration ))

	# Extract start date
	elif [[ $task =~ start\ (.*) ]]; then

		secs=$(date +%s --date="${BASH_REMATCH[1]}")
		# echo $secs
	fi

	# Set date to today if it hasn't been set
	[[ $secs == 0 ]] && secs=$(date +%s)
done

# Calcuate number of weeks
readonly weeks=$(( days/5 ))

# Calculate end taking into account weekends
readonly end=$(( secs + (days * 60 * 60 * 24) * 7 / 5 ))

# Print summary
echo
echo Weeks $weeks
echo Start $(date +"%d %b %Y" --date="@$secs")
echo Compl $(date +"%d %b %Y" --date="@$end")
