# You can use one of the two following ways to init DIRS.
# 1. Search for all sub-directories.
DIRS := $(sort $(shell ls -d */))
# 2. Designate a set of sub-directories.
# DIRS := adpcm/ basicmath/ bitcount/ CRC32/ dijkstra/

BUILDS := $(patsubst %/, %/build, $(DIRS))
SMALLS := $(patsubst %/, %/small, $(DIRS))
LARGES := $(patsubst %/, %/large, $(DIRS))
CLEANS := $(patsubst %/, %/clean, $(DIRS))

.PHONY: build $(BUILDS) small $(SMALLS) large $(LARGES) clean $(CLEANS)

build: $(BUILDS)

$(BUILDS): %/build: %/src
	@$(MAKE) -C $<

small: $(SMALLS)

$(SMALLS): %/small: %/src %/build
	@echo "Running" $(patsubst %/small, %, $@) "on small ..."
	@cd $< && ./runme_small.sh

large: $(LARGES)

$(LARGES): %/large: %/src %/build
	@echo "Running" $(patsubst %/large, %, $@) "on large ..."
	@cd $< && ./runme_large.sh

clean: $(CLEANS)

$(CLEANS): %/clean: %/src
	@$(MAKE) -C $< clean

-include Makefile.inc.movec-memsafe

-include Makefile.inc.addresssanitizer

-include Makefile.inc.softboundcets

-include Makefile.inc.valgrind
