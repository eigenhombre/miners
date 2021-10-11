(in-package :miners)

(defparameter *hexmap* "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ")

(defun as-pseudo-hex (n)
  (if (< n (length *hexmap*))
      (format nil "~a" (char *hexmap* n))
      "!"))

(defun string-join-space (coll)
  (format nil "~{~A~^ ~}" coll))

(defun string-join (coll)
  (format nil "~{~A~}" coll))

(defmacro print-as (type obj &rest format-args)
  "
  Make printable representation of an object `obj` of type `type` via
  a `format` expression.
  "
  (let ((stream-sym (gensym))
        (rep-fn-sym (intern (concatenate 'string
                                         (symbol-name type)
                                         "-REPR"))))
    `(progn
       (defun ,rep-fn-sym (,obj)
         (format nil ,@format-args))
       (defmethod print-object ((,obj ,type) ,stream-sym)
         (print-unreadable-object (,obj ,stream-sym :type t :identity t)
           (format ,stream-sym ,@format-args))))))
