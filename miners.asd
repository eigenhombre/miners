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
                             (:file "id")
                             (:file "util")
                             (:file "random")
                             (:file "names" :depends-on ("util"))
                             (:file "ship" :depends-on ("names"))
                             (:file "point" :depends-on ("util"
                                                         "random"))
                             (:file "geom" :depends-on ("point"))
                             (:file "planetoid" :depends-on ("id"
                                                             "util"
                                                             "geom"
                                                             "point"))
                             (:file "trip" :depends-on ("geom"
                                                        "point"
                                                        "planetoid"))
                             (:file "miner" :depends-on ("random"
                                                         "id"
                                                         "util"
                                                         "trip"))
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
