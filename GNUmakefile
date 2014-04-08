MOSYNCDIR ?= /opt/MoSync-4.0-Alpha

prefix = /tmp/mosync-stlport

TARGET_MAKEFILE = Makefile.mapip


.PHONY: all all-release all-debug install-release install-debug clean-release clean-debug

all: all-release all-debug
install: install-release install-debug | all
clean: clean-release clean-debug 

all install clean:
	@for C in $^; do \
			echo $(MAKE) -f $(TARGET_MAKEFILE) \"MOSYNCDIR=$(MOSYNCDIR)\" \"prefix=$(prefix)\" CONFIG=`echo $$C | sed s/.*-//` $@; \
			$(MAKE) -f $(TARGET_MAKEFILE) \
				"CONFIG=`echo $$C | sed s/.*-//`" \
				"MOSYNCDIR=$(MOSYNCDIR)" \
				"prefix=$(prefix)" \
				"DESTDIR=$(DESTDIR)" \
				$@; \
	done
