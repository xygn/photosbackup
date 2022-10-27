# PhotosBackup

This is a script for Termux Environment

It serves as a one-way sync between a rclone host and Google Photos

This is useful inorder to move your photos from other cloud providers and clone them into Google Photos as well

Made for Google Pixel / Pixel-based ROMs

## Usage


	bash scripts/fetcher.sh # Fetches your files from your OneDrive and Google Photos
	bash scripts/verity.sh # Generates list of files to be synced after verifying both cloud document trees
	bash sync.sh # Copies files to your bucket folder. Default path is /sdcard/Pictures/bucket

You can turn on sync for the bucket folder from Google Photos app, and periodically even empty it once the files within it are synced.

# Documentation is WIP
 
