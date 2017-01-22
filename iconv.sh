#!/bin/bash

# expands to the number of positional parameter
if [[ $# -ne 1 ]]; then 
  echo "useage : ./iconv.sh directory_name"
  exit
fi

# exist directory ?
if [ ! -d $1 ]; then
  echo "$1 is not a directory"
fi

find "$1" -name "*.h" -o -name "*.cpp" | while read filename
do
  #echo $filename
  temp="$filename"-tmp
  mv "$filename" "$temp"
  iconv -s -f EUC-KR -t UTF-8 "$temp" > "$filename"
  rm "$temp"
done
