#!/bin/bash
# (C) Sai Vishal 2022
# OneDrive - Google Photos
# Fetch list of files not present in Google Photos

OUTPUT="/data/data/com.termux/files/home/photosbackup/out"

OD=$OUTPUT/OneDrive/ODPaths.txt
GP=$OUTPUT/Photos/GPList.txt

# Generate List of files present only in Photos
awk 'NR==FNR{a[$0];next} !($0 in a)' $OD $GP > $OUTPUT/GPOnly.txt

# Generate List of files present onlt in OneDrive
awk 'NR==FNR{a[$0];next} !($0 in a)' $GP $OD > $OUTPUT/ODOnly.txt

sed -i 's/\"//g' $OUTPUT/ODOnly.txt

while read line
do
   grep "$line" $OUTPUT/OneDrive/MainTree.txt
done < $OUTPUT/ODOnly.txt > $OUTPUT/ODOnlyPath.txt
