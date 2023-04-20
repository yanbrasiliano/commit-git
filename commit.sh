#!/usr/bin/env bash -e

# Add all files to staging
git add .

# Prompt for commit message
read -p "Enter commit message: " commit_msg

# Commit changes
git commit -m "$commit_msg"

# Get current branch
current_branch=$(git rev-parse --abbrev-ref HEAD)

# Push current branch to remote
git push origin $current_branch

# Prompt to create tag
read -p "Do you want to create a tag? (y/n) " create_tag

if [[ $create_tag == "y" || $create_tag == "Y" ]]; then
  # Check if current branch is develop, master, or release/number
  if [[ $current_branch == "develop" || $current_branch == "master" || $current_branch =~ ^release\/[0-9]+$ ]]; then
    # Get last tag
    last_tag=$(git describe --abbrev=0 --tags)

    # Show last tag
    echo
    echo "The last tag created was $last_tag"

    # Prompt for tag name
    read -p "Enter tag: " tag_name

    # Prompt for tag message
    read -p "Enter tag message: " tag_msg

    # Create and push tag
    git tag -a $tag_name -m "$tag_msg"
    git push origin $tag_name

    echo "Commit and tag pushed."
    echo
    echo "New tag is $tag_name"
  else
    echo "Cannot create tag on branch $current_branch. Only allowed on develop, master, or release/number. Exiting..."
  fi
else
  echo "No tag was created. Exiting..."
fi
