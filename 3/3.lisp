#!/bin/sbcl --script

(defparameter *title* "Largest Prime Factor")
(defparameter *number* 600851475143)

(defun factor (n)
  "Return a list of prime factors of N."
  (when (> n 1)
    (loop :with max-d = (isqrt n)
	        :for d = 2 
	        :then (if (evenp d) (+ d 1) (+ d 2)) 
	        :do
	        (cond ((> d max-d) (return (list n))) ; n is prime
		            ((zerop (rem n d)) (return (cons d (factor (truncate n d)))))))))

(format t "Problem Title: ~a~%" *title*)
(format t "The largest prime factor of the number ~a is ~a~%" *number* (reduce #'max (factor *number*)))
