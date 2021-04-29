cp -r ../data/test/input/hkrdenq .

/usr/bin/time ./nab_r hkrdenq 1930344093 1000 > hkrdenq.out 2> hkrdenq.err

../../grep_time_mem.sh hkrdenq.err

if [ "$1" = "diff" ]; then
diff ../data/test/output/hkrdenq.out hkrdenq.out > hkrdenq.out.cmp
fi
