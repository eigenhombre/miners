(in-package :miners)

(defclass point ()
  ((x :initarg :x :type :double :accessor x)
   (y :initarg :y :type :double :accessor y)
   (z :initarg :z :type :double :accessor z)))

(print-as point p "(~,1f ~,1f ~,1f)" (x p) (y p) (z p))

(defun new-point (x y z)
  (make-instance 'point :x x :y y :z z))

(defun as-list (p)
  (list (x p) (y p) (z p)))
