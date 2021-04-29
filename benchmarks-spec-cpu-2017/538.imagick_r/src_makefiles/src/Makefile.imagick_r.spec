TUNE=base
LABEL=mytest-m64
NUMBER=538
NAME=imagick_r
SOURCES= coders/tga.c filters/analyze.c magick/accelerate.c \
	 magick/animate.c magick/annotate.c magick/artifact.c magick/attribute.c \
	 magick/blob.c magick/cache-view.c magick/cache.c magick/channel.c \
	 magick/cipher.c magick/client.c magick/coder.c magick/color.c \
	 magick/colormap.c magick/colorspace.c magick/compare.c \
	 magick/composite.c magick/compress.c magick/configure.c \
	 magick/constitute.c magick/decorate.c magick/delegate.c magick/display.c \
	 magick/distort.c magick/distribute-cache.c magick/draw.c magick/effect.c \
	 magick/enhance.c magick/exception.c magick/feature.c magick/fourier.c \
	 magick/fx.c magick/gem.c magick/geometry.c magick/hashmap.c \
	 magick/histogram.c magick/identify.c magick/image.c magick/layer.c \
	 magick/list.c magick/locale.c magick/log.c magick/magic.c \
	 magick/magick.c magick/matrix.c magick/memory.c magick/mime.c \
	 magick/module.c magick/monitor.c magick/montage.c magick/morphology.c \
	 magick/option.c magick/paint.c magick/pixel.c magick/policy.c \
	 magick/prepress.c magick/profile.c magick/property.c magick/quantize.c \
	 magick/quantum-export.c magick/quantum-import.c magick/quantum.c \
	 magick/random.c magick/registry.c magick/resample.c magick/resize.c \
	 magick/resource.c magick/segment.c magick/semaphore.c magick/shear.c \
	 magick/signature.c magick/splay-tree.c magick/static.c \
	 magick/statistic.c magick/stream.c magick/string.c magick/threshold.c \
	 magick/timer.c magick/token.c magick/transform.c magick/type.c \
	 magick/utility.c magick/version.c magick/xml-tree.c utilities/convert.c \
	 wand/convert.c wand/drawing-wand.c wand/magick-image.c \
	 wand/magick-wand.c wand/mogrify.c wand/pixel-wand.c \
	 wand/magick-property.c wand/pixel-iterator.c wand/wand.c \
	 magick/deprecate.c
EXEBASE=imagick_r
NEED_MATH=yes
BENCHLANG=C

