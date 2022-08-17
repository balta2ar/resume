all:
	./build.sh

watch:
	./watch.sh

deps:
	sudo pacman -S texlive-core texlive-latexextra texlive-langcyrillic texlive-formatsextra texlive-core texlive-bin texlive-bibtexextra
