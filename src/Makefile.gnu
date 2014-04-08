CC = gcc
CXX = g++

CSOURCES = c_locale.c cxa.c
CXXSOURCES = allocators.cpp bitset.cpp  codecvt.cpp collate.cpp complex.cpp complex_io.cpp complex_trig.cpp ctype.cpp dll_main.cpp facets_byname.cpp fstream.cpp ios.cpp iostream.cpp istream.cpp locale.cpp locale_catalog.cpp locale_impl.cpp messages.cpp monetary.cpp num_get.cpp num_get_float.cpp num_put.cpp num_put_float.cpp numpunct.cpp ostream.cpp sstream.cpp stdio_streambuf.cpp string.cpp strstream.cpp time_facets.cpp
SOURCES = $(CSOURCES) $(CXXSOURCES)

COBJECTS = $(CSOURCES:%.c=%.o)
CXXOBJECTS = $(CXXSOURCES:%.cpp=%.o)

OBJECTS = $(COBJECTS) $(CXXOBJECTS)

CPPFLAGS = -I../stlport
CFLAGS = -g -O2 -pthread -D_GNU_SOURCE
CXXFLAGS = $(CFLAGS) -fexceptions -fvisibility=hidden

LIBPREFIX = lib
LIBEXT = .a
LIBRARY = $(LIBPREFIX)stlport$(LIBEXT)

RANLIB = ranlib
AR = ar

all: $(LIBRARY)


$(LIBRARY): $(OBJECTS)
	$(AR) cru $@ $^
	$(RANLIB) $@

clean:
	$(RM) $(OBJECTS)

.c.o:
	$(CC) $(CPPFLAGS) $(CFLAGS) -c -o $@ $<

.cpp.o:
	$(CXX) $(CPPFLAGS) $(CXXFLAGS) -c -o $@ $<
