;;
;; 1.17.rkt
;; 迭代求乘积过程
;;
(define (fast-multi x y)
  (cond ((= y 1) x)
        ((even? y) (fast-multi (double x) (halve y)))
        (else (+ (fast-multi x (- y 1)) x))))

(define (double n)
  (* n 2))

(define (halve n)
  (/ n 2))

