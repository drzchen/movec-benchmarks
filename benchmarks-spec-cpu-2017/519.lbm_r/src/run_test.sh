/usr/bin/time ./lbm_r 20 reference.dat 0 1 ../data/test/input/100_100_130_cf_a.of > lbm.out 2> lbm.err

../../grep_time_mem.sh lbm.err

if [ "$1" = "diff" ]; then
diff ../data/test/output/lbm.out lbm.out > lbm.out.cmp
fi
