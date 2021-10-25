(in-package :miners/test)

(defun run-tests () (1am:run))

(test norm-test
  (is (equal 1.0
             (miners::norm '(1 0 0))))
  (is (equal (miners::norm '(1 2 3))
             (miners::norm (make-instance 'point :x 1 :y 2 :z 3)))))

(test unit-test
  (is (equal '(1.0 0.0 0.0) (miners::unit '(1.0 0 0))))
  (is (equal '(1.0 0.0 0.0) (miners::unit (make-instance 'point :x 1 :y 0 :z 0)))))

(test g-test
  (is (= (/ miners::g-ls (miners::m->ls 1))
         9.8)))

(test miners-test
  (let* ((m (miners:new-miner
             #'nominal:full-name-as-str
             nil))
         (u (miners:upp m)))
    (is (equal 'miners:miner (type-of m)))
    (is (stringp (miners:name m)))
    (is (cl-oju:pos? (length (miners:name m))))
    (is (stringp u))
    (is (= 6 (length u)))
    (is (cl-oju:pos? (length (miners:miner-repr m)))))
  (loop repeat 10
        do (format t "~a~%" (miner-repr (miners:new-miner
                                         #'nominal:full-name-as-str
                                         nil)))))

(defun planetoid-for-test ()
  (miners:new-planetoid #'(lambda ()
                            (miners::rand-annulus-xyz miners::+inner-radius-ls+
                                                      miners::+outer-radius-ls+))
                        #'miners:astroname))
(test planetoids-test
  (let ((p (planetoid-for-test)))
    (is (equal 'miners:point (type-of (miners:coords p))))
    (is (name p)))
  (loop repeat 10
        do (format t "~a~%" (miners::planetoid-repr
                             (planetoid-for-test)))))

(test middle-test
  (is (equalp '(0.5 0 0)
              (miners::middle '(0 0 0) '(1 0 0))))
  (is (equalp '(0 0 0.5)
              (miners::middle '(0 0 0) '(0 0 1))))
  (is (equalp '(0.5 0.5 0.5)
              (miners::middle '(0 0 0) '(1 1 1)))))

(test trip-test
  (loop repeat 20 do
    (let ((pa (planetoid-for-test))
          (pb (planetoid-for-test)))
      (format t "~a~%" (miners::trip-repr (miners::new-trip pa pb))))))

(test accelerating?-test
  (is (miners::accelerating? '(0 0 0)
                             '(10000 0 0)
                             '(4999 0 0)))
  (is (not (miners::accelerating? '(0 0 0)
                                  '(10000 0 0)
                                  '(5001 0 0)))))

(defun planetoid-at (l)
  (miners:new-planetoid #'(lambda ()
                            (apply #'miners::new-point l))
                        #'miners:astroname))

(test arrival-test
  (let* ((p0 (planetoid-at '(0 0 0)))
         (p1 (planetoid-at '(1000 0 0)))
         (tr (miners::new-trip p0 p1)))
    (setf (miners::pos tr) (miners::new-point 1000 0 0))
    (is (miners::arrived? tr))
    (setf (miners::pos tr) (coords p1))
    (is (miners::arrived? tr))
    (setf (miners::pos tr) (miners::new-point 1001 0 0))
    (is (not (miners::arrived? tr)))
    (setf (miners::pos tr) (coords p0))
    (is (not (miners::arrived? tr)))))
