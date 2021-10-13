(in-package :miners)

(defun updater (seconds-per-update)
  (let ((mark (get-internal-real-time)))
    (lambda ()
      (let* ((cur (get-internal-real-time))
             (delta (- cur mark))
             (delta-sec (/ delta internal-time-units-per-second))
             (should-update? (< seconds-per-update delta-sec)))
        (when should-update?
          (setf mark cur))
        should-update?))))

(comment
 (setq x (updater 5))
 ;;=>
 '#<FUNCTION (LAMBDA () :IN UPDATER) {7013BC790B}>

 (funcall x)
 ;;=>
 NIL

 (funcall x)
 ;;=>
 T)
