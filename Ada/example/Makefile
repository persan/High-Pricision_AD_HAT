SHELL=bash
IS_TARGET=$(shell if [[ -e /usr/include/bcm2835.h ]]  ; then echo true; else echo false; fi)

all:

	@echo ${IS_TARGET}
ifeq ("${IS_TARGET}","true")
	gprbuild
	sudo bin/main
else
	@echo "<HOST>"
	-git commit -a "-mWork"
	-git push
	ssh ad-32bit git  -C /home/per/High-Pricision_AD_HAT/ pull
	ssh ad-32bit git  -C /home/per/High-Pricision_AD_HAT/ clean -xdf
	ssh ad-32bit make -C /home/per/High-Pricision_AD_HAT/Ada/example
	
endif
