(in-package :miners)

(defclass miner ()
  ((name
    :accessor name
    :type integer
    :initarg :name)
   (id
    :initarg :id
    :accessor id
    :initform (incf +current-id+))
   (strength
    :accessor strength
    :type integer
    :initform (d2.6)
    :initarg :strength)
   (dexterity
    :accessor dexterity
    :type integer
    :initform (d2.6)
    :initarg :dexterity)
   (endurance
    :accessor endurance
    :type integer
    :initform (d2.6)
    :initarg :endurance)
   (intelligence
    :accessor intelligence
    :type integer
    :initform (d2.6)
    :initarg :intelligence)
   (education
    :accessor education
    :type integer
    :initform (d2.6)
    :initarg :education)
   (social-standing
    :accessor social-standing
    :type integer
    :initform (d2.6)
    :initarg :social-standing)
   (current-trip
    :accessor current-trip
    :type trip)))

(defun upp (m)
  (format nil "~{~a~}"
          (mapcar #'as-pseudo-hex (list (strength m)
                                        (dexterity m)
                                        (endurance m)
                                        (intelligence m)
                                        (education m)
                                        (social-standing m)))))

(defun new-miner (name-gen-fn)
  (make-instance 'miner
                 :name (funcall name-gen-fn)))

(print-as miner m "~a (~a, ~a)" (name m) (id m) (upp m))
