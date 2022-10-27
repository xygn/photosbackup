#!/bin/bash
# (C) Sai Vishal 2022
# OneDrive - Google Photos
# Fetch list of files not present in Google Photos

OUTPUT="/data/data/com.termux/files/home/photosbackup/out"
BUCKET="/data/data/com.termux/files/home/storage/shared/pictures/bucket"

ls $BUCKET > $OUTPUT/Local.txt

OD=$OUTPUT/OneDrive/ODPaths.txt
GP=$OUTPUT/Photos/GPList.txt
INT=$OUTPUT/Local.txt

# Generate List of files present onlt in OneDrive
awk 'NR==FNR{arr[$0];next} $0 in arr' $INT $GP > $OUTPUT/FilesUploaded.txt
sed -i 's/\"//g' $OUTPUT/FilesUploaded.txt

awk 'NR==FNR{arr[$0];next} $0 in arr' $INT $OD > $OUTPUT/FilesDownloaded.txt 

#while read line
#do
#   grep "$line" $OUTPUT/OneDrive/MainTree.txt
#done < $OUTPUT/ODOnly.txt > $OUTPUT/ODOnlyPath.txt
