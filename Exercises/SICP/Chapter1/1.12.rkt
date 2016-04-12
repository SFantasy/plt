;; 帕斯卡三角型
(define (pascal n)
  (do ((result (make-vector n))
       (counter 0 (+ counter 1)))
    ((= n counter) result)
    (vector-set! result counter 
                 (C (- n 1) counter))))
    
;; 計算C(n, k)，即組合
(define (C n k)
  (cond ((= k 0) 1)
        ((= k n) 1)
        (else (/ (factorial n)
                 (* (factorial (- n k))
                    (factorial k))))))

;; 計算階乘
(define (factorial x)
  (if (= x 1)
      1
      (* x 
         (factorial (- x 1)))))