(in-package #:miners)

(defvar +all-miners+)
(defvar +all-planetoids+)

(defun main ()
  (init-random-number-generator)
  (setq +all-miners+ (loop repeat 10
                           collect (new-miner #'nominal:full-name-as-str)))
  (setq +all-planetoids+ (loop repeat 1000
                               collect (new-planetoid
                                        #'(lambda ()
                                            (miners::rand-annulus-xyz miners::+inner-radius-ls+
                                                                      miners::+outer-radius-ls+))
                                        #'miners:astroname)))

  (format t "~%Miners_______________________________________________________________~%")
  (loop for m in +all-miners+
        do (format t "~A~%" (miner-repr m)))
  (format t "~%Planetoids___________________________________________________________~%")
  (loop for p in +all-planetoids+
        repeat 10
        do (format t "~A~%"
                   (planetoid-repr p)))

  (format t "~%Missions_____________________________________________________________~%")
  (loop for m in +all-miners+
        do (progn
             (let* ((p0 (rand-nth +all-planetoids+))
                    (p1 (rand-nth +all-planetoids+))
                    (tr (new-trip p0 p1)))
               (setf (current-trip m) tr)
               (format t "Mission for ~a: ~a~%"
                       (name m)
                       (trip-repr tr)))))

  (format t "Thanks for using miners!~%"))
