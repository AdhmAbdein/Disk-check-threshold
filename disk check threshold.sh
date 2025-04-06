#!/bin/bash


threshold=80

df -h | tail -n +2 > file.txt

while IFS= read -r line
do
  usage=$(echo "$line" | awk '{print $5}' | sed 's/%//')
  file_sys=$(echo "$line" | awk '{print $1}')

  if [ "$usage" -gt "$threshold" ]
  then
          echo "atention the disk "$file_sys" exceed the threshold with value "$usage""
  else
          echo "Disk "$file_sys" is OK with usage "$usage""
  fi

done < file.txt
