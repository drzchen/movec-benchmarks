#!/bin/sh
/usr/bin/time ./ispell -a -d ../data/americanmed+ < ../data/small.txt > output_small.out 2> output_small.err

../../grep_time_mem.sh output_small.err
