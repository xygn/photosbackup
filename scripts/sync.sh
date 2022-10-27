OUTPUT="/data/data/com.termux/files/home/photosbackup/out"
BUCKET="/data/data/com.termux/files/home/storage/shared/pictures/bucket"

spinner() {
local i sp n
sp='▉▊▋▌▍▎▏▎▍▌▋▊▉'
n=${#sp}
printf ' '
while sleep 0.1; do
printf "%s\b" "${sp:i++%n:1}"
    done
}

spinner &
	rclone copy onedrive:"/Pictures/Camera Roll/" --files-from $OUTPUT/ODOnlyPath.txt $BUCKET/
kill "$!" # kill the spinner
printf '\n'
