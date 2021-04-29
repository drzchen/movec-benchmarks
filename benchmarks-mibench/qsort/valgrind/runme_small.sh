#!/bin/sh
/usr/bin/time $INSTRU_TOOL ./qsort_small ../data/input_small.dat > output_small.out 2> output_small.err

../../grep_time_mem.sh output_small.err
