/usr/bin/time $INSTRU_TOOL ./xz_r ../data/all/input/cpu2006docs.tar.xz 4 055ce243071129412e9dd0b3b69a21654033a9b723d874b2015c774fac1553d9713be561ca86f74e4f16f22e664fc17a79f30caa5ad2c04fbc447549c2810fae 1548636 1555348 0 > cpu2006docs.tar-4-0.out 2> cpu2006docs.tar-4-0.err
/usr/bin/time $INSTRU_TOOL ./xz_r ../data/all/input/cpu2006docs.tar.xz 4 055ce243071129412e9dd0b3b69a21654033a9b723d874b2015c774fac1553d9713be561ca86f74e4f16f22e664fc17a79f30caa5ad2c04fbc447549c2810fae 1462248 -1 1 > cpu2006docs.tar-4-1.out 2> cpu2006docs.tar-4-1.err
/usr/bin/time $INSTRU_TOOL ./xz_r ../data/all/input/cpu2006docs.tar.xz 4 055ce243071129412e9dd0b3b69a21654033a9b723d874b2015c774fac1553d9713be561ca86f74e4f16f22e664fc17a79f30caa5ad2c04fbc447549c2810fae 1428548 -1 2 > cpu2006docs.tar-4-2.out 2> cpu2006docs.tar-4-2.err
/usr/bin/time $INSTRU_TOOL ./xz_r ../data/all/input/cpu2006docs.tar.xz 4 055ce243071129412e9dd0b3b69a21654033a9b723d874b2015c774fac1553d9713be561ca86f74e4f16f22e664fc17a79f30caa5ad2c04fbc447549c2810fae 1034828 -1 3e > cpu2006docs.tar-4-3e.out 2> cpu2006docs.tar-4-3e.err
/usr/bin/time $INSTRU_TOOL ./xz_r ../data/all/input/cpu2006docs.tar.xz 4 055ce243071129412e9dd0b3b69a21654033a9b723d874b2015c774fac1553d9713be561ca86f74e4f16f22e664fc17a79f30caa5ad2c04fbc447549c2810fae 1061968 -1 4 > cpu2006docs.tar-4-4.out 2> cpu2006docs.tar-4-4.err
/usr/bin/time $INSTRU_TOOL ./xz_r ../data/all/input/cpu2006docs.tar.xz 4 055ce243071129412e9dd0b3b69a21654033a9b723d874b2015c774fac1553d9713be561ca86f74e4f16f22e664fc17a79f30caa5ad2c04fbc447549c2810fae 1034588 -1 4e > cpu2006docs.tar-4-4e.out 2> cpu2006docs.tar-4-4e.err
/usr/bin/time $INSTRU_TOOL ./xz_r ../data/all/input/cpu2006docs.tar.xz 1 055ce243071129412e9dd0b3b69a21654033a9b723d874b2015c774fac1553d9713be561ca86f74e4f16f22e664fc17a79f30caa5ad2c04fbc447549c2810fae 650156 -1 0 > cpu2006docs.tar-1-0.out 2> cpu2006docs.tar-1-0.err
/usr/bin/time $INSTRU_TOOL ./xz_r ../data/all/input/cpu2006docs.tar.xz 1 055ce243071129412e9dd0b3b69a21654033a9b723d874b2015c774fac1553d9713be561ca86f74e4f16f22e664fc17a79f30caa5ad2c04fbc447549c2810fae 639996 -1 1 > cpu2006docs.tar-1-1.out 2> cpu2006docs.tar-1-1.err
/usr/bin/time $INSTRU_TOOL ./xz_r ../data/all/input/cpu2006docs.tar.xz 1 055ce243071129412e9dd0b3b69a21654033a9b723d874b2015c774fac1553d9713be561ca86f74e4f16f22e664fc17a79f30caa5ad2c04fbc447549c2810fae 637616 -1 2 > cpu2006docs.tar-1-2.out 2> cpu2006docs.tar-1-2.err
/usr/bin/time $INSTRU_TOOL ./xz_r ../data/all/input/cpu2006docs.tar.xz 1 055ce243071129412e9dd0b3b69a21654033a9b723d874b2015c774fac1553d9713be561ca86f74e4f16f22e664fc17a79f30caa5ad2c04fbc447549c2810fae 628996 -1 3e > cpu2006docs.tar-1-3e.out 2> cpu2006docs.tar-1-3e.err
/usr/bin/time $INSTRU_TOOL ./xz_r ../data/all/input/cpu2006docs.tar.xz 1 055ce243071129412e9dd0b3b69a21654033a9b723d874b2015c774fac1553d9713be561ca86f74e4f16f22e664fc17a79f30caa5ad2c04fbc447549c2810fae 631912 -1 4 > cpu2006docs.tar-1-4.out 2> cpu2006docs.tar-1-4.err
/usr/bin/time $INSTRU_TOOL ./xz_r ../data/all/input/cpu2006docs.tar.xz 1 055ce243071129412e9dd0b3b69a21654033a9b723d874b2015c774fac1553d9713be561ca86f74e4f16f22e664fc17a79f30caa5ad2c04fbc447549c2810fae 629064 -1 4e > cpu2006docs.tar-1-4e.out 2> cpu2006docs.tar-1-4e.err

