FROM ubuntu

RUN apt-get -qq -y update
RUN apt-get -qq -y upgrade

RUN apt-get install -qq -y sbcl make curl git

# Pull down Quicklisp and install it
RUN curl -s -o quicklisp.lisp http://beta.quicklisp.org/quicklisp.lisp
RUN sbcl --no-sysinit --no-userinit --load quicklisp.lisp \
         --eval '(quicklisp-quickstart:install :path "/home/janice/quicklisp")' \
         --quit

# Set up .sbcl to load it:
RUN echo | sbcl --load /home/janice/quicklisp/setup.lisp --eval '(ql:add-to-init-file)' --quit

# Smoke test of Quicklisp:
RUN sbcl --non-interactive \
         --disable-debugger \
         --eval '(ql:quickload :cl-aa)'

WORKDIR /home/janice/quicklisp/local-projects
ENV LISP_HOME=/home/janice/quicklisp/local-projects

RUN git clone https://github.com/eigenhombre/nominal.git
RUN git clone https://github.com/eigenhombre/trivialtests.git
RUN git clone https://github.com/eigenhombre/cl-oju.git

# Smoke test one of the libraries:
RUN sbcl --non-interactive \
         --disable-debugger \
         --eval '(ql:quickload :nominal)'

# Set up Oatmeal:
WORKDIR /home/janice/miners

# Run the unit tests:
COPY . /home/janice/miners
RUN make test

