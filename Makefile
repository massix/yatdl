## Basic Makefile

all: release

debug:
	cd src && $(MAKE) debug

test:
	cd src && $(MAKE) test

release:
	cd src && $(MAKE) release

clean:
	cd src && $(MAKE) clean
