/usr/bin/time $INSTRU_TOOL ./lbm_r 3000 reference.dat 0 0 ../data/refrate/input/100_100_130_ldc.of > lbm.out 2> lbm.err

../../grep_time_mem.sh lbm.err

if [ "$1" = "diff" ]; then
diff ../data/refrate/output/lbm.out lbm.out > lbm.out.cmp
fi
