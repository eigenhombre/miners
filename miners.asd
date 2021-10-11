(defsystem :miners
  :build-operation "program-op"
  :build-pathname "miners"
  :entry-point "miners:main"
  :in-order-to ((asdf:test-op (asdf:test-op :miners/test)))
  :depends-on (:arrows :beast :nominal :cl-oju)
  :in-order-to ((test-op (test-op "miners/tests")))
  :serial t
  :components ((:module "src"
                :serial t
                :components ((:file "package")
                             (:file "names")
                             (:file "random")
                             (:file "util")
                             (:file "point" :depends-on ("util"
                                                         "random"))
                             (:file "miner" :depends-on ("util"
                                                         "point"
                                                         "random"))
                             (:file "planetoid" :depends-on ("util"
                                                             "point"))
                             (:file "geom")
                             (:file "main" :depends-on ("package"
                                                        "random"
                                                        "names"
                                                        "point"
                                                        "geom"
                                                        "planetoid"
                                                        "miner"
                                                        "util"))))))

(defsystem :miners/test
  :depends-on (:1am :miners)
  :serial t
  :components ((:module "test"
                :serial t
                :components ((:file "package")
                             (:file "util")
                             (:file "tests" :depends-on ("util")))))
  :perform (asdf:test-op
            (op system)
            (uiop:symbol-call :miners/test :run-tests)))
