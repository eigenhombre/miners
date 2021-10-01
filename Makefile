.PHONY: clean install readme

miners: src/*.lisp
	./build.sh

readme:
	cat README.preamble.org > README.org
	echo '#+BEGIN_SRC'    >> README.org
	echo '> make clean'   >> README.org
	make clean            >> README.org
	echo '> make miners'  >> README.org
	make miners           >> README.org
	echo '> make install' >> README.org
	make install          >> README.org
	echo '> miners'       >> README.org
	miners                >> README.org
	echo '#+END_SRC'      >> README.org

clean:
	rm -rf miners

install: miners
	test -n "$(BINDIR)"  # $$BINDIR
	cp miners ${BINDIR}
