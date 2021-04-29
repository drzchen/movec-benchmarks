cp -r ../data/refrate/input/1am0 .

/usr/bin/time $INSTRU_TOOL ./nab_r 1am0 1122214447 122 > 1am0.out 2> 1am0.err

../../grep_time_mem.sh 1am0.err

if [ "$1" = "diff" ]; then
diff ../data/refrate/output/1am0.out 1am0.out > 1am0.out.cmp
fi
