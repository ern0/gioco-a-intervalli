#!/bin/bash

pandoc \
  -t html \
	--self-contained \
	--css=style.css \
	lessons.md \
	-o lessons.html

wkhtmltopdf \
	lessons.html \
	lessons.pdf