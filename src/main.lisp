(in-package #:miners)

(defvar +all-miners+)
(defvar +all-planetoids+)

(defun nextnext (n)
  (cond
    ((< n 10) (1+ n))
    ((< n 1000) (* 2 n))
    ((> n 3000) (+ n 3000))
    (t (* 100 (floor (/ (* 1.2 n) 100))))))

(defun perd ()
  (let ((counter 0)
        (next 1))
    (lambda ()
      (let ((fire? (equal counter next)))
        (incf counter)
        (when fire?
          (incf next (nextnext next)))
        fire?))))

(defun main ()
  (init-random-number-generator)
  (setq +all-miners+ (loop repeat 10
                           collect (new-miner #'nominal:full-name-as-str)))
  (setq +all-planetoids+ (loop repeat (random 100000)
                               collect (new-planetoid
                                        #'(lambda ()
                                            (miners::rand-annulus-xyz miners::+inner-radius-ls+
                                                                      miners::+outer-radius-ls+))
                                        #'miners:astroname)))

  (format t "~%Miners_______________________________________________________________~%")
  (loop for m in +all-miners+
        do (format t "~A~%" (miner-repr m)))
  (format t "~%Planetoids (subset)__________________________________________________~%")
  (loop for p in +all-planetoids+
        repeat 10
        do (format t "~A~%"
                   (planetoid-repr p)))

  (format t
          "~%~@(~r~) asteroid miners want to visit ~r planetoids.~%~%"
          (length +all-miners+)
          (length +all-planetoids+))

  ;; Main loop
  (loop for i from 0 to 100000000
        with p = (perd)
        do (progn
             (when (funcall p)
               (format t "~:d seconds have elapsed.~%" i))
             (when (< (random 1.0) 1E-6)
               (let ((m (rand-nth +all-miners+)))
                 (if (null (current-trip m))
                     (let* ((p0 (rand-nth +all-planetoids+))
                            (p1 (rand-nth +all-planetoids+))
                            (tr (new-trip p0 p1)))
                       (setf (current-trip m) tr)
                       (format t "~a departs from ~a to ~a, a distance of ~:d light seconds.~%"
                               (name m)
                               (name p0)
                               (name p1)
                               (round (trip-distance tr)))))))))
  (format t "Thanks for using miners!~%"))
