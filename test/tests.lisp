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
        (is (cl-oju:pos? (length (miners:miner-repr nil m)))))))
  (testing "Make ten of 'em just to be sure"
    (loop repeat 10
          do (print (miners:new-miner
                     #'nominal:full-name-as-str)))))

(test planetoids-test
  (testing "Making a new planetoid"
    (let ((p (miners:new-planetoid #'miners:rand-point
                                   #'miners:astroname)))
      (testing "It has a location"
        (is (equal 'miners:point (type-of (miners:coords p)))))
      (testing "It has a name"
        (is (name p)))))
  (testing "Generate ten of them"
    (loop repeat 10
          do (print (miners:new-planetoid
                     #'rand-point
                     #'miners:astroname)))))
