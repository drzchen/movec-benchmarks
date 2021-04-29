COPY_MAKEFILES = $(COPY) ../src_makefiles/src/Makefile.x264_r.spec $(OUTPUT_DIR)/src/Makefile.x264_r.spec
CUSTOM_TARGETS = $(OUTPUT_DIR)/src/x264_r
CLEAN_CMDS = $(RMRF) $(INPUT__DIR)/src/compile_commands.json $(INPUT__DIR)/src/compile_commands.log

ERROR_FILES_test := x264_r_frame_156.err
ERROR_FILES_refrate := x264_r_000-1000_pass1.err x264_r_000-1000_pass2.err x264_r_500-1250.err

include ../../Makefile.default.movec-memsafe

$(OUTPUT_DIR)/src/x264_r: $(INPUT__DIR)/src/compile_commands.json
	mkdir -p $(OUTPUT_DIR) && cp $(INPUT__DIR)/Makefile $(OUTPUT_DIR) && cp $(INPUT__DIR)/run* $(OUTPUT_DIR)
	$(MOVEC) -p $(INPUT__DIR)/src -d $(OUTPUT_DIR)/src $(MOVEC_OPTS) -b $(INPUT__DIR)/src/compile_commands.json
	@echo "***Successfully instrumented the benchmark."
	$(COPY_MAKEFILES)
	$(COPY_MORE_MAKEFILES)
	export INSTRU_TOOL="gcc $(O)"; $(MAKE) -C $(OUTPUT_DIR)

$(INPUT__DIR)/src/compile_commands.json:
	cd $(INPUT__DIR)/src && bear make TARGET=x264_r > compile_commands.log 2>&1 && make clean TARGET=x264_r
