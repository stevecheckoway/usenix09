#!/bin/sh
n=usenix09
pdflatex $n.dtx && \
	makeindex -s gglo -o $n.gls $n.glo && \
	makeindex -s gind $n && \
	pdflatex $n.dtx \
	pdflatex $n.dtx
