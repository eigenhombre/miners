(in-package :miners)

(defclass point ()
  ((x :initarg :x :type :double :accessor x)
   (y :initarg :y :type :double :accessor y)
   (z :initarg :z :type :double :accessor z)))

(print-as point p "(~a ~a ~a)" (x p) (y p) (z p))

(defun new-point (x y z)
  (make-instance 'point :x x :y y :z z))

(defun rand-point ()
  (new-point (rand-val -100 100)
             (rand-val -1000 1000)
             (rand-val -10000 10000)))
