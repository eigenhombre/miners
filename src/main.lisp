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

(defun astroname ()
  (string-upcase (format nil "~a~a"
                         (ngram-name)
                         (random 10000))))

;; Geometry / space
;; Units: Light Seconds

(defparameter +oneg-ls-per-sec-sec+
  (/ 9.8 ;; m/s**2
     299792458 ;; m/light sec
     ))

(defun au->ls (au)
  (/ au 0.0020040))

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

(defun norm (v)
  (destructuring-bind (vx vy vz) v
    (sqrt (+ (sqr vx)
             (sqr vy)
             (sqr vz)))))

(defun unit (v)
  (let ((vl (norm v)))
    (destructuring-bind (vx vy vz) v
      (list (/ vx vl)
            (/ vy vl)
            (/ vz vl)))))

(defun asteroid-position ()
  (let ((z (rand-z))
        (phi (rand-azimuth-radians))
        (r (rand-radius +inner-radius-ls+ +outer-radius-ls+)))
    (list (* r (cos phi))
          (* r (sin phi))
          z)))

;; Aspects, Entities and Systems

(define-aspect attributes str dex end int cha soc)
(define-aspect person-name n)
(define-aspect astroname n)

(define-aspect age (ticks :initform 0))

(define-aspect velocity vx vy vz)
(define-aspect coords x y z)
(define-aspect location places)

(define-entity miner (person-name attributes age coords velocity))
(define-entity oid (astroname coords))

(defun d () (1+ (random 6)))
(defun d2 () (+ (d) (d)))

(defun new-miner ()
  (create-entity 'miner
                 :person-name/n (full-name-as-str)
                 :attributes/str (d2)
                 :attributes/dex (d2)
                 :attributes/end (d2)
                 :attributes/int (d2)
                 :attributes/cha (d2)
                 :attributes/soc (d2)))

(define-system aging ((entity age))
  (incf (age/ticks entity)))

(defparameter letters (loop for c across "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"
                            collect c))

(defun pseudo-hex (n)
  (if (< n (length letters))
      (format nil "~a" (nth n letters))
      "!"))

(defun upp (e)
  (format nil "~a~a~a~a~a~a"
          (pseudo-hex (attributes/str e))
          (pseudo-hex (attributes/dex e))
          (pseudo-hex (attributes/end e))
          (pseudo-hex (attributes/int e))
          (pseudo-hex (attributes/cha e))
          (pseudo-hex (attributes/soc e))))

(defun miner-str (e)
  (format nil "~a, ~a" (person-name/n e) (upp e)))

(define-system log-all-miners ((entity attributes))
  (format t "~a~%" (miner-str entity)))

(defun asteroid-str (entity)
  (format nil "~10a ~30@a ~8,0f ~8,0f ~8,0f~%"
          (entity-id entity)
          (astroname/n entity)
          (coords/x entity)
          (coords/y entity)
          (coords/z entity)))

(define-system log-all-oids ((entity astroname))
  (princ (asteroid-str entity)))

(defun init-random-number-generator ()
  (setf *random-state* (make-random-state t)))

(defun new-oid ()
  (destructuring-bind (x y z) (asteroid-position)
    (create-entity 'oid
                   :astroname/n (astroname)
                   :coords/x x
                   :coords/y y
                   :coords/z z)))

(defun dirty-n-entities (n)
  "
  Don't try this at home.  Get the first n entities.
  "
  (loop repeat n
        for e in (beast::all-entities)
        collect e))

(defun main ()
  (clear-entities)
  (init-random-number-generator)
  (loop repeat 10
        do (new-oid))
  (loop repeat 30
        do (new-miner))
  (loop repeat 100
        do (run-aging))

  (format t "Miners______________________________________________________________~%")
  (run-log-all-miners)
  (format t "Asteroids___________________________________________________________~%")
  (run-log-all-oids)
  (format t "Thanks for using miners!~%"))
