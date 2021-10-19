(in-package #:miners)

(defvar +all-miners+)
(defvar +all-planetoids+)

(defun add-trip (m)
  (let* ((p0 (rand-nth +all-planetoids+))
         (p1 (rand-nth +all-planetoids+))
         (tr (new-trip p0 p1)))
    (setf (current-trip m) tr)
    ;; FIXME: Vary this language:
    (format t "~a departs from ~a to ~a, a distance of ~:d light seconds.~%"
            (name m)
            (name p0)
            (name p1)
            (round (trip-distance tr)))))

(defun duration-str (numsec)
  (cond
    ((< numsec 60) (format nil "~d second~:p" numsec))
    ((< numsec 3600) (format nil "~d minute~:p" (round (/ numsec 60))))
    ((< numsec 86400) (format nil "~d hour~:p" (round (/ numsec 3600))))
    (t (format nil "~a day~:p" (round (/ numsec 86400))))))

(defun update-miner-trips (miners)
  (loop for m in miners
        do (let ((tr (current-trip m)))
             (when tr
               (update-trip g-ls 1 tr)
               (when (arrived? tr)
                 (format t "~a arrived at ~a after ~a of travel!~%"
                         (name m)
                         (name (destination tr))
                         (duration-str (elapsed tr)))
                 (setf (current-trip m) nil))))))

(defun command-line-args ()
  (cdr (or #+CLISP *args*
           #+SBCL sb-ext:*posix-argv*
           #+LISPWORKS system:*line-arguments-list*
           #+CMU extensions:*command-line-words*
           nil)))

(defun main* (num-miners num-iters)
  (init-random-number-generator)
  (setq +all-miners+ (loop repeat num-miners
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
  (loop for i from 0 to num-iters
        with p = (perd)
        do (progn
             (when (funcall p)
               (format t "~a have elapsed, with ~r trip~:p in flight.~%"
                       (duration-str i)
                       (loop for m in +all-miners+
                             when (current-trip m)
                               sum 1)))
             (when (< (random 1000000) 1)
               (let ((m (rand-nth +all-miners+)))
                 (when (null (current-trip m))
                   (add-trip m))))
             (update-miner-trips +all-miners+)))
  (format t "Thanks for using miners!~%"))

(defun int-arg (n default)
  (parse-integer (or (nth n (command-line-args))
                     (write-to-string default))))

(defun main ()
  (handler-case
      (progn
        (main* (int-arg 0 10)
               (int-arg 1 10000000)))
    (t (e)
      (declare (ignore e))
      (format t "~%The solar system comes to a sudden end.~%"))))
