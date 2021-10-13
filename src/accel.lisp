(in-package #:miners)

;; (defparameter accel-ticks 0)
;; (defparameter next-accel-tick 1)
;; (define-system accel-miners ((entity person-name coords velocity))
;;   (incf accel-ticks)
;;   (let* ((dest (destination entity))
;;          (pos `(,(coords/x entity)
;;                 ,(coords/y entity)
;;                 ,(coords/z entity)))
;;          (v0 `(,(velocity/vx entity)
;;                ,(velocity/vy entity)
;;                ,(velocity/vz entity)))
;;          (delta (vminus `(,(coords/x dest)
;;                           ,(coords/y dest)
;;                           ,(coords/z dest))
;;                         pos))
;;          (thrust-direction (unit delta))
;;          (accel-vec (scalev +oneg-ls-per-sec-sec+ thrust-direction))
;;          (dt 1)  ;; For now; this may change, but for now one tick is one second.
;;          (new-vel (vplus v0 (scalev dt accel-vec)))
;;          (new-pos (vplus pos (scalev dt new-vel))))
;;     (setf (coords/x entity) (car new-pos))
;;     (setf (coords/y entity) (cadr new-pos))
;;     (setf (coords/z entity) (caddr new-pos))
;;     ;; FIXME: Relativity!!!
;;     (when (< (norm new-vel) 1)
;;       (setf (velocity/vx entity) (car new-vel))
;;       (setf (velocity/vy entity) (cadr new-vel))
;;       (setf (velocity/vz entity) (caddr new-vel)))
;;     (when (>= accel-ticks next-accel-tick)
;;       (setf accel-ticks next-accel-tick)
;;       (setf next-accel-tick (nextnext accel-ticks))
;;       (format t "~a X:~{ ~,1f~} V:~{ ~,10f~} (~,4fc)~%"
;;               (person-name/n entity)
;;               new-pos new-vel (norm new-vel)))))

;; (defparameter +max-iter+ 3000000)