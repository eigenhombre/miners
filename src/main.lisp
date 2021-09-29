(in-package #:miners)

;; Naming things

(defun string-join-space (coll)
  (format nil "~{~A~^ ~}" coll))

(defun string-join (coll)
  (format nil "~{~A~}" coll))

(defun person-name ()
  (loop repeat (1+ (rand-int (1+ (rand-int 5))))
        collect (string-capitalize (make-name)) into names
        finally (return (string-join-space names))))

(defun roid-name ()
  (loop repeat 3
        collect (make-name) into names
        finally (return (string-upcase (string-join names)))))

;; Aspects, Entities and Systems

(define-aspect name (n :initform (person-name)))
(define-aspect roidname (n :initform (roid-name)))

(define-aspect age (ticks :initform 0))
(define-aspect location x y z)

(define-entity miner (name age location))
(define-entity roid (roidname location))

(define-system aging ((entity age))
  (incf (age/ticks entity)))

(define-system log-all-miners ((entity age name))
  (format t "~a: ~a~%" (name/n entity) (age/ticks entity)))

(define-system log-all-roids ((entity roidname))
  (format t "~a~%" (roidname/n entity)))

(defun init-random-number-generator ()
  (setf *random-state* (make-random-state t)))

(defun main ()
  (init-random-number-generator)
  (loop repeat 30
        do (create-entity 'miner))
  (loop repeat 30
        do (create-entity 'roid))
  (loop repeat 100
        do (run-aging))
  (run-log-all-miners)
  (run-log-all-roids)
  (format t "Thanks for using miners!~%"))

