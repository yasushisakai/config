.PHONY:setup clean rerun

setup:
	./configure.sh


clean:
	./clean.sh

rerun: clean setup
