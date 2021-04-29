#!/bin/sh
/usr/bin/time $INSTRU_TOOL tools/tiff2bw ../data/large.tif output_largebw.tif > output_largebw.out 2> output_largebw.err
/usr/bin/time $INSTRU_TOOL tools/tiff2rgba -c none ../data/large.tif output_largergba.tif > output_largergba.out 2> output_largergba.err
/usr/bin/time $INSTRU_TOOL tools/tiffdither -c g4 ../data/largebw.tif output_largedither.tif > output_largedither.out 2> output_largedither.err
/usr/bin/time $INSTRU_TOOL tools/tiffmedian ../data/large.tif output_largemedian.tif > output_largemedian.out 2> output_largemedian.err

../../grep_time_mem.sh output_largebw.err output_largergba.err output_largedither.err output_largemedian.err
