#!/bin/bash

# Check if we're in a git repository
if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  echo "Error: Not in a git repository"
  exit 1
fi

# Function to generate a random commit message
generate_commit_message() {
  messages=(
    "Update documentation"
    "Fix typo"
    "Refactor code"
    "Add comments"
    "Clean up"
    "Minor improvements"
    "Update dependencies"
    "Optimize performance"
    "Add error handling"
    "Improve readability"
  )
  echo "${messages[$RANDOM % ${#messages[@]}]}"
}

# Function to create a dummy file change
make_change() {
  local timestamp=$1
  echo "Update: $timestamp" >>dummy_changes.txt
}

# Start date: December 23, 2024
start_date="2025-01-15"
# End date: January 12, 2025
end_date="2025-01-26"

# Convert dates to Unix timestamps
start_ts=$(date -j -f "%Y-%m-%d" "$start_date" "+%s")
end_ts=$(date -j -f "%Y-%m-%d" "$end_date" "+%s")

# Loop through each day
current_ts=$start_ts
while [ $current_ts -le $end_ts ]; do
  # Generate random number of commits (1-5) for this day
  num_commits=$((RANDOM % 5 + 1))

  # Get the date in ISO format
  current_date=$(date -r $current_ts "+%Y-%m-%d")

  echo "Creating $num_commits commits for $current_date"

  # Make the specified number of commits for this day
  for ((i = 1; i <= num_commits; i++)); do
    # Generate random time within the day (0-23 hours, 0-59 minutes)
    hour=$((RANDOM % 24))
    minute=$((RANDOM % 60))

    # Format the complete timestamp
    commit_timestamp="$current_date $hour:$minute:00"

    # Make a change and commit it
    make_change "$commit_timestamp"
    git add dummy_changes.txt

    # Create the commit with the backdated timestamp
    GIT_AUTHOR_DATE="$commit_timestamp" GIT_COMMITTER_DATE="$commit_timestamp" \
      git commit -m "$(generate_commit_message)"

    echo "Created commit $i/$num_commits for $commit_timestamp"
  done

  # Move to next day
  current_ts=$((current_ts + 86400)) # Add 24 hours in seconds
done

echo "Finished creating backdated commits"
