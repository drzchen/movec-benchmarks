src/ldecod_r -i ../data/test/input/BuckBunny.264 -o BuckBunny.yuv > inputgen_ldecod_r.out 2> inputgen_ldecod_r.err
/usr/bin/time $INSTRU_TOOL src/x264_r --dumpyuv 50 --frames 156 -o BuckBunny_New.264 BuckBunny.yuv 1280x720 > x264_r_frame_156.out 2> x264_r_frame_156.err
src/imagevalidate_525 -avg -threshold 0.5 -maxthreshold 20 frame_50.yuv ../data/test/compare/frame_50.org.tga > imagevalidate_frame_50.out 2> imagevalidate_frame_50.err
src/imagevalidate_525 -avg -threshold 0.5 -maxthreshold 20 frame_100.yuv ../data/test/compare/frame_100.org.tga > imagevalidate_frame_100.out 2> imagevalidate_frame_100.err
src/imagevalidate_525 -avg -threshold 0.5 -maxthreshold 20 frame_155.yuv ../data/test/compare/frame_155.org.tga > imagevalidate_frame_155.out 2> imagevalidate_frame_155.err

../../grep_time_mem.sh x264_r_frame_156.err

if [ "$1" = "diff" ]; then
diff ../data/test/output/imagevalidate_frame_100.out imagevalidate_frame_100.out > imagevalidate_frame_100.out.cmp
diff ../data/test/output/imagevalidate_frame_155.out imagevalidate_frame_155.out > imagevalidate_frame_155.out.cmp
diff ../data/test/output/imagevalidate_frame_50.out imagevalidate_frame_50.out > imagevalidate_frame_50.out.cmp
fi
