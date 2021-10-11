(in-package #:miners)

(defun main ()
  (init-random-number-generator)
  (format t "Miners______________________________________________________________~%")
  (loop repeat 10
        do (format t "~A~%" (miner-repr nil (new-miner #'nominal:full-name-as-str))))
  (format t "Planetoids___________________________________________________________~%")
  (loop repeat 10
        do (format t "~A~%" (planetoid-repr nil (new-planetoid
                                                 #'miners:rand-point
                                                 #'miners:astroname))))
  (format t "Thanks for using miners!~%"))
