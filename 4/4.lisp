#!/bin/sbcl --script

(defparameter *my-list* '())
(defun reverse-digits (n)
  (labels ((next (n v)
             (if (zerop n) v
                 (multiple-value-bind (q r)
                   (truncate n 10)
                   (next q (+ (* v 10) r))))))
    (next n 0)))
(defun collect-into-list ()
  (loop :for i
        :from 101
        :to 999
        :do (loop :for j
                  :from 101
                  :to 999
                  :for num = (* i j)
                  :if (= num (reverse-digits num))
                  :do (push num *my-list*))))


(collect-into-list)
(format t "~a~%" (reduce #'max *my-list*))
