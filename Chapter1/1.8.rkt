;;
;;Exercise 1.8 
;;Newton's method for Cube Roots
;;牛頓法求立方根
;;

;;遞歸求符合要求的立方根
(define (cube-iter guess x)
  (if (good-enough? guess x)
      guess
      (cube-iter (improve guess x)
                 x)))

;;計算(x/y^2+2y)/3
(define (improve guess x)
  (/ (+ (* 2 guess) (/ x (square guess))) 3))

;;小於0.001為符合要求
(define (good-enough? guess x)
  (< (abs (- (cube guess) x)) 0.001))

;;計算數的平方
(define (square x)
  (* x x))

;;計算數的立方
(define (cube x)
  (* (* x x) x))

;;入口,從1.0開始計算
(define (cube-root x)
  (cube-iter 1.0 x))