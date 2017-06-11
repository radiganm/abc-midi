#!/usr/bin/make -f
## makefile (for abc-midi)
## Mac Radigan

.PHONY: convert packages-apt clobber clean

.DEFAULT_GOAL := convert

MIDI_FILES =        \
  example-001.midi  \
  example-002.midi  \
  example-003.midi  \
  example-004.midi  \
  example-005.midi  \
  example-006.midi  \
  example-007.midi  \
  example-008.midi  \
  example-009.midi  \
  example-010.midi  \
  example-011.midi  \
  example-012.midi  \
  example-013.midi  \
  example-014.midi  \
  example-015.midi   

PDF_FILES =        \
  example-001.pdf  \
  example-002.pdf  \
  example-003.pdf  \
  example-004.pdf  \
  example-005.pdf  \
  example-006.pdf  \
  example-007.pdf  \
  example-008.pdf  \
  example-009.pdf  \
  example-010.pdf  \
  example-011.pdf  \
  example-012.pdf  \
  example-013.pdf  \
  example-014.pdf  \
  example-015.pdf   

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

clobber: clean
	-rm -f *.pdf
	-rm -f *.mid
	-rm -f *.midi

clean:
	-rm -f *.ly

## *EOF*
