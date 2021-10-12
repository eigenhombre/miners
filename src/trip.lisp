(in-package :miners)

(defclass trip ()
  ((id
    :initarg :id
    :accessor id
    :initform (incf miners::+current-id+))
   (origin
    :accessor origin
    :initarg :origin
    :type miners::planetoid)
   (midpoint
    :accessor midpoint
    :initarg :midpoint
    :type point)
   (destination
    :accessor destination
    :initarg :destination
    :type miners::planetoid)))

(defun new-trip (origin destination)
  (let* ((l0 (as-list (coords origin)))
         (l1 (as-list (coords destination)))
         (mp (apply #'new-point (middle l0 l1))))
    (make-instance 'trip
                   :origin origin
                   :destination destination
                   :midpoint mp)))

(print-as trip tr "TRIP ~a (~a -> ~a, ~,2f light seconds)"
          (id tr)
          (name (origin tr))
          (name (destination tr))
          (norm (vminus (as-list (coords (origin tr)))
                        (as-list (coords (destination tr))))))
