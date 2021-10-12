(in-package :miners)

(defun init-random-number-generator ()
  (setf *random-state* (make-random-state t)))

(defun d6 () (1+ (random 6)))

(defun d2.6 () (+ (d6) (d6)))

(defun rand-val (minv maxv)
  (+ minv (random (- maxv minv))))

(defun rand-point ()
  (new-point (rand-val -100 100)
             (rand-val -1000 1000)
             (rand-val -10000 10000)))

(defun rand-azimuth-radians ()
  (random (* 2 PI)))

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

(defun rand-z (height)
  (- (random height) (/ height 2)))

(defun rand-annulus-xyz (r1 r2)
  (let ((z (rand-z (- r2 r1)))
        (phi (rand-azimuth-radians))
        (r (rand-radius r1 r2)))
    (new-point (* r (cos phi))
               (* r (sin phi))
               z)))