BENCH_FLAGS      = -I. -DSPEC_AUTO_SUPPRESS_OPENMP
CC               = $(INSTRU_TOOL) -std=c99   -m64
CC_VERSION_OPTION = -v
CXX              = $(INSTRU_TOOL) -std=c++03 -m64
CXX_VERSION_OPTION = -v
EXTRA_PORTABILITY = -DSPEC_LP64
FC               = $(SPECLANG)gfortran           -m64
FC_VERSION_OPTION = -v
OPTIMIZE         = -march=native -fno-unsafe-math-optimizations
OS               = unix
SPECLANG         = /usr/bin/
absolutely_no_locking = 0
abstol           = 
action           = validate
allow_label_override = 0
backup_config    = 1
baseexe          = imagick_r
basepeak         = 0
benchdir         = benchspec
benchmark        = 538.imagick_r
binary           = 
bindir           = exe
builddir         = build
bundleaction     = 
bundlename       = 
calctol          = 1
changedhash      = 0
check_version    = 0
clean_between_builds = no
command_add_redirect = 1
commanderrfile   = speccmds.err
commandexe       = imagick_r_base.mytest-m64
commandfile      = speccmds.cmd
commandoutfile   = speccmds.out
commandstdoutfile = speccmds.stdout
comparedir       = compare
compareerrfile   = compare.err
comparefile      = compare.cmd
compareoutfile   = compare.out
comparestdoutfile = compare.stdout
compile_error    = 0
compwhite        = 
configdir        = config
configfile       = mytest
configpath       = /usr/cpu2017/config/mytest.cfg
copies           = 1
current_range    = 
datadir          = data
default_size     = ref
default_submit   = $command
delay            = 0
deletebinaries   = 0
deletework       = 0
dependent_workloads = 0
device           = 
difflines        = 10
dirprot          = 511
discard_power_samples = 0
enable_monitor   = 1
endian           = 12345678
env_vars         = 0
expand_notes     = 0
expid            = 
exthash_bits     = 256
failflags        = 0
fake             = 1
feedback         = 1
flag_url_base    = https://www.spec.org/auto/cpu2017/Docs/benchmarks/flags/
floatcompare     = 
force_monitor    = 0
from_runcpu      = 2
fw_bios          = 
hostname         = chen
http_proxy       = 
http_timeout     = 30
hw_avail         = 
hw_cpu_max_mhz   = 
hw_cpu_name      = Intel Core i5-6200U
hw_cpu_nominal_mhz = 
hw_disk          = 33 GB  add more disk info here
hw_memory001     = 3.729 GB fixme: If using DDR4, the format is:
hw_memory002     = 'N GB (N x N GB nRxn PC4-nnnnX-X)'
hw_model         = 
hw_nchips        = 1
hw_ncores        = 
hw_ncpuorder     = 
hw_nthreadspercore = 
hw_ocache        = 
hw_other         = 
hw_pcache        = 
hw_scache        = 
hw_tcache        = 
hw_vendor        = My Corporation
idle_current_range = 
idledelay        = 10
idleduration     = 60
ignore_errors    = 1
ignore_sigint    = 0
ignorecase       = 
info_wrap_columns = 50
inputdir         = input
inputgenerrfile  = inputgen.err
inputgenfile     = inputgen.cmd
inputgenoutfile  = inputgen.out
inputgenstdoutfile = inputgen.stdout
iteration        = -1
iterations       = 1
keeptmp          = 0
label            = mytest-m64
license_num      = nnn (Your SPEC license number)
line_width       = 1020
link_input_files = 1
locking          = 1
log              = CPU2017
log_line_width   = 1020
log_timestamp    = 0
logfile          = /usr/cpu2017/tmp/CPU2017.029/templogs/preenv.fprate.029.1
logname          = /usr/cpu2017/tmp/CPU2017.029/templogs/preenv.fprate.029.1
lognum           = 029.1
mail_reports     = all
mailcompress     = 0
mailmethod       = smtp
mailport         = 25
mailserver       = 127.0.0.1
mailto           = 
make             = specmake
make_no_clobber  = 0
makefile_template = Makefile.YYYtArGeTYYYspec
makeflags        = --jobs=2
max_average_uncertainty = 1
max_hum_limit    = 0
max_report_runs  = 3
max_unknown_uncertainty = 1
mean_anyway      = 1
meter_connect_timeout = 30
meter_errors_default = 5
meter_errors_percentage = 5
min_report_runs  = 2
min_temp_limit   = 20
minimize_builddirs = 0
minimize_rundirs = 0
name             = imagick_r
nansupport       = 
need_math        = yes
no_input_handler = close
no_monitor       = 
noratios         = 0
note_preenv      = 1
notes_plat_sysinfo_000 =  Sysinfo program /usr/cpu2017/bin/sysinfo
notes_plat_sysinfo_005 =  Rev: r5974 of 2018-05-19 9bcde8f2999c33d61f64985e45859ea9
notes_plat_sysinfo_010 =  running on chen Thu Aug  6 08:51:54 2020
notes_plat_sysinfo_015 = 
notes_plat_sysinfo_020 =  SUT (System Under Test) info as seen by some common utilities.
notes_plat_sysinfo_025 =  For more information on this section, see
notes_plat_sysinfo_030 =     https://www.spec.org/cpu2017/Docs/config.html\#sysinfo
notes_plat_sysinfo_035 = 
notes_plat_sysinfo_040 =  From /proc/cpuinfo
notes_plat_sysinfo_045 =     model name : Intel(R) Core(TM) i5-6200U CPU @ 2.30GHz
notes_plat_sysinfo_050 =        1  "physical id"s (chips)
notes_plat_sysinfo_055 =        4 "processors"
notes_plat_sysinfo_060 =     cores, siblings (Caution: counting these is hw and system dependent. The following
notes_plat_sysinfo_065 =     excerpts from /proc/cpuinfo might not be reliable.  Use with caution.)
notes_plat_sysinfo_070 =        cpu cores : 2
notes_plat_sysinfo_075 =        siblings  : 4
notes_plat_sysinfo_080 =        physical 0: cores 0 1
notes_plat_sysinfo_085 = 
notes_plat_sysinfo_090 =  From lscpu:
notes_plat_sysinfo_095 =       Architecture:          x86_64
notes_plat_sysinfo_100 =       CPU op-mode(s):        32-bit, 64-bit
notes_plat_sysinfo_105 =       Byte Order:            Little Endian
notes_plat_sysinfo_110 =       CPU(s):                4
notes_plat_sysinfo_115 =       On-line CPU(s) list:   0-3
notes_plat_sysinfo_120 =       Thread(s) per core:    2
notes_plat_sysinfo_125 =       Core(s) per socket:    2
notes_plat_sysinfo_130 =       Socket(s):             1
notes_plat_sysinfo_135 =       NUMA node(s):          1
notes_plat_sysinfo_140 =       Vendor ID:             GenuineIntel
notes_plat_sysinfo_145 =       CPU family:            6
notes_plat_sysinfo_150 =       Model:                 78
notes_plat_sysinfo_155 =       Model name:            Intel(R) Core(TM) i5-6200U CPU @ 2.30GHz
notes_plat_sysinfo_160 =       Stepping:              3
notes_plat_sysinfo_165 =       CPU MHz:               2794.125
notes_plat_sysinfo_170 =       CPU max MHz:           2800.0000
notes_plat_sysinfo_175 =       CPU min MHz:           400.0000
notes_plat_sysinfo_180 =       BogoMIPS:              4799.80
notes_plat_sysinfo_185 =       Virtualization:        VT-x
notes_plat_sysinfo_190 =       L1d cache:             32K
notes_plat_sysinfo_195 =       L1i cache:             32K
notes_plat_sysinfo_200 =       L2 cache:              256K
notes_plat_sysinfo_205 =       L3 cache:              3072K
notes_plat_sysinfo_210 =       NUMA node0 CPU(s):     0-3
notes_plat_sysinfo_215 =       Flags:                 fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov
notes_plat_sysinfo_220 =       pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx pdpe1gb rdtscp
notes_plat_sysinfo_225 =       lm constant_tsc art arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc
notes_plat_sysinfo_230 =       aperfmperf pni pclmulqdq dtes64 monitor ds_cpl vmx est tm2 ssse3 sdbg fma cx16 xtpr
notes_plat_sysinfo_235 =       pdcm pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer xsave avx f16c rdrand
notes_plat_sysinfo_240 =       lahf_lm abm 3dnowprefetch epb invpcid_single intel_pt ssbd ibrs ibpb stibp kaiser
notes_plat_sysinfo_245 =       tpr_shadow vnmi flexpriority ept vpid fsgsbase tsc_adjust bmi1 avx2 smep bmi2 erms
notes_plat_sysinfo_250 =       invpcid mpx rdseed adx smap clflushopt xsaveopt xsavec xgetbv1 dtherm ida arat pln
notes_plat_sysinfo_255 =       pts hwp hwp_notify hwp_act_window hwp_epp md_clear flush_l1d
notes_plat_sysinfo_260 = 
notes_plat_sysinfo_265 =  /proc/cpuinfo cache data
notes_plat_sysinfo_270 =     cache size : 3072 KB
notes_plat_sysinfo_275 = 
notes_plat_sysinfo_280 =  From numactl --hardware  WARNING: a numactl 'node' might or might not correspond to a
notes_plat_sysinfo_285 =  physical chip.
notes_plat_sysinfo_290 = 
notes_plat_sysinfo_295 =  From /proc/meminfo
notes_plat_sysinfo_300 =     MemTotal:        3909920 kB
notes_plat_sysinfo_305 =     HugePages_Total:       0
notes_plat_sysinfo_310 =     Hugepagesize:       2048 kB
notes_plat_sysinfo_315 = 
notes_plat_sysinfo_320 =  /usr/bin/lsb_release -d
notes_plat_sysinfo_325 =     Ubuntu 16.04.6 LTS
notes_plat_sysinfo_330 = 
notes_plat_sysinfo_335 =  From /etc/*release* /etc/*version*
notes_plat_sysinfo_340 =     debian_version: stretch/sid
notes_plat_sysinfo_345 =     os-release:
notes_plat_sysinfo_350 =        NAME="Ubuntu"
notes_plat_sysinfo_355 =        VERSION="16.04.6 LTS (Xenial Xerus)"
notes_plat_sysinfo_360 =        ID=ubuntu
notes_plat_sysinfo_365 =        ID_LIKE=debian
notes_plat_sysinfo_370 =        PRETTY_NAME="Ubuntu 16.04.6 LTS"
notes_plat_sysinfo_375 =        VERSION_ID="16.04"
notes_plat_sysinfo_380 =        HOME_URL="http://www.ubuntu.com/"
notes_plat_sysinfo_385 =        SUPPORT_URL="http://help.ubuntu.com/"
notes_plat_sysinfo_390 = 
notes_plat_sysinfo_395 =  uname -a:
notes_plat_sysinfo_400 =     Linux chen 4.4.0-186-generic \#216-Ubuntu SMP Wed Jul 1 05:34:05 UTC 2020 x86_64 x86_64
notes_plat_sysinfo_405 =     x86_64 GNU/Linux
notes_plat_sysinfo_410 = 
notes_plat_sysinfo_415 =  Kernel self-reported vulnerability status:
notes_plat_sysinfo_420 = 
notes_plat_sysinfo_425 =  CVE-2017-5754 (Meltdown):          Mitigation: PTI
notes_plat_sysinfo_430 =  CVE-2017-5753 (Spectre variant 1): Mitigation: usercopy/swapgs barriers and __user
notes_plat_sysinfo_435 =  pointer sanitization
notes_plat_sysinfo_440 =  CVE-2017-5715 (Spectre variant 2): Mitigation: Full generic retpoline, IBPB: conditional,
notes_plat_sysinfo_445 =  IBRS_FW, STIBP: conditional, RSB filling
notes_plat_sysinfo_450 = 
notes_plat_sysinfo_455 =  run-level 5 Aug 6 08:10
notes_plat_sysinfo_460 = 
notes_plat_sysinfo_465 =  SPEC is set to: /usr/cpu2017
notes_plat_sysinfo_470 =     Filesystem     Type  Size  Used Avail Use% Mounted on
notes_plat_sysinfo_475 =     /dev/sda6      ext4   33G  9.7G   22G  32% /
notes_plat_sysinfo_480 = 
notes_plat_sysinfo_485 =  Additional information from dmidecode follows.  WARNING: Use caution when you interpret
notes_plat_sysinfo_490 =  this section. The 'dmidecode' program reads system data which is "intended to allow
notes_plat_sysinfo_495 =  hardware to be accurately determined", but the intent may not be met, as there are
notes_plat_sysinfo_500 =  frequent changes to hardware, firmware, and the "DMTF SMBIOS" standard.
notes_plat_sysinfo_505 = 
notes_plat_sysinfo_510 =  (End of data from sysinfo program)
notes_wrap_columns = 0
notes_wrap_indent =   
num              = 538
obiwan           = 
os_exe_ext       = 
output_format    = txt,html,cfg,pdf,csv
output_root      = 
outputdir        = output
parallel_test    = 0
parallel_test_submit = 0
parallel_test_workloads = 
path             = /usr/cpu2017/benchspec/CPU/538.imagick_r
plain_train      = 1
platform         = 
power            = 0
preENV_LD_LIBRARY_PATH = %{gcc_dir}/lib64/:%{gcc_dir}/lib/:/lib64
preenv           = 0
prefix           = 
prepared_by      = chen  (is never output, only tags rawfile)
ranks            = 1
rawhash_bits     = 256
rebuild          = 1
reftime          = reftime
reltol           = 0.01
reportable       = 0
resultdir        = result
review           = 0
run              = all
runcpu           = /usr/cpu2017/bin/harness/runcpu --action run --configfile mytest --size test --fake --noreportable --nopower --runmode rate --tune base --size test 538.imagick_r --nopreenv --note-preenv --logfile /usr/cpu2017/tmp/CPU2017.029/templogs/preenv.fprate.029.1 --lognum 029.1 --from_runcpu 2
rundir           = run
runmode          = rate
safe_eval        = 1
save_build_files = 
section_specifier_fatal = 1
setprocgroup     = 1
setup_error      = 0
sigint           = 2
size             = test
size_class       = test
skipabstol       = 
skipobiwan       = 
skipreltol       = 
skiptol          = 
smarttune        = base
specdiff         = specdiff
specrun          = specinvoke
srcalt           = 
srcdir           = src
srcsource        = /usr/cpu2017/benchspec/CPU/538.imagick_r/src
stagger          = 10
strict_rundir_verify = 1
sw_avail         = 
sw_base_ptrsize  = 64-bit
sw_compiler001   = C/C++/Fortran: Version 5.4.0 of GCC, the
sw_compiler002   = GNU Compiler Collection
sw_file          = ext4
sw_os001         = Ubuntu 16.04.6 LTS
sw_os002         = 4.4.0-186-generic
sw_other         = 
sw_peak_ptrsize  = 64-bit
sw_state         = Run level 5 (add definition here)
sysinfo_hash_bits = 256
sysinfo_program  = specperl /usr/cpu2017/bin/sysinfo
sysinfo_program_hash = sysinfo:SHA:32259ebd59f3e93740723202f27c44c82ee68e0f2e40cd2ca50cfd5519772397
table            = 1
teeout           = 1
test_date        = Aug-2020
test_sponsor     = My Corporation
tester           = My Corporation
threads          = 1
top              = /usr/cpu2017
train_single_thread = 0
train_with       = train
tune             = base
uid              = 1000
unbuffer         = 1
uncertainty_exception = 5
update           = 0
update_url       = http://www.spec.org/auto/cpu2017/updates/
use_submit_for_compare = 0
use_submit_for_speed = 0
username         = chen
verbose          = 5
verify_binaries  = 1
version          = 0.904000
version_url      = http://www.spec.org/auto/cpu2017/current_version
voltage_range    = 
worklist         = list
OUTPUT_RMFILES   = train_validate.out
