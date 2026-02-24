SHELL=bash
IS_TARGET=$(shell if [[ -e /usr/include/bcm2835.h ]]  ; then echo true; else echo false; fi)

all:

	@echo ${IS_TARGET}
ifeq ("${IS_TARGET}","true")
	git pull
	gprbuild
	sudo bin/main
else
	@echo "<HOST>"
	-git commit -a "-mWork"
	-git push
	ssh ad-32bit make -C /home/per/High-Pricision_AD_HAT/Ada/test
endif
