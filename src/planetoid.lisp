(in-package :miners)

(defclass planetoid ()
  ((id :initarg :id :accessor id :initform (incf +current-id+))
   (coords :initarg :coords :accessor coords)
   (name :initarg :name :accessor name)))

(defun new-planetoid (point-gen-fn name-gen-fn)
  (make-instance 'planetoid
                 :coords (funcall point-gen-fn)
                 :name (funcall name-gen-fn)))

(print-as planetoid p
          "Planetoid ~a(~a) at ~a"
          (name p)
          (id p)
          (point-repr (coords p)))
