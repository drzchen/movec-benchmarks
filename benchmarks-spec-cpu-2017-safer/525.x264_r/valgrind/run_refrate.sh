src/ldecod_r -i ../data/refrate/input/BuckBunny.264 -o BuckBunny.yuv > inputgen_ldecod_r.out 2> inputgen_ldecod_r.err
/usr/bin/time $INSTRU_TOOL src/x264_r --pass 1 --stats x264_stats.log --bitrate 1000 --frames 1000 -o BuckBunny_New.264 BuckBunny.yuv 1280x720 > x264_r_000-1000_pass1.out 2> x264_r_000-1000_pass1.err
/usr/bin/time $INSTRU_TOOL src/x264_r --pass 2 --stats x264_stats.log --bitrate 1000 --dumpyuv 200 --frames 1000 -o BuckBunny_New.264 BuckBunny.yuv 1280x720 > x264_r_000-1000_pass2.out 2> x264_r_000-1000_pass2.err
/usr/bin/time $INSTRU_TOOL src/x264_r --seek 500 --dumpyuv 200 --frames 1250 -o BuckBunny_New.264 BuckBunny.yuv 1280x720 > x264_r_500-1250.out 2> x264_r_500-1250.err
src/imagevalidate_525 -avg -threshold 0.5 -maxthreshold 20 frame_200.yuv ../data/refrate/compare/frame_200.org.tga > imagevalidate_frame_200.out 2> imagevalidate_frame_200.err
src/imagevalidate_525 -avg -threshold 0.5 -maxthreshold 20 frame_400.yuv ../data/refrate/compare/frame_400.org.tga > imagevalidate_frame_400.out 2> imagevalidate_frame_400.err
src/imagevalidate_525 -avg -threshold 0.5 -maxthreshold 20 frame_600.yuv ../data/refrate/compare/frame_600.org.tga > imagevalidate_frame_600.out 2> imagevalidate_frame_600.err
src/imagevalidate_525 -avg -threshold 0.5 -maxthreshold 20 frame_700.yuv ../data/refrate/compare/frame_700.org.tga > imagevalidate_frame_700.out 2> imagevalidate_frame_700.err
src/imagevalidate_525 -avg -threshold 0.5 -maxthreshold 20 frame_800.yuv ../data/refrate/compare/frame_800.org.tga > imagevalidate_frame_800.out 2> imagevalidate_frame_800.err
src/imagevalidate_525 -avg -threshold 0.5 -maxthreshold 20 frame_900.yuv ../data/refrate/compare/frame_900.org.tga > imagevalidate_frame_900.out 2> imagevalidate_frame_900.err
src/imagevalidate_525 -avg -threshold 0.5 -maxthreshold 20 frame_999.yuv ../data/refrate/compare/frame_999.org.tga > imagevalidate_frame_999.out 2> imagevalidate_frame_999.err
src/imagevalidate_525 -avg -threshold 0.5 -maxthreshold 20 frame_1100.yuv ../data/refrate/compare/frame_1100.org.tga > imagevalidate_frame_1100.out 2> imagevalidate_frame_1100.err
src/imagevalidate_525 -avg -threshold 0.5 -maxthreshold 20 frame_1249.yuv ../data/refrate/compare/frame_1249.org.tga > imagevalidate_frame_1249.out 2> imagevalidate_frame_1249.err

../../grep_time_mem.sh x264_r_000-1000_pass1.err x264_r_000-1000_pass2.err x264_r_500-1250.err

if [ "$1" = "diff" ]; then
diff ../data/refrate/output/imagevalidate_frame_1100.out imagevalidate_frame_1100.out > imagevalidate_frame_1100.out.cmp
diff ../data/refrate/output/imagevalidate_frame_1249.out imagevalidate_frame_1249.out > imagevalidate_frame_1249.out.cmp
diff ../data/refrate/output/imagevalidate_frame_200.out imagevalidate_frame_200.out > imagevalidate_frame_200.out.cmp
diff ../data/refrate/output/imagevalidate_frame_400.out imagevalidate_frame_400.out > imagevalidate_frame_400.out.cmp
diff ../data/refrate/output/imagevalidate_frame_600.out imagevalidate_frame_600.out > imagevalidate_frame_600.out.cmp
diff ../data/refrate/output/imagevalidate_frame_700.out imagevalidate_frame_700.out > imagevalidate_frame_700.out.cmp
diff ../data/refrate/output/imagevalidate_frame_800.out imagevalidate_frame_800.out > imagevalidate_frame_800.out.cmp
diff ../data/refrate/output/imagevalidate_frame_900.out imagevalidate_frame_900.out > imagevalidate_frame_900.out.cmp
diff ../data/refrate/output/imagevalidate_frame_999.out imagevalidate_frame_999.out > imagevalidate_frame_999.out.cmp
fi
