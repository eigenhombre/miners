.PHONY: clean install

miners: src/*.lisp
	./build.sh

clean:
	rm -rf miners

install: miners
	test -n "$(BINDIR)"  # $$BINDIR
	cp miners ${BINDIR}
