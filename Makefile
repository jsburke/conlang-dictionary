PROJ_NAME = Conlang Dictionary

#############################
#                           #
# Build controls            #
#                           #
#############################

TEX       = lualatex

#############################
#                           #
# Sources and Destinations  #
#                           #
#############################

MAIN      = Main.tex

#############################
#                           #
# Targets                   #
#                           #
#############################

.PHONY: default
default: pdf

pdf: # generate the pdf, clean up intermediate files
	make build
	make clean

build: # generate the pdf, leave intermediate files
	$(TEX) $(MAIN)

clean:
	rm -rf *.log *.aux *.dvi *.lof *.lot *.out *.toc

clean-full: # leave only the sources
	make clean
	rm -rf *.pdf
