INPUTS = mbulb.tex mbulb.jpg mbulb2.jpg
MAIN = $(firstword $(INPUTS))
DVI = #$(patsubst %.tex,%.dvi,$(MAIN))
PDF = $(patsubst %.tex,%.pdf,$(MAIN))
OUTPUTS = $(DVI) $(PDF)

all: $(OUTPUTS)

$(DVI): %.dvi: %.tex $(INPUTS)
	latex $* && latex $*

$(PDF): %.pdf: %.tex $(INPUTS)
	pdflatex $* && pdflatex $*

clean:
	rm -f *.aux *.log *~ $(OUTPUTS)
