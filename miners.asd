(defsystem "miners"
  :build-operation "program-op"
  :build-pathname "miners"
  :entry-point "miners:main"
  :depends-on (:arrows :beast :syllab :cl-oju)
  :components ((:module "src"
                :components ((:file "package")
                             (:file "main" :depends-on ("package"))))))
