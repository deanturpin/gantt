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

		# Store title and duration
		title=${BASH_REMATCH[1]}
		duration=${BASH_REMATCH[2]}

		# Construct task bar
		bar='|'
		for (( j = 0; j < $days; ++j )); do bar+=" "; done
		for (( j = 0; j < $(( duration-1 )); ++j )); do bar+="-"; done
		bar+='|'

		# Pretty print day count
		[[ $duration == 1 ]] && daytext="day" || daytext="days"

		# Print bar and title
		echo "$bar" $count $title "($duration $daytext)"

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
echo Tasks $count
echo Weeks $weeks
echo Start $(date +"%d %b %Y" --date="@$secs")
echo Compl $(date +"%d %b %Y" --date="@$end")
