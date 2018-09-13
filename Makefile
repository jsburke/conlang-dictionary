#############################
#                           #
# Sources and Destinations  #
#                           #
#############################

SRC        = main.tex
DICTIONARY = dictionary
DST        = $(DICTIONARY).pdf

#############################
#                           #
# Build controls            #
#                           #
#############################

TEX        = lualatex
TEX_FLAGS  = --jobname=$(DICTIONARY)

VIEW       = evince

#############################
#                           #
# Targets                   #
#                           #
#############################

.PHONY: default
default: pdf 

.PHONY: pdf
pdf: $(DST)

$(DST): 
	make build
	make clean

.PHONY: show
show: $(DST)
	$(VIEW) $(DST) &

.PHONY: build
build: 
	$(TEX) $(TEX_FLAGS) $(SRC)

.PHONY: rebuild
rebuild:
	make full-clean
	make pdf

.PHONY: reshow
reshow: rebuild
	make show

.PHONY: clean
clean:
	rm -rf *.log *.aux *.dvi *.lof *.lot *.out *.toc

.PHONY: full-clean
full-clean: 
	make clean
	rm -rf *.pdf

.PHONY: help
help:
	@echo "Dictionary Builder Assistant"
	@echo " "
	@echo "  A tool to hopefully make dictionary"
	@echo "  a whole lot easier for regular Joes"
	@echo " "
	@echo "  Make targets"
	@echo " "
	@echo "    pdf         -----  Generate a PDF of your dictionary (default)"
	@echo " "
	@echo "    show        -----  Generate a PDF, then open in PDF viewer"
	@echo " "
	@echo "    build       -----  Generate a PDF, leave build files"
	@echo " "
	@echo "    rebuild     -----  Clean any built files, build pdf"
	@echo " "
	@echo "    reshow      -----  rebuild then show pdf"
	@echo " "
	@echo "    clean       -----  delete all build files except PDF"
	@echo " "
	@echo "    full-clean  -----  delete all built files"
	@echo " "
	@echo "    help        -----  show this message"
	@echo " "

