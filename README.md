# Git Tagging Script
This script automates the process of adding files to staging, committing changes, pushing changes to remote, and creating a new tag.
The script will prompt you for a commit message and tag name, and will create a new tag with the given name and message.

## Prerequisites
. Git must be installed on your system and you must be in a Git repository 
<br>
. Bash shell must be installed on your system

Permission: 
```sh
sudo chmod +x commit.sh
```
Usage: 
```sh
./commit.sh
```
## Notes
. This script assumes that you are using the default branch (master) to push changes and create tags. If you are using a different branch, you will need to modify the script accordingly.
<br>
. The script will show you the last tag created before prompting you for a new tag name and message.
## License
This script is licensed under the MIT License.
