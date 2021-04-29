build:
	@$(MAKE) -C src TARGET=ldecod_r
	@$(MAKE) -C src TARGET=x264_r
	@$(MAKE) -C src TARGET=imagevalidate_525

clean:
	@$(MAKE) -C src clean TARGET=ldecod_r
	@$(MAKE) -C src clean TARGET=x264_r
	@$(MAKE) -C src clean TARGET=imagevalidate_525
	rm -rf *.yuv *_New.264 *.out *.err *.out.cmp *.dec *.txt *.log*
