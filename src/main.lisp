(in-package #:miners)

(defvar +all-miners+)
(defvar +all-planetoids+)

(defun comma (x)
  (format nil "~a," x))

(defun period (x)
  (format nil "~a." x))

(defun lower-sym (s)
  (if (symbolp s) (format nil "~(~a~)" s) s))

(defun alts (&rest args)
  (nth (random (length args)) args))

(defun trip-phrase (miner origin destination dist)
  (string-join-space
   (mapcar #'lower-sym
           (alts `(,miner departs from ,origin to ,(comma destination) a distance
                          of ,(round dist) light seconds.)
                 `(,miner leaves from ,origin to ,(comma destination) a distance
                          of ,(round dist) light seconds.)
                 `(,miner starts traveling to ,destination from ,(comma origin)
                          beginning a voyage
                          of ,(round dist) light seconds.)
                 `(,miner begins a voyage of ,(round dist)
                          light ,(comma "seconds")
                          from ,origin
                          to ,(period destination))))))

(defun add-trip (planetoids m)
  (let* ((p0 (location m))
         (p1 (rand-nth planetoids))
         (tr (new-trip p0 p1)))
    (setf (current-trip m) tr)
    (format t "~a~%" (trip-phrase (name m)
                                  (name p0)
                                  (name p1)
                                  (trip-distance tr)))))

(defun duration-str (numsec)
  (cond
    ((< numsec 60) (format nil "~d second~:p" numsec))
    ((< numsec 3600) (format nil "~d minute~:p" (round (/ numsec 60))))
    ((< numsec 86400) (format nil "~d hour~:p" (round (/ numsec 3600))))
    (t (format nil "~a day~:p" (round (/ numsec 86400))))))

(defun arrival-phrase (miner destination duration)
  (string-join-space
   (mapcar #'lower-sym
           (alts `(,miner has arrived at ,(comma destination)
                          after ,(duration-str duration))
                 `(,miner arrives at ,(comma destination)
                          after ,(duration-str duration))
                 `("After" ,(comma (duration-str duration))
                           ,miner arrives at ,(comma destination))))))

(defun update-miner-trips (miners)
  (loop for m in miners
        do (let ((tr (current-trip m)))
             (when tr
               (update-trip g-ls 1 tr)
               (when (arrived? tr)
                 (format t "~a~%" (arrival-phrase (name m)
                                                  (name (destination tr))
                                                  (elapsed tr)))
                 (setf (current-trip m) nil)
                 (setf (location m) (destination tr)))))))

(defun command-line-args ()
  (cdr (or #+CLISP *args*
           #+SBCL sb-ext:*posix-argv*
           #+LISPWORKS system:*line-arguments-list*
           #+CMU extensions:*command-line-words*
           nil)))

(defun add-trips (planetoids miners)
  (when (< (random 1000000) 1)
    (let ((m (rand-nth miners)))
      (when (null (current-trip m))
        (add-trip planetoids m)))))

(defun main* (num-miners num-iters)
  (init-random-number-generator)
  (setq +all-planetoids+ (loop repeat (random 100000)
                               collect (new-planetoid
                                        #'(lambda ()
                                            (miners::rand-annulus-xyz miners::+inner-radius-ls+
                                                                      miners::+outer-radius-ls+))
                                        #'miners:astroname)))
  (setq +all-miners+ (loop repeat num-miners
                           collect (new-miner #'nominal:full-name-as-str
                                              (rand-nth +all-planetoids+))))

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
               (format t "~a have elapsed, with ~[no~:;~:*~r~] trip~:p in flight.~%"
                       (duration-str i)
                       (loop for m in +all-miners+
                             when (current-trip m)
                               sum 1)))
             (add-trips +all-planetoids+ +all-miners+)
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
