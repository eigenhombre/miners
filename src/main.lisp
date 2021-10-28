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

(defun departure-text (miner shipname origin destination dist)
  (join-with-spaces
   (mapcar
    #'lower-sym
    (alts `(,miner departs on the ,shipname from ,origin to
                   ,(comma destination) a distance
                   of ,(round dist) light seconds.)
          `(,miner leaves on the ,shipname from ,origin to
                   ,(comma destination) a distance
                   of ,(round dist) light seconds.)
          `("The" ,(comma shipname) carrying ,(comma miner)
                starts traveling to ,destination from ,(comma origin)
                beginning a voyage
                of ,(round dist) light seconds.)
          `(,miner begins a voyage of ,(round dist)
                   light seconds on the ,(comma shipname)
                   from ,origin
                   to ,(period destination))))))

(defun add-trip (planetoids m)
  (let* ((p0 (location m))
         (p1 (rand-nth planetoids))
         (tr (new-trip p0 p1)))
    (setf (current-trip m) tr)
    (format t "~a~%" (departure-text (name m)
                                     (name (ship tr))
                                     (name p0)
                                     (name p1)
                                     (trip-distance tr)))))

(defun arrival-phrase (miner destination duration)
  (join-with-spaces
   (mapcar #'lower-sym
           (alts `(,miner has arrived at ,(comma destination)
                          after ,(duration-str duration))
                 `(,miner arrives at ,(comma destination)
                          after ,(duration-str duration))
                 `("After" ,(comma (duration-str duration))
                           ,miner arrives at ,(comma destination))))))

(defun advance-trips (numsec miners)
  (loop for m in miners
        do (let ((tr (current-trip m)))
             (when (and tr (alive m))
               (update-trip g-ls numsec tr)
               (when (arrived? tr)
                 (format t "~a~%" (arrival-phrase (name m)
                                                  (name (destination tr))
                                                  (elapsed tr)))
                 (setf (current-trip m) nil)
                 (setf (location m) (destination tr)))))))

;; hunger/satiety:
(defun snack-time (miner)
  (format t "~a is a little peckish...~%" (name miner)))

(defun meal-time (miner)
  (format t "~a is ready for a meal.~%" (name miner)))

(defun rather-hungry (miner)
  (format t "~a is quite hungry!~%" (name miner)))

(defun ravenous (miner)
  (format t "~a is absolutely ravenous!~%" (name miner)))

(defun starving (miner)
  (format t "~a is about to die of starvation!~%" (name miner)))

(defun dead (miner)
  (format t "~a is dead... RIP.~%" (name miner))
  (setf (alive miner) nil))

(defparameter satiety-thresholds
  `((,#'snack-time    . 0.95)
    (,#'meal-time     . 0.8)
    (,#'rather-hungry . 0.6)
    (,#'ravenous      . 0.5)
    (,#'starving      . 0.3)
    (,#'dead          . 0.0)))

(defun advance-miner-hunger (numsec miner)
  ;; FIXME: NOT thread-safe:
  (let* ((cur-satiety (satiety miner))
         (new-satiety (max 0 (- cur-satiety
                                (/ numsec 86400 10)))))
    (setf (satiety miner) new-satiety)
    (loop for (hunger-change-fn . thresh) in satiety-thresholds
          do (when (and (< thresh cur-satiety)
                        (<= new-satiety thresh)
                        (< new-satiety cur-satiety))
               (funcall hunger-change-fn miner)
               (return)))))

(defun advance-miners-hunger (numsec miners)
  (loop for m in miners
        do (advance-miner-hunger numsec m)))

(defun add-trips (planetoids miners)
  (when (< (random 100000) 1)
    (let ((m (rand-nth miners)))
      (when (and (alive m)
                 (null (current-trip m)))
        (add-trip planetoids m)))))

(defun trips-in-progress (miners)
  (loop for m in miners when (current-trip m) sum 1))

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
        with p = (perd) and delta-t = 1  ;; second(s)
        do (progn
             (when (funcall p)
               (format t "~a have elapsed, with ~[no~:;~:*~r~] trip~:p in flight.~%"
                       (duration-str i)
                       (trips-in-progress +all-miners+)))
             (add-trips +all-planetoids+ +all-miners+)
             (advance-trips delta-t +all-miners+)
             ;; Uncomment this if you want all miners to starve to
             ;; death; work in progress: add ships, with food in them.
             ;; Eventually they will trade, mine, exchange crews, etc.
             ;; (advance-miners-hunger delta-t +all-miners+)
             ))
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
