#!/bin/bash

add_to_path() {
	local dir="$1"
	if [[ -d "$dir" && ! ":$PATH:" == *":$dir:"* ]]; then
		PATH="${PATH:+${PATH}:}$dir"
	fi
}

# ranger prevent nested instances
r() {
	if [ -z "$RANGER_LEVEL" ]; then
		ranger "$@"
	else
		printf "Cannot invoke nested instance. Return to ranger? [y/N] "
		read -r response
		if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]; then
			exit
		fi
	fi
}

rff() {
	r "$(ff)"
}

nvf() {
	nvim "$(ff)"
}

man() {
	if [ "$#" -ne 1 ]; then
		echo "Usage: $0 <command>"
		return 1
	fi
	if /bin/man "$1" >/dev/null 2>&1; then
		/bin/man "$1"
	elif "$1" --help >/dev/null 2>&1; then
		"$1" --help | nvim +Man!
	else
		echo "No man page or help found"
		return 1
	fi
}

tldr() {
	unbuffer tldr "$@" | bat -p
}

swap() {
	mv "$1" "$1.temp"
	mv "$2" "$1"
	mv "$1.temp" "$2"
}

function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
