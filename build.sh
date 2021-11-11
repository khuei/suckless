#!/bin/sh

for dir in "dwm" "dmenu" "slock" "st" "slstatus"; do
	echo "Building: $dir"
	make -C "$dir" >/dev/null
	echo "Done"
done
