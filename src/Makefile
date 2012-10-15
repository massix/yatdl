## YATDL Makefile

DCC=dmd
DFLAGS=-w

LIBS=
SRC=$(wildcard *.d)
OBJ=$(SRC:.d=.o)
OUT=yatl

.PHONY: all debug release profile test clean

all: debug

debug:   DFLAGS+=-g -debug
release: DFLAGS+=-O -release -noboundscheck
profile: DFLAGS+=-g -O -profile
test:    DFLAGS+=-g -O -unittest

debug release profile test: $(OUT)

$(OUT): $(OBJ)
	$(DCC) $(DFLAGS) -of$@ $(OBJ) $(LIBS)

clean:
	rm -f *~ $(OBJ) $(OUT) trace.{def,log}

%.o: %.d
	$(DCC) $(DFLAGS) -c $<
