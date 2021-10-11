(in-package #:miners)

;; Geometry / space

(defun au->ls (au)
  (/ au 0.0020040))

;; Units: Light Seconds

(defparameter +oneg-ls-per-sec-sec+ (/ 9.8         ;; m/s**2
                                       299792458)) ;; m/light sec

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

(defun rand-z (height)
  (- (random height) (/ height 2)))

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

(defun vminus (b a)
  (destructuring-bind (bx by bz) b
    (destructuring-bind (ax ay az) a
      (list (- bx ax)
            (- by ay)
            (- bz az)))))

(defun scalev (a v)
  (destructuring-bind (vx vy vz) v
    `(,(* a vx)
      ,(* a vy)
      ,(* a vz))))

(defun vplus (a b)
  (destructuring-bind (bx by bz) b
    (destructuring-bind (ax ay az) a
      (list (+ ax bx)
            (+ ay by)
            (+ az bz)))))

(defun annulus-xyz (r1 r2)
  (let ((z (rand-z (- r2 r1)))
        (phi (rand-azimuth-radians))
        (r (rand-radius r1 r2)))
    (list (* r (cos phi))
          (* r (sin phi))
          z)))
