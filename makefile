#!/usr/bin/make -f
## makefile (for abc-midi)
## Mac Radigan

.PHONY: convert packages-apt clobber clean

.DEFAULT_GOAL := convert

ABC_FILES =        \
  example-001.abc  \
  example-002.abc  \
  example-003.abc  \
  example-004.abc  \
  example-005.abc  \
  example-006.abc  \
  example-007.abc  \
  example-008.abc  \
  example-009.abc  \
  example-010.abc  \
  example-011.abc  \
  example-012.abc  \
  example-013.abc  \
  example-014.abc  \
  example-015.abc   

MIDI_FILES = $(ABC_FILES:.abc=.midi)

PDF_FILES = $(ABC_FILES:.abc=.pdf)

convert: $(MIDI_FILES) $(PDF_FILES)

%.midi: %.abc
	abc2midi $<

%.ly: %.abc
	abc2ly $<

%.pdf: %.ly
	lilypond $<

packages-apt:
	sudo apt-get install -y abcmidi
	sudo apt-get install -y lilypond
	sudo apt-get install -y timidity
	sudo apt-get install -y zathura

clobber: clean
	-rm -f *.pdf
	-rm -f *.mid
	-rm -f *.midi

clean:
	-rm -f *.ly

## *EOF*
