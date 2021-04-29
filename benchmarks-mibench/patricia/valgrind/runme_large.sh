#!/bin/sh
/usr/bin/time $INSTRU_TOOL ./patricia ../data/large.udp > output_large.out 2> output_large.err

../../grep_time_mem.sh output_large.err
