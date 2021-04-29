ERROR_FILES := output_RUNTYPEbw.err output_RUNTYPErgba.err output_RUNTYPEdither.err output_RUNTYPEmedian.err
COPY_MAKEFILES = chmod 666 $(OUTPUT_DIR)/libtiff/Makefile $(OUTPUT_DIR)/tools/Makefile; $(COPY) ../src_makefiles/libtiff/Makefile $(OUTPUT_DIR)/libtiff/Makefile; $(COPY) ../src_makefiles/tools/Makefile $(OUTPUT_DIR)/tools/Makefile

include ../../Makefile.default.addresssanitizer
