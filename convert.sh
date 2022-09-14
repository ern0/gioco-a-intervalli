#!/bin/bash

concatenate() {

	awk "{print}" \
		src/intervallo-game.bas \
		src/intervallo-platform-$1.bas \
		> /tmp/intervallo/$1.txt

	petcat \
		-w$2 \
		-o release/intervallo-$1.prg \
		-- \
		/tmp/intervallo/$1.txt

}

main() {

	mkdir -p /tmp/intervallo

	concatenate plus4 3
	concatenate c64 2

}

main