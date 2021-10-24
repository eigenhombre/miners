.PHONY: clean install readme test all

miners: src/*.lisp miners.asd
	./build.sh

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

docker:
	docker build -t miners .

all:
	make clean test miners install