../../grep_time_mem.sh cpu2006docs.tar-4-0.err cpu2006docs.tar-4-1.err cpu2006docs.tar-4-2.err cpu2006docs.tar-4-3e.err cpu2006docs.tar-4-4.err cpu2006docs.tar-4-4e.err cpu2006docs.tar-1-0.err cpu2006docs.tar-1-1.err cpu2006docs.tar-1-2.err cpu2006docs.tar-1-3e.err cpu2006docs.tar-1-4.err cpu2006docs.tar-1-4e.err

if [ "$1" = "diff" ]; then
diff ../data/test/output/cpu2006docs.tar-1-0.out cpu2006docs.tar-1-0.out > cpu2006docs.tar-1-0.out.cmp
diff ../data/test/output/cpu2006docs.tar-1-1.out cpu2006docs.tar-1-1.out > cpu2006docs.tar-1-1.out.cmp
diff ../data/test/output/cpu2006docs.tar-1-2.out cpu2006docs.tar-1-2.out > cpu2006docs.tar-1-2.out.cmp
diff ../data/test/output/cpu2006docs.tar-1-3e.out cpu2006docs.tar-1-3e.out > cpu2006docs.tar-1-3e.out.cmp
diff ../data/test/output/cpu2006docs.tar-1-4.out cpu2006docs.tar-1-4.out > cpu2006docs.tar-1-4.out.cmp
diff ../data/test/output/cpu2006docs.tar-1-4e.out cpu2006docs.tar-1-4e.out > cpu2006docs.tar-1-4e.out.cmp
diff ../data/test/output/cpu2006docs.tar-4-0.out cpu2006docs.tar-4-0.out > cpu2006docs.tar-4-0.out.cmp
diff ../data/test/output/cpu2006docs.tar-4-1.out cpu2006docs.tar-4-1.out > cpu2006docs.tar-4-1.out.cmp
diff ../data/test/output/cpu2006docs.tar-4-2.out cpu2006docs.tar-4-2.out > cpu2006docs.tar-4-2.out.cmp
diff ../data/test/output/cpu2006docs.tar-4-3e.out cpu2006docs.tar-4-3e.out > cpu2006docs.tar-4-3e.out.cmp
diff ../data/test/output/cpu2006docs.tar-4-4.out cpu2006docs.tar-4-4.out > cpu2006docs.tar-4-4.out.cmp
diff ../data/test/output/cpu2006docs.tar-4-4e.out cpu2006docs.tar-4-4e.out > cpu2006docs.tar-4-4e.out.cmp
fi
