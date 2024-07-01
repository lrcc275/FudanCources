include $(HOME)/mk/config.mk

#CPPFLAGS += -fPIC

$(OUTPUT): main.o libB.so libA.so
	$(CXX) -o $@ $(addprefix ./, $^)

libA.so: A.a.o some.a.o
	$(CXX) -shared -fPIC -o $@ $^

libB.so: B.b.o notA.a.o
	$(CXX) -shared -fPIC -o $@ $^
