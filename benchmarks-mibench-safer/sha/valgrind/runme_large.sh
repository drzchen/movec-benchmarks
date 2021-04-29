#!/bin/sh
/usr/bin/time $INSTRU_TOOL ./sha ../data/input_large.asc > output_large.out 2> output_large.err

../../grep_time_mem.sh output_large.err
