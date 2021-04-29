COPY_MAKEFILES = $(COPY) ../src_makefiles/src/Makefile.imagick_r.spec $(OUTPUT_DIR)/src/Makefile.imagick_r.spec
CUSTOM_TARGETS = $(OUTPUT_DIR)/src/imagick_r
CLEAN_CMDS = $(RMRF) $(INPUT__DIR)/src/compile_commands.json $(INPUT__DIR)/src/compile_commands.log

ERROR_FILES := RUNTYPE_convert.err

include ../../Makefile.default.movec-memsafe

$(OUTPUT_DIR)/src/imagick_r: $(INPUT__DIR)/src/compile_commands.json
	mkdir -p $(OUTPUT_DIR) && cp $(INPUT__DIR)/Makefile $(OUTPUT_DIR) && cp $(INPUT__DIR)/run* $(OUTPUT_DIR)
	$(MOVEC) -p $(INPUT__DIR)/src -d $(OUTPUT_DIR)/src $(MOVEC_OPTS) -b $(INPUT__DIR)/src/compile_commands.json
	@echo "***Successfully instrumented the benchmark."
	$(COPY_MAKEFILES)
	$(COPY_MORE_MAKEFILES)
	export INSTRU_TOOL="gcc $(O)"; $(MAKE) -C $(OUTPUT_DIR)

$(INPUT__DIR)/src/compile_commands.json:
	cd $(INPUT__DIR)/src && bear make TARGET=imagick_r > compile_commands.log 2>&1 && make clean TARGET=imagick_r
