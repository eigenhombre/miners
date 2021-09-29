.PHONY: clean install readme

miners: src/*.lisp
	./build.sh

readme:
	echo '```'            > README.md
	echo '> make clean'   >> README.md
	make clean
	echo '> make miners'  >> README.md
	make miners           >> README.md
	echo '> make install' >> README.md
	echo '> miners'       >> README.md
	miners                >> README.md
	echo '```'            >> README.md

clean:
	rm -rf miners

install: miners
	test -n "$(BINDIR)"  # $$BINDIR
	cp miners ${BINDIR}
