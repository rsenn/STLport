
TARGET_MAKEFILE = Makefile.mapip


.PHONY: all all-release all-debug install-release install-debug clean-release clean-debug

all: all-release all-debug
install: all install-release install-debug
clean: clean-release clean-debug

all install clean:
	@for C in $^; do \
			echo "$(MAKE) -f $(TARGET_MAKEFILE) CONFIG=`echo $$C | sed s/^[^-]*-//` $@"; \
			$(MAKE) -f $(TARGET_MAKEFILE) CONFIG=`echo $$C | sed s/^[^-]*-//` $@; \
	done
