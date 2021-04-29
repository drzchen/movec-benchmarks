CUSTOM_TARGETS = $(OUTPUT_DIR)
USE_COMPDB := YES

ERROR_FILES := output_RUNTYPE.err

include ../../Makefile.default.movec-memsafe

$(OUTPUT_DIR): $(INPUT__DIR)/compile_commands.json
	$(MOVEC) -p $(INPUT__DIR) -d $(OUTPUT_DIR) $(MOVEC_OPTS) -b $(INPUT__DIR)/compile_commands.json
	@echo "***Successfully instrumented the benchmark."
	$(COPY_MAKEFILES)
	$(COPY_MORE_MAKEFILES)
	export INSTRU_TOOL="gcc $(O)"; $(MAKE) -C $(OUTPUT_DIR) ispell

$(INPUT__DIR)/compile_commands.json:
	cd $(INPUT__DIR) && bear make ispell > compile_commands.log 2>&1
