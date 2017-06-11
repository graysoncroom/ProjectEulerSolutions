#!/bin/clisp

(defvar answer 0)

(loop :for i
      :from 1
      :below 1000
      :if (or (= (mod i 3) 0) (= (mod i 5) 0))
      :do (incf answer i))
(format t "Problem Title: Multiples of 3 and 5~%")
(format t "The sum of all the multiples of 3 or 5 below 1000 is ~a~%" answer)
