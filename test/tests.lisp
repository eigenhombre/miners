(in-package :miners/test)

(defun run-tests () (1am:run))

(test miners-test
  (testing "Making a new miner"
    (let* ((m (miners:new-miner
               #'nominal:full-name-as-str))
           (u (miners:upp m)))
      (testing "Type is correct"
        (is (equal 'miners:miner (type-of m))))
      (testing "Its name is a string"
        (is (stringp (miners:name m)))
        (testing "whose length is > 0"
          (is (cl-oju:pos? (length (miners:name m))))))
      (testing "Its UPP is a string"
        (is (stringp u))
        (testing "Whose length is 6"
          (is (= 6 (length u)))))
      (testing "Its printable representation's length is > 0"
        (is (cl-oju:pos? (length (miners:miner-repr m)))))))
  (testing "Make ten of 'em just to be sure"
    (loop repeat 10
          do (format t "~a~%" (miner-repr (miners:new-miner
                                           #'nominal:full-name-as-str))))))

(defun planetoid-for-test ()
  (miners:new-planetoid #'(lambda ()
                            (miners::rand-annulus-xyz miners::+inner-radius-ls+
                                                      miners::+outer-radius-ls+))
                        #'miners:astroname))
(test planetoids-test
  (testing "Making a new planetoid"
    (let ((p (planetoid-for-test)))
      (testing "It has a location"
        (is (equal 'miners:point (type-of (miners:coords p)))))
      (testing "It has a name"
        (is (name p)))))
  (testing "Generate ten of them"
    (loop repeat 10
          do (format t "~a~%" (miners::planetoid-repr
                               (planetoid-for-test))))))

(test middle-test
  (is (equalp '(0.5 0 0)
              (miners::middle '(0 0 0) '(1 0 0))))
  (is (equalp '(0 0 0.5)
              (miners::middle '(0 0 0) '(0 0 1))))
  (is (equalp '(0.5 0.5 0.5)
              (miners::middle '(0 0 0) '(1 1 1)))))

(test trip-test
  (testing "Making a new trip"
    (loop repeat 20 do
      (let ((pa (planetoid-for-test))
            (pb (planetoid-for-test)))
        (format t "~a~%" (miners::trip-repr (miners::new-trip pa pb)))))))
