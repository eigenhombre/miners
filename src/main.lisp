(in-package #:miners)

;; Naming things

(defun string-join (coll)
  (format nil "~{~A~^ ~}" coll))

(defun person-name ()
  (loop repeat (1+ (rand-int (1+ (rand-int 5))))
        collect (string-capitalize (make-name)) into names
        finally (return (string-join names))))

;; Aspects

(define-aspect name (n :initform (person-name)))
(define-aspect age (ticks :initform 0))

(define-entity miner (name age))

(define-system aging ((entity age))
  (incf (age/ticks entity)))

(define-system log-all-miners ((entity age name))
  (format t "~a: ~a~%" (name/n entity) (age/ticks entity)))

(defun init-random-number-generator ()
  (setf *random-state* (make-random-state t)))

(defun main ()
  (init-random-number-generator)
  (loop repeat 10
        do (create-entity 'miner))
  (loop repeat 100
        do (run-aging))
  (loop repeat 15
        do (create-entity 'miner))
  (loop repeat 30
        do (run-aging))
  (run-log-all-miners)
  (format t "Thanks for using miners!~%"))

