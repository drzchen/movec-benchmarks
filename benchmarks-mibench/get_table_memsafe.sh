#!/bin/bash
# You may use command arguments: small, O1, O2, O3, clean.

## Set the RUN type: small or large
RUN="large"
if [[ $* =~ "small" ]]; then RUN="small"; fi
## Set the file prefix
PREF=MiBench-${RUN}
## Set the run times
export BENCHMARK_RUN_TIMES=10

## Set the benchmarks to run
DIRS="CRC32  FFT  adpcm  basicmath  bitcount  blowfish  dijkstra
      gsm  ispell  jpeg  lame  patricia  qsort  rijndael  rsynth
      sha  stringsearch  susan  tiff  typeset"
## Softboundcets fails on these dirs under -O*
SKIP_DIRS_SOCETS_O3="ghostscript jpeg lame tiff typeset"
SKIP_DIRS_SOCETS_On=""
## Movec-memsafe fails on these dirs under -O*
SKIP_DIRS_MOVEC_On="ghostscript"

## Set the optimization level, e.g., OPTLVL=-O1, OPTLVL=-O2 or OPTLVL=-O3
## The default is empty, i.e., using -O0.
if [[ $* =~ "O1" ]]; then OPTLVL="-O1"; fi
if [[ $* =~ "O2" ]]; then OPTLVL="-O2"; fi
if [[ $* =~ "O3" ]]; then OPTLVL="-O3"; fi
if [ -n ${OPTLVL} ]; then
    ASAN_OPTS="ASAN_OPTS=${OPTLVL}"
    SOCETS_OPTS="SOCETS_OPTS=${OPTLVL}"
    VALGRIND_OPTLVL="O=${OPTLVL}"
    MOVEC_OPTLVL="O=${OPTLVL}"
fi

## Set the table file
TABLE_FILE=$(pwd)/table_${PREF}.memsafe${OPTLVL}.csv
rm -f ${TABLE_FILE}
export BENCHMARK_TABLE_FILE=${TABLE_FILE}
## Clean the output files
rm -f ${PREF}.original-O3
rm -f ${PREF}.asan${OPTLVL}
rm -f ${PREF}.socets${OPTLVL}
rm -f ${PREF}.valgrind${OPTLVL}
rm -f ${PREF}.movec-memsafe${OPTLVL}
if [[ $* =~ "clean" ]]; then exit; fi

## Write table header
echo "Programs,Original -O3,,ASan ${OPTLVL},,,,,SoCets ${OPTLVL},,,,,Valgrind ${OPTLVL},,,,,Movec ${OPTLVL},,,,," >> ${TABLE_FILE};
echo ",time,mem,time,mem,error,T.R.,M.R.,time,mem,error,T.R.,M.R.,time,mem,error,T.R.,M.R.,time,mem,error,T.R.,M.R.," >> ${TABLE_FILE};

## Run the original and the tools on each benchmark
line=2
for dir in ${DIRS}; do
    line=`expr $line + 1`;
    echo -n "${dir} ${RUN}," >> ${TABLE_FILE};

    ## Run original -O3
    make ${dir}/clean ;
    make ${dir}/build ;
    make ${dir}/${RUN} >> ${PREF}.original-O3 2>&1 ;
    make ${dir}/clean ;

    ## Run AddressSanitizer
    make ${dir}/clean-addresssanitizer ;
    make ${dir}/output-addresssanitizer ${ASAN_OPTS} ;
    make ${dir}/${RUN}-addresssanitizer >> ${PREF}.asan${OPTLVL} 2>&1 ;
    make ${dir}/clean-addresssanitizer ;
    echo -n "\"=ROUND(D${line}/B${line},2)\",\"=ROUND(E${line}/C${line},2)\"," >> ${TABLE_FILE};

    ## Run Softbound-CETS
  if [[ ! ${SKIP_DIRS_SOCETS_On} =~ ${dir} &&
        !(${SKIP_DIRS_SOCETS_O3} =~ ${dir} && ${OPTLVL} == "-O3") ]]; then
    make ${dir}/clean-softboundcets ;
    make ${dir}/output-softboundcets ${SOCETS_OPTS} ;
    make ${dir}/${RUN}-softboundcets >> ${PREF}.socets${OPTLVL} 2>&1 ;
    make ${dir}/clean-softboundcets ;
    echo -n "\"=ROUND(I${line}/B${line},2)\",\"=ROUND(J${line}/C${line},2)\"," >> ${TABLE_FILE};
  else
    echo -n ",,,,," >> ${TABLE_FILE};
  fi

    ## Run Valgrind
    make ${dir}/clean-valgrind ;
    make ${dir}/output-valgrind ${VALGRIND_OPTLVL} ;
    make ${dir}/${RUN}-valgrind >> ${PREF}.valgrind${OPTLVL} 2>&1 ;
    make ${dir}/clean-valgrind ;
    echo -n "\"=ROUND(N${line}/B${line},2)\",\"=ROUND(O${line}/C${line},2)\"," >> ${TABLE_FILE};

    ## Run Movec-memsafe
  if [[ ! ${SKIP_DIRS_MOVEC_On} =~ ${dir} ]]; then
    make ${dir}/clean-movec-memsafe ;
    make ${dir}/output-movec-memsafe ${MOVEC_OPTLVL} ;
    make ${dir}/${RUN}-movec-memsafe >> ${PREF}.movec-memsafe${OPTLVL} 2>&1 ;
    make ${dir}/clean-movec-memsafe ;
    echo -n "\"=ROUND(S${line}/B${line},2)\",\"=ROUND(T${line}/C${line},2)\"," >> ${TABLE_FILE};
  else
    echo -n ",,,,," >> ${TABLE_FILE};
  fi

    echo "" >> ${TABLE_FILE};
done

## Write table
echo "" >> ${TABLE_FILE};
echo "AVERAGE,,,,,,\"=ROUND(AVERAGE(G3:G${line}),2)\",\"=ROUND(AVERAGE(H3:H${line}),2)\",,,,\"=ROUND(AVERAGE(L3:L${line}),2)\",\"=ROUND(AVERAGE(M3:M${line}),2)\",,,,\"=ROUND(AVERAGE(Q3:Q${line}),2)\",\"=ROUND(AVERAGE(R3:R${line}),2)\",,,,\"=ROUND(AVERAGE(V3:V${line}),2)\",\"=ROUND(AVERAGE(W3:W${line}),2)\"," >> ${TABLE_FILE};
line=`expr $line + 2`;
echo "over Movec${OPTLVL},,,,,,\"=ROUND(G${line}/V${line},2)\",\"=ROUND(H${line}/W${line},2)\",,,,\"=ROUND(L${line}/V${line},2)\",\"=ROUND(M${line}/W${line},2)\",,,,\"=ROUND(Q${line}/V${line},2)\",\"=ROUND(R${line}/W${line},2)\",,,,,,,,," >> ${TABLE_FILE};
