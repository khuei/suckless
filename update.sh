#!/bin/sh

for dir in "dwm" "dmenu" "slock" "st" "slstatus"; do
	if [ ! -d "$dir" ]; then
		git clone "https://github.com/Z5483/$dir" "$dir"
	fi

	echo "change to $dir directory"
	cd $dir || {
		echo "error: fail to change to $dir directory"
		exit 1
	}

	if [ -z "$(git remote | grep 'upstream')" ]; then
		git remote add upstream "https://git.suckless.org/$dir"
		git fetch upstream
	fi

	git rebase upstream/master
done
