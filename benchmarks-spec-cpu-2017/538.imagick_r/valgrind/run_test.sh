/usr/bin/time $INSTRU_TOOL src/imagick_r -limit disk 0 ../data/test/input/test_input.tga -shear 25 -resize 640x480 -negate -alpha Off test_output.tga > test_convert.out 2> test_convert.err
src/imagevalidate_538 -avg -threshold 0.95 -maxthreshold 0.001 test_output.tga ../data/test/compare/test_expected.tga > test_validate.out 2> test_validate.err

../../grep_time_mem.sh test_convert.err

if [ "$1" = "diff" ]; then
diff ../data/test/output/test_validate.out test_validate.out > test_validate.out.cmp
fi
