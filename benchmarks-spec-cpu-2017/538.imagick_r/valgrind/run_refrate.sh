/usr/bin/time $INSTRU_TOOL src/imagick_r -limit disk 0 ../data/refrate/input/refrate_input.tga -edge 41 -resample 181% -emboss 31 -colorspace YUV -mean-shift 19x19+15% -resize 30% refrate_output.tga > refrate_convert.out 2> refrate_convert.err
src/imagevalidate_538 -avg -threshold 0.95 -maxthreshold 0.001 refrate_output.tga ../data/refrate/compare/refrate_expected.tga > refrate_validate.out 2> refrate_validate.err

../../grep_time_mem.sh refrate_convert.err

if [ "$1" = "diff" ]; then
diff ../data/refrate/output/refrate_validate.out refrate_validate.out > refrate_validate.out.cmp
fi
