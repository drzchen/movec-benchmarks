#!/bin/sh
/usr/bin/time ./ispell -a -d ../data/americanmed+ < ../data/large.txt > output_large.out 2> output_large.err

../../grep_time_mem.sh output_large.err
