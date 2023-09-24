#!/bin/bash

# Function to execute git commands in subdirectories
execute_git_commands() {
    for dir in "$1"/*; do
        # Check if it's a directory
        if [ -d "$dir" ]; then
            # Check if the folder is a git repository
            if [ -d "$dir/.git" ]; then
                echo "Processing repository at $dir"
                
                # Navigate into the directory
                cd "$dir" || exit
                
                # Fetch list of remote branches from origin
                git fetch origin
                for branch in $(git branch -r | grep 'origin/' | sed 's/origin\///'); do
                    # Create local mirrors for each remote branch
                    git branch "$branch" "origin/$branch"
                done
                
                echo "Completed for $dir"
            fi
            
            # Recursive call for subdirectories
            execute_git_commands "$dir"
        fi
    done
}

# Specify the root folder from parameter or use the current directory
ROOT_FOLDER="${1:-$(pwd)}"

# Call the function
execute_git_commands "$ROOT_FOLDER"
