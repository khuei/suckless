#!/bin/sh

for dir in "dwm" "dmenu" "slock" "st" "slstatus"; do
	echo "Installing: $dir"
	make -C "$dir" install >/dev/null
	echo "Done"
done
