OUTPUT ?= main
SRC ?= $(HOME)/src
INCLUDE ?= $(HOME)/include
CPPFLAGS += -I$(INCLUDE)

%.c: $(SRC)/%.c
	cp $^ $@

%.a.c: $(SRC)/A/%.c
	cp $^ $@

%.b.c: $(SRC)/B/%.c
	cp $^ $@

%.cpp: $(SRC)/%.cpp
	cp $^ $@

%.a.cpp: $(SRC)/A/%.cpp
	cp $^ $@

%.b.cpp: $(SRC)/B/%.cpp
	cp $^ $@
