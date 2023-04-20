#!/usr/bin/env bash -e

# Add all files to staging
git add .

# Prompt for commit message
read -p "Enter commit message: " commit_msg

# Commit changes
git commit -m "$commit_msg"

# Push changes to remote
git push

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
