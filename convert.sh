#!/bin/bash

concatenate() {

	mkdir -p /tmp/intervallo

	awk "{print}" \
		src/intervallo-game-main.bas \
		src/intervallo-game-subs.bas \
		src/intervallo-platform-$1.bas \
		> /tmp/intervallo/$1.txt

	petcat \
		-w$2 \
		-o release/intervallo-$1.prg \
		-- \
		/tmp/intervallo/$1.txt \
		| grep -v "intervallo$"

}

autodoc() {

	echo $1:
	cat src/intervallo-*$1*.bas \
	| grep "00 rem" \
	| sort \
	| uniq \
	| sed "s/^/  /"

}

main() {

	clear

	./renumber.py src/*.bas
	
	concatenate plus4 3
	concatenate c64 2

	autodoc main
	autodoc subs
	autodoc platform
}

main
