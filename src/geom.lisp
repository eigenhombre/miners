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

(defun sqr (x) (* x x))

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

(defun middle (a b)
  (let* ((delta (vminus b a))
         (delta-half (scalev 0.5 delta)))
    (vplus a delta-half)))
