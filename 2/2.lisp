#!/bin/sbcl --script

(defparameter *max-term-value* 4000000) ; four million
(defparameter *title* "Even Fibonacci numbers")

(defun fib (my-list)
  (let ((next-term (+ (car my-list) 
                      (cadr my-list))))
    (if (<= next-term *max-term-value*)
        (fib (push next-term my-list))
        (reverse my-list))))

(format t "Problem Title: ~a~%" *title*)
(format t
        "The sum of the even valued fibonacci terms that do not exceed 4 million is ~a~%"
        (reduce #'+ (remove-if-not #'evenp (fib '(2 1)))))

