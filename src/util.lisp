(in-package :miners)

(defparameter *hexmap* "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ")

(defun as-pseudo-hex (n)
  (if (< n (length *hexmap*))
      (format nil "~a" (char *hexmap* n))
      "!"))

(defun join-with-spaces (coll)
  (format nil "~{~A~^ ~}" coll))

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

(defun duration-str (numsec)
  (cond
    ((< numsec 60) (format nil "~d second~:p" numsec))
    ((< numsec 3600) (format nil "~d minute~:p" (round (/ numsec 60))))
    ((< numsec 86400) (format nil "~d hour~:p" (round (/ numsec 3600))))
    (t (format nil "~a day~:p" (round (/ numsec 86400))))))

(defun nextnext (n)
  (cond
    ((< n 10) (1+ n))
    ((< n 1000) (* 2 n))
    ((> n 3000) (+ n 3000))
    (t (* 100 (floor (/ (* 1.2 n) 100))))))

(defun perd ()
  (let ((counter 0)
        (next 1))
    (lambda ()
      (let ((fire? (equal counter next)))
        (incf counter)
        (when fire?
          (incf next (nextnext next)))
        fire?))))

(defun command-line-args ()
  (cdr (or #+CLISP *args*
           #+SBCL sb-ext:*posix-argv*
           #+LISPWORKS system:*line-arguments-list*
           #+CMU extensions:*command-line-words*
           nil)))
