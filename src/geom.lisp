(in-package #:miners)

;; Geometry / space

(defun au->ls (au)
  (/ au 0.0020040))

(defun m->ls (meters)
  (/ meters 299792458))

;; Units: Light Seconds

(defparameter g-ls (/ 9.8         ;; m/s**2
                      299792458)) ;; m/light sec

(defparameter +mars-orbit-au+ 1.5)
(defparameter +jupiter-orbit-au+ 5.2)

(defparameter +inner-radius-ls+ (au->ls +mars-orbit-au+))
(defparameter +outer-radius-ls+ (au->ls +jupiter-orbit-au+))

(defun sqr (x) (* x x))

(defgeneric norm (vec))

(defmethod norm ((vec list))
  (destructuring-bind (vx vy vz) vec
    (sqrt (+ (sqr vx)
             (sqr vy)
             (sqr vz)))))

(defmethod norm ((vec point))
  (norm (list (x vec) (y vec) (z vec))))

(defgeneric unit (vec))

(defmethod unit ((vec list))
  (let ((vn (norm vec)))
    (destructuring-bind (vx vy vz) vec
      (list (/ vx vn)
            (/ vy vn)
            (/ vz vn)))))

(defmethod unit ((vec point))
  (unit (list (x vec) (y vec) (z vec))))

(defun unit-to (from to)
  (unit (vminus to from)))

(defgeneric vminus (b a))

(defmethod vminus ((b list) (a list))
  (destructuring-bind (bx by bz) b
    (destructuring-bind (ax ay az) a
      (list (- bx ax)
            (- by ay)
            (- bz az)))))

(defmethod vminus ((b point) (a point))
  (vminus (list (x b) (y b) (z b))
          (list (x a) (y a) (z a))))

(defmethod vminus ((b point) (a list))
  (vminus (list (x b) (y b) (z b))
          a))

(defmethod vminus ((b list) (a point))
  (vminus a
          (list (x a) (y a) (z a))))

(defgeneric dot (a b))

(defmethod dot ((a list) (b list))
  (destructuring-bind (bx by bz) b
    (destructuring-bind (ax ay az) a
      (+ (* bx ax)
         (* by ay)
         (* bz az)))))

(defmethod dot ((a point) (b point))
  (dot (list (x b) (y b) (z b))
       (list (x a) (y a) (z a))))

(defun scalev (a v)
  (destructuring-bind (vx vy vz) v
    `(,(* a vx)
      ,(* a vy)
      ,(* a vz))))

(defgeneric vplus (a b))

(defmethod vplus ((a list) (b list))
  (destructuring-bind (bx by bz) b
    (destructuring-bind (ax ay az) a
      (list (+ ax bx)
            (+ ay by)
            (+ az bz)))))

(defmethod vplus ((a point) (b point))
  (vplus (list (x b) (y b) (z b))
         (list (x a) (y a) (z a))))

(defmethod vplus ((a list) (b point))
  (vplus a
         (list (x b) (y b) (z b))))

(defmethod vplus ((a point) (b list))
  (vplus (list (x a) (y a) (z a))
         b))

(defun dist-between (a b)
  (norm (vminus a b)))

(defun middle (a b)
  (let* ((delta (vminus b a))
         (delta-half (scalev 0.5 delta)))
    (vplus a delta-half)))
