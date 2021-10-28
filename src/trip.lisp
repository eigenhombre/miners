(in-package :miners)

(defclass trip ()
  ((id
    :initarg :id
    :accessor id
    :initform (incf miners::+current-id+))
   (ship
    :initarg :ship
    :type miners::ship
    :accessor ship)
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
    :type miners::planetoid)
   (pos
    :accessor pos
    :initarg :pos
    :type point)
   (vel
    :accessor vel
    :initarg :vel
    :initform '(0 0 0)
    :type list)
   (elapsed
    :accessor elapsed
    :initform 0
    :type integer)))

(defun new-trip (origin destination)
  (let* ((l0 (as-list (coords origin)))
         (l1 (as-list (coords destination)))
         (mp (apply #'new-point (middle l0 l1)))
         (ship (make-instance 'ship)))
    (make-instance 'trip
                   :origin origin
                   :ship ship
                   :destination destination
                   :midpoint mp
                   :pos (coords origin))))

(defun trip-distance (tr)
  (norm (vminus (as-list (coords (origin tr)))
                (as-list (coords (destination tr))))))

(print-as trip tr "TRIP ~a (~a -> ~a via ~a, ~,2f light seconds, x=~{ ~9,6f~}, v=~{ ~9,6f~}, ~d seconds elapsed"
          (id tr)
          (name (origin tr))
          (name (destination tr))
          (name (ship tr))
          (trip-distance tr)
          (as-list (pos tr))
          (vel tr)
          (elapsed tr))

;; newtonian
(defun accelerating? (l0 l1 l)
  (let* ((d0 (dist-between l l0))
         (d1 (dist-between l l1)))
    (< d0 d1)))

(defparameter +arrival-radius+ (m->ls 100))

(defun arrived? (tr)
  (let* ((v (vel tr))
         (cur (pos tr))
         (l1 (coords (destination tr)))
         (to-dest (vminus l1 cur)))
    (cond
      ((zerovec to-dest) t)
      ((< +arrival-radius+ (norm to-dest)) nil)
      ((zerovec v) t)
      ;; This is a bit of a hack.  When ship arrives, if it
      ;; overshoots, it tends to bounce around; this catches that.
      ;; Better math might help:
      ((< (/ (dot v (unit to-dest))
             (norm v))
          0.9)
       t)
      (t nil))))

(defun increase-accel? (vdotdir a r)
  (< vdotdir (sqrt (* 2 a r))))

(defun scale-down? (dist)
  (< dist (* +arrival-radius+ 10)))

(defun update-trip (acc dt tr)
  ;; Apply acceleration (g) appropriately to get vehicle to destination.
  (let* ((v (vel tr))
         (cur (pos tr))
         (l1 (coords (destination tr)))
         (to-dest (vminus l1 cur))
         (dir (unit to-dest))
         (r (norm (vminus l1 cur)))
         (vdotdir (dot v dir))
         (a (scalev (if (increase-accel? vdotdir acc r)
                        acc
                        (- acc))
                    dir)))
    (progn
      (setf (vel tr) (vplus v (scalev dt a)))
      (setf (pos tr) (apply #'new-point (vplus cur (scalev dt v))))
      (incf (elapsed tr) dt))
    (list (pos tr) (vel tr))))

(defun planetoid-at (l)
  (miners:new-planetoid #'(lambda ()
                            (apply #'new-point l))
                        #'astroname))

(comment
 (defvar p0)
 (defvar p1)
 (defvar tr)
 (setq p0 (planetoid-at (list 0 0 0)))
 (setq p1 (planetoid-at (list 1000 0 0)))
 (setq tr (miners::new-trip p0 p1))
 (loop repeat 200000
       do (progn
            (update-trip g-ls 100 tr)
            (format t "~a~%" (trip-repr tr)))
       until (arrived? tr)))
