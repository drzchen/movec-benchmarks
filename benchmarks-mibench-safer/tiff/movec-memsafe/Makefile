INPUT__DIR_LIBTIFF = $(INPUT__DIR)/libtiff
OUTPUT_DIR_LIBTIFF = $(OUTPUT_DIR)/libtiff
INPUT__DIR_TOOLS = $(INPUT__DIR)/tools
OUTPUT_DIR_TOOLS = $(OUTPUT_DIR)/tools

COPY_MAKEFILES = chmod 666 $(OUTPUT_DIR)/libtiff/Makefile $(OUTPUT_DIR)/tools/Makefile; $(COPY) ../src_makefiles/libtiff/Makefile $(OUTPUT_DIR)/libtiff/Makefile; $(COPY) ../src_makefiles/tools/Makefile $(OUTPUT_DIR)/tools/Makefile
CUSTOM_TARGETS := copy libtiff tiff2bw tiff2rgba tiffdither tiffmedian
CLEAN_CMDS = \
  $(MAKE) clean -C $(INPUT__DIR_LIBTIFF);\
  $(MAKE) clean -C $(INPUT__DIR_TOOLS);\
  $(RMRF) $(INPUT__DIR_LIBTIFF)/compile_commands.json \
          $(INPUT__DIR_LIBTIFF)/compile_commands.log \
          $(INPUT__DIR_TOOLS)/compile_commands.json \
          $(INPUT__DIR_TOOLS)/compile_commands.log

ERROR_FILES := output_RUNTYPEbw.err output_RUNTYPErgba.err output_RUNTYPEdither.err output_RUNTYPEmedian.err

include ../../Makefile.default.movec-memsafe

.PHONY: $(CUSTOM_TARGETS)

copy: clean
	$(COPY) -rf $(INPUT__DIR) $(OUTPUT_DIR)

libtiff:
	cd $(INPUT__DIR_LIBTIFF) && bear make > compile_commands.log 2>&1

tiff2bw tiff2rgba tiffdither tiffmedian:
	cd $(INPUT__DIR_TOOLS) && bear make $@ > compile_commands.log 2>&1
	$(MOVEC) -p $(INPUT__DIR_LIBTIFF) -d $(OUTPUT_DIR_LIBTIFF) -p $(INPUT__DIR_TOOLS) -d $(OUTPUT_DIR_TOOLS) $(MOVEC_OPTS) -b $(INPUT__DIR_LIBTIFF)/compile_commands.json $(INPUT__DIR_TOOLS)/compile_commands.json -C $(INPUT__DIR_LIBTIFF)/mkg3states.c $(INPUT__DIR_LIBTIFF)/mkversion.c
	$(COPY_MAKEFILES)
	$(COPY_MORE_MAKEFILES)
	export INSTRU_TOOL="gcc $(O)"; $(MAKE) -C $(OUTPUT_DIR_LIBTIFF)
	$(MAKE) -C $(OUTPUT_DIR_TOOLS) $@
