;;
;;Newton's method for Square Roots
;;牛頓法求平方根
;;Sample Program in SICP
;;

;;遞歸求符合要求的平方根
(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

;;計算y和x/y的平均值（更為接近平方根）
(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

;;小於0.001為符合要求
(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

;;計算數的平方
(define (square x)
  (* x x))

;;入口，從1.0開始計算
(define (sqrt x)
  (sqrt-iter 1.0 x))