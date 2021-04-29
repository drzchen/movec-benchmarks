#!/bin/sh
/usr/bin/time $INSTRU_TOOL ./sha ../data/input_small.asc > output_small.out 2> output_small.err

../../grep_time_mem.sh output_small.err
