(in-package #:miners)

;; Naming things

(defun string-join-space (coll)
  (format nil "~{~A~^ ~}" coll))

(defun string-join (coll)
  (format nil "~{~A~}" coll))

(defun person-name ()
  (loop repeat (1+ (rand-int (1+ (rand-int 5))))
        collect (string-capitalize (full-name-as-str)) into names
        finally (return (string-join-space names))))

(defun oid-name ()
  (string-upcase (format nil "~a~a"
                         (ngram-name)
                         (random 10000))))

;; Aspects, Entities and Systems

(define-aspect person-name (n :initform (full-name-as-str)))
(define-aspect oid-name (n :initform (oid-name)))

(define-aspect age (ticks :initform 0))

(define-aspect velocity vx vy vz)
(define-aspect location x y z)

;; Units: Light Seconds

(defparameter +oneg-ls-per-sec-sec+
  (/ 9.8 ;; m/s**2
     299792458 ;; light sec/m
     ))

(defun au->ls (au)
  (* 0.0020040 au))

(defparameter +mars-orbit-au+ 1.5)
(defparameter +jupiter-orbit-au+ 5.2)

(defparameter +inner-radius-ls+ (au->ls +mars-orbit-au+))
(defparameter +outer-radius-ls+ (au->ls +jupiter-orbit-au+))

(defun rand-azimuth-radians ()
  (random (* 2 PI)))

(defun sqr (x) (* x x))

(defun rand-radius (r1 r2)
  "
  Random radius from an annulus:
  dist = sqrt(rnd()*(R1^2-R2^2)+R2^2) from
  https://stackoverflow.com/questions/13064912
  (R1 and R2 are reverse of traditional order, which I swap here).
  "
  (let ((r12 (sqr r1))
        (r22 (sqr r2)))
    (sqrt (+ (* (random 1.0) (- r22 r12))
             r12))))

(defun rand-z ()
  (let ((height (- +outer-radius-ls+
                   +inner-radius-ls+)))
    (- (random height)
       (/ height 2))))

(defun asteroid-position ()
  (let ((z (rand-z))
        (phi (rand-azimuth-radians))
        (r (rand-radius +inner-radius-ls+ +outer-radius-ls+)))
    (list (* r (cos phi))
          (* r (sin phi))
          z)))

(define-entity miner (person-name age location))
(define-entity oid (oid-name location))
(define-system aging ((entity age))
  (incf (age/ticks entity)))

(define-system log-all-miners ((entity age person-name))
  (format t "~a: ~a~%" (person-name/n entity) (age/ticks entity)))

(define-system log-all-oids ((entity oid-name))
  (format t "~30@a ~10,5f ~10,5f ~10,5f~%"
          (oid-name/n entity)
          (location/x entity)
          (location/y entity)
          (location/z entity))
  (destroy-entity entity))

(defun init-random-number-generator ()
  (setf *random-state* (make-random-state t)))

(defun new-oid ()
  (destructuring-bind (x y z) (asteroid-position)
    (create-entity 'oid
                   :location/x x
                   :location/y y
                   :location/z z)))

(defun main ()
  (init-random-number-generator)
  (loop repeat 30
        do (create-entity 'miner))
  (loop repeat 100
        do (new-oid))
  (loop repeat 100
        do (run-aging))
  (run-log-all-miners)
  (run-log-all-oids)
  (format t "Thanks for using miners!~%"))
