(in-package :miners)

(defclass planetoid ()
  ((coords :initarg :coords :accessor coords)
   (name :initarg :name :accessor name)))

(defun planetoid-repr (stream p)
  (format stream "Planetoid ~a at ~a"
          (name p)
          (coords p)))

(defmethod print-object ((p planetoid) stream)
  (print-unreadable-object (p stream :type t :identity t)
    (planetoid-repr stream p)))

(defun new-planetoid (point-gen-fn name-gen-fn)
  (make-instance 'planetoid
                 :coords (funcall point-gen-fn)
                 :name (funcall name-gen-fn)))

