(in-package :miners)

(defclass ship ()
  ((name
    :accessor name :initarg :name :initform (ship-name))
   (crew
    :accessor crew :initform nil)))

(print-as ship s "~a (~{~a~})" (name s) (crew s))

