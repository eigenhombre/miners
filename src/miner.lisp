(in-package :miners)

(defclass miner ()
  ((name
    :accessor name
    :type integer
    :initarg :name)
   (strength
    :accessor strength
    :type integer
    :initarg :strength)
   (dexterity
    :accessor dexterity
    :type integer
    :initarg :dexterity)
   (endurance
    :accessor endurance
    :type integer
    :initarg :endurance)
   (intelligence
    :accessor intelligence
    :type integer
    :initarg :intelligence)
   (education
    :accessor education
    :type integer
    :initarg :education)
   (social-standing
    :accessor social-standing
    :type integer
    :initarg :social-standing)))

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
                 :name (funcall name-gen-fn)
                 :strength (d2.6)
                 :dexterity (d2.6)
                 :endurance (d2.6)
                 :intelligence (d2.6)
                 :education (d2.6)
                 :social-standing (d2.6)))

(print-as miner m "~a (~a)" (name m) (upp m))
