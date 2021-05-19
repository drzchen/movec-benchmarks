#!/bin/bash

## Set the table file
TABLE_FILE=$(pwd)/table.csv
rm -f ${TABLE_FILE}
export BENCHMARK_TABLE_FILE=${TABLE_FILE}

## Set the benchmarks to run
DIRS="CRC32  FFT  adpcm  basicmath  bitcount  blowfish  dijkstra
      gsm  ispell  jpeg  lame  patricia  qsort  rijndael  rsynth
      sha  stringsearch  susan  tiff  typeset"

## Set the RUN type: small or large
RUN=large

## Set the optimization level, e.g., OPTLVL=-O1, OPTLVL=-O2 or OPTLVL=-O3
## The default is empty, i.e., using -O0.
OPTLVL=
if [ -n ${OPTLVL} ]; then
    ASAN_OPTS="ASAN_OPTS=${OPTLVL}"
    SOCETS_OPTS="SOCETS_OPTS=${OPTLVL}"
    VALGRIND_OPTS="O=${OPTLVL}"
fi

## Set the Movec options, e.g.,
## MOVEC_OPTS="--ms-no-pmd-var --ms-hashtbl"
## MOVEC_OPTS="--ms-no-check"
## The default is empty, i.e., using trie and pmd-var.
MOVEC_OPTS=

## Write table header
echo "Programs,Original -O3,,ASan ${OPTLVL},,,,,SoCets ${OPTLVL},,,,,Valgrind ${OPTLVL},,,,,Movec -O3,,,,,Movec,,,,," >> ${TABLE_FILE};
echo ",time,mem,time,mem,error,T.R.,M.R.,time,mem,error,T.R.,M.R.,time,mem,error,T.R.,M.R.,time,mem,error,T.R.,M.R.,time,mem,error,T.R.,M.R.," >> ${TABLE_FILE};

## Run the original and the tools on each benchmark
line=2
for dir in ${DIRS}; do
    line=`expr $line + 1`;
    echo -n "${dir}," >> ${TABLE_FILE};

    ## Run original -O3
    make ${dir}/clean ;
    make ${dir}/build ;
    make ${dir}/${RUN} ;
    make ${dir}/clean ;

    ## Run AddressSanitizer
    make ${dir}/clean-addresssanitizer ;
    make ${dir}/output-addresssanitizer ${ASAN_OPTS} ;
    make ${dir}/${RUN}-addresssanitizer ;
    make ${dir}/clean-addresssanitizer ;
    echo -n "\"=ROUND(D${line}/B${line},2)\",\"=ROUND(E${line}/C${line},2)\"," >> ${TABLE_FILE};

    ## Run Softbound-CETS
    make ${dir}/clean-softboundcets ;
    make ${dir}/output-softboundcets ${SOCETS_OPTS} ;
    make ${dir}/${RUN}-softboundcets ;
    make ${dir}/clean-softboundcets ;
    echo -n "\"=ROUND(I${line}/B${line},2)\",\"=ROUND(J${line}/C${line},2)\"," >> ${TABLE_FILE};

    ## Run Valgrind
    make ${dir}/clean-valgrind ;
    make ${dir}/output-valgrind ${VALGRIND_OPTS} ;
    make ${dir}/${RUN}-valgrind ;
    make ${dir}/clean-valgrind ;
    echo -n "\"=ROUND(N${line}/B${line},2)\",\"=ROUND(O${line}/C${line},2)\"," >> ${TABLE_FILE};

    ## Run Movec-memsafe -O3
    make ${dir}/clean-movec-memsafe ;
    make ${dir}/output-movec-memsafe MOVEC_OPTS="${MOVEC_OPTS}" O=-O3 ;
    make ${dir}/${RUN}-movec-memsafe ;
    make ${dir}/clean-movec-memsafe ;
    echo -n "\"=ROUND(S${line}/B${line},2)\",\"=ROUND(T${line}/C${line},2)\"," >> ${TABLE_FILE};

    ## Run Movec-memsafe
    make ${dir}/clean-movec-memsafe ;
    make ${dir}/output-movec-memsafe MOVEC_OPTS="${MOVEC_OPTS}" ;
    make ${dir}/${RUN}-movec-memsafe ;
    make ${dir}/clean-movec-memsafe ;
    echo -n "\"=ROUND(X${line}/B${line},2)\",\"=ROUND(Y${line}/C${line},2)\"," >> ${TABLE_FILE};

    echo "" >> ${TABLE_FILE};
done

## Write table
echo "" >> ${TABLE_FILE};
echo "AVERAGE,,,,,,\"=ROUND(AVERAGE(G3:G${line}),2)\",\"=ROUND(AVERAGE(H3:H${line}),2)\",,,,\"=ROUND(AVERAGE(L3:L${line}),2)\",\"=ROUND(AVERAGE(M3:M${line}),2)\",,,,\"=ROUND(AVERAGE(Q3:Q${line}),2)\",\"=ROUND(AVERAGE(R3:R${line}),2)\",,,,\"=ROUND(AVERAGE(V3:V${line}),2)\",\"=ROUND(AVERAGE(W3:W${line}),2)\",,,,\"=ROUND(AVERAGE(AA3:AA${line}),2)\",\"=ROUND(AVERAGE(AB3:AB${line}),2)\"," >> ${TABLE_FILE};
line=`expr $line + 2`;
echo "over Movec,,,,,,\"=ROUND(G${line}/AA${line},2)\",\"=ROUND(H${line}/AB${line},2)\",,,,\"=ROUND(L${line}/AA${line},2)\",\"=ROUND(M${line}/AB${line},2)\",,,,\"=ROUND(Q${line}/AA${line},2)\",\"=ROUND(R${line}/AB${line},2)\",,,,,,,,," >> ${TABLE_FILE};
echo "over Movec -O3,,,,,,\"=ROUND(G${line}/V${line},2)\",\"=ROUND(H${line}/W${line},2)\",,,,\"=ROUND(L${line}/V${line},2)\",\"=ROUND(M${line}/W${line},2)\",,,,\"=ROUND(Q${line}/V${line},2)\",\"=ROUND(R${line}/W${line},2)\",,,,,,,,," >> ${TABLE_FILE};
