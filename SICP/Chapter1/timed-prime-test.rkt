#lang racket

(load "smallest-divisor.rkt")

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (current-milliseconds)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (current-milliseconds) start-time))
      (display "TEST")))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (prime? n)
  (= n (smallest-divisor n)))
  