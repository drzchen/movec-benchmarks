#!/bin/sh
/usr/bin/time $INSTRU_TOOL ./lame ../data/large.wav output_large.mp3 > output_large.out 2> output_large.err

../../grep_time_mem.sh output_large.err
