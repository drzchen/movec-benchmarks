# You can use one of the two following ways to init DIRS.
# 1. Search for all sub-directories.
DIRS := $(sort $(shell ls -d */))
# 2. Designate a set of sub-directories.
# DIRS := 519.lbm_r/ 525.x264_r/ 538.imagick_r/ 544.nab_r/ 557.xz_r/

BUILDS   := $(patsubst %/, %/build,   $(DIRS))
TESTS    := $(patsubst %/, %/test,    $(DIRS))
REFRATES := $(patsubst %/, %/refrate, $(DIRS))
CLEANS   := $(patsubst %/, %/clean,   $(DIRS))

.PHONE: build $(BUILDS) test $(TESTS) refrate $(REFRATES) clean $(CLEANS)

build: $(BUILDS)

$(BUILDS): %/build: %/src
	@$(MAKE) -C $<

test: $(TESTS)

$(TESTS): %/test: %/src %/build
	@echo "Running" $(patsubst %/test, %, $@) "on test ..."
	@cd $< && ./run_test.sh diff

refrate: $(REFRATES)

$(REFRATES): %/refrate: %/src %/build
	@echo "Running" $(patsubst %/refrate, %, $@) "on refrate ..."
	@cd $< && ./run_refrate.sh diff

clean: $(CLEANS)

$(CLEANS): %/clean: %/src
	@$(MAKE) -C $< clean

-include Makefile.inc.movec-memsafe

-include Makefile.inc.addresssanitizer

-include Makefile.inc.softboundcets

-include Makefile.inc.valgrind
