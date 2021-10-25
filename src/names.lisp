(in-package :miners)

(defun person-name ()
  (loop repeat (1+ (rand-int (1+ (rand-int 5))))
        collect (string-capitalize (full-name-as-str)) into names
        finally (return (join-with-spaces names))))

(defun astroname ()
  (string-upcase (format nil "~a~a"
                         (ngram-name)
                         (random 10000))))
