#!/bin/sh
/usr/bin/time tools/tiff2bw ../data/small.tif output_smallbw.tif > output_smallbw.out 2> output_smallbw.err
/usr/bin/time tools/tiff2rgba -c none ../data/small.tif output_smallrgba.tif > output_smallrgba.out 2> output_smallrgba.err
/usr/bin/time tools/tiffdither -c g4 ../data/smallbw.tif output_smalldither.tif > output_smalldither.out 2> output_smalldither.err
/usr/bin/time tools/tiffmedian ../data/small.tif output_smallmedian.tif > output_smallmedian.out 2> output_smallmedian.err

../../grep_time_mem.sh output_smallbw.err output_smallrgba.err output_smalldither.err output_smallmedian.err
