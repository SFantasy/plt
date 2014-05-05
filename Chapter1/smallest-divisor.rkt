;;
;; Example program in 1.2.6
;;
#lang planet neil/sicp

(define (smallest-divisor n)
  (find-divisor n 2))

;; 如果n不是素数，则必然有一个小于或者等于n开方的因子
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (square n)
  (* n n))
