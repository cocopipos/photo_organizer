#!/bin/sh

# Goes through all jpeg files in current directory, grabs date from each
# and sorts them into subdirectories according to the date
# Creates subdirectories corresponding to the dates as necessary.

for fil in $1/*.jpg  # Also try *.JPG
do

  datepath="$(identify -verbose $fil | grep DateTimeOri | awk '{split($2, parts, ":", seps); printf("%s-%s", parts[1], parts[2])}')"
    if ! test -e "$datepath"; then
        mkdir -pv "$datepath"
    fi

    mv -v $fil $datepath
done
