(in-package :miners)

(defun init-random-number-generator ()
  (setf *random-state* (make-random-state t)))

(defun d6 () (1+ (random 6)))

(defun d2.6 () (+ (d6) (d6)))

(defun rand-val (minv maxv)
  (+ minv (random (- maxv minv))))
