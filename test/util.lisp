(in-package :miners/test)

(defparameter +scope-indent+ 0)

(defun indent ()
  (concatenate
   'string
   (loop repeat (* 2 +scope-indent+)
         collect #\space)))

(defun with-scope-increment* (body-fn)
  (let ((s +scope-indent+))
    (setf +scope-indent+ (1+ +scope-indent+))
    (let ((ret (funcall body-fn)))
      (setf +scope-indent+ s)
      ret)))

(defun testing* (title body-fn)
  (format t "~%~a~a~%" (indent) title)
  (with-scope-increment* body-fn))

(defmacro testing (title &rest body)
  `(testing* ,title #'(lambda () ,@body)))
