#!/bin/bash

# Start week
start="1 feb 2017"

# Tasks followed by "=" and a duration in days
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
indent=0

for (( i = 0; i < $count; ++i )); do 

	task=${tasks[i]}

	# Only print bar if we can extract a duration
	if [[ $task =~ =\ *(.*) ]]; then

		# Store duration
		duration=${BASH_REMATCH[1]}

		# Construct task bar
		bar=''
		for (( j = 0; j < $indent; ++j )); do bar+=" "; done
		for (( j = 0; j < $duration; ++j )); do bar+="-"; done

		# Print the bar and title
		echo -e "$(( i + 1 ))\t$bar  ${task%=*}"

		# Update indent by current task length
		(( indent += duration ))
	fi

done

# Calcuate number of weeks
readonly weeks=$(( indent / 5 ))

# Print summary
echo -e "\nTasks $count"
echo "Weeks $weeks"
echo $(date --date="$start")
echo $(date --date="$start" -d "$weeks weeks")
