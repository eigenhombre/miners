.PHONY: clean install readme

miners: src/*.lisp
	./build.sh

readme:
	echo '```' > README.md
	(make clean && make miners && make install && miners) >> README.md
	echo '```' >> README.md

clean:
	rm -rf miners

install: miners
	test -n "$(BINDIR)"  # $$BINDIR
	cp miners ${BINDIR}
