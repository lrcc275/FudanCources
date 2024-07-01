include $(HOME)/mk/config.mk

$(OUTPUT): A.a.o some.a.o B.b.o  main.o
	$(CXX) -o $@ $^
