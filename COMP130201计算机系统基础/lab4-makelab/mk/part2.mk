include $(HOME)/mk/config.mk

$(OUTPUT): main.o libB.o libA.o
	$(CXX) -o $@ $^

libA.a: notA.a.o A.a.o some.a.o
	$(AR) -r $@ $^

libB.a: B.b.o
	$(AR) -r $@ $^
