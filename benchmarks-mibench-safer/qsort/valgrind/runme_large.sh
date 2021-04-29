#!/bin/sh
/usr/bin/time $INSTRU_TOOL ./qsort_large ../data/input_large.dat > output_large.out 2> output_large.err

../../grep_time_mem.sh output_large.err
