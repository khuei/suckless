#!/bin/sh -e

[ "$1" ] || echo 'Usage: ./build.sh [dwm] [dmenu] [st] [slock]' 1>&2

clone() {
	[ -d "$1" ] || git clone "$2/$1"
	cd "$1"
	git remote add upstream "git://git.suckless.org/$1"
	git fetch upstream
	git rebase upstream/master
	cd "$START_PWD"
}

build() {
	START_PWD=$(dirname "$0")
	[ "$START_PWD" = . ] && START_PWD=$PWD
	for name ; do
		cd "$START_PWD"

		sl=https://github.com/Z5483
		case $name in
			st) clone "$name" "$sl" ;;
			dwm) clone "$name" "$sl" ;;
			surf) clone "$name" "$sl" ;;
			dmenu) clone "$name" "$sl" ;;
			tabbed) clone "$name" "$sl" ;;
			sent) clone "$name" "$sl" ;;
			slock) clone "$name" "$sl" ;;
			*) usage
		esac

		cd "$name"

		make -s clean
		make -s
	done
}

build "$@"
