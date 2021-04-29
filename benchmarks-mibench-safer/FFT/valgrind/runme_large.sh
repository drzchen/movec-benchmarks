#!/bin/sh
/usr/bin/time $INSTRU_TOOL ./fft 8 32768 > output_large.out 2> output_large.err
/usr/bin/time $INSTRU_TOOL ./fft 8 32768 -i > output_large.inv.out 2> output_large.inv.err

../../grep_time_mem.sh output_large.err output_large.inv.err
