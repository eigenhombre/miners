.PHONY: clean install readme test all

miners: src/*.lisp miners.asd
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

test:
	sbcl --non-interactive \
	     --disable-debugger \
	     --eval '(pushnew (truename ".") ql:*local-project-directories*)' \
	     --eval '(ql:register-local-projects)' \
	     --eval '(ql:quickload :miners)'       \
	     --eval '(ql:quickload :miners/test)'  \
	     --eval '(asdf:test-system :miners)'

all:
	make clean test miners readme install
