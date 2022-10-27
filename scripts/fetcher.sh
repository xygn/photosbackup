#!/bin/bash

# This script fetches the list of files from OneDrive and Google Photos

mkdir -p /data/data/com.termux/files/home/photosbackup/out/

OUTPUT="/data/data/com.termux/files/home/photosbackup/out"


# Show a spinner while fetching
spinner() {
local i sp n
sp='▉▊▋▌▍▎▏▎▍▌▋▊▉'
n=${#sp}
printf ' '
while sleep 0.1; do 
printf "%s\b" "${sp:i++%n:1}"
    done
}

# Color Codes
RED='\033[0;31m'
BLUE='\033[0;34m'
GREEN='\033[0;32m'
NC='\033[0m'

printf "Fetching ${BLUE}tree from OneDrive${NC}"
# Fetch Tree From OneDrive
mkdir -p $OUTPUT/OneDrive
spinner &
	rclone lsf -R --files-only --format "p" onedrive:"/Pictures/Camera Roll" > $OUTPUT/OneDrive/MainTree.txt 
		# Fetch List from OneDrive
		sed 's/^.\{1,\}$/"&"/' $OUTPUT/OneDrive/MainTree.txt > $OUTPUT/OneDrive/ODPaths.txt
		cat $OUTPUT/OneDrive/ODPaths.txt | xargs -n1 -I{} basename "{}" > $OUTPUT/OneDrive/_ODPaths.txt
		sed 's/^.\{1,\}$/"&"/'  $OUTPUT/OneDrive/_ODPaths.txt >  $OUTPUT/OneDrive/ODPaths.txt
kill "$!" # kill the spinner
printf '\n'

# BEGIN FETCH FROM GOOGLE PHOTOS API
mkdir -p $OUTPUT/Photos
printf "Fetching ${GREEN}updated${NC} ${RED}tree from Google Photos${NC}"
spinner &
	rclone lsf -R --files-only --format "p" photos:"/media/all/" > $OUTPUT/Photos/GPTree.txt
	sed 's/^.\{1,\}$/"&"/' $OUTPUT/Photos/GPTree.txt > $OUTPUT/Photos/GPList.txt
kill "$!" # kill the spinner
printf '\n'

printf "${GREEN}DONE!${NC}"
exit 0
