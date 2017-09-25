#lang scheme

(define atom?
  (lambda (x)
    (and (not (pair? x)) (not (null? x)))))

(define lat?
  (lambda (l)
    (cond
      ((null? l) #t)
      ((atom? (car l)) (lat? (cdr l)))
      (else #f))))

(define member?
  (lambda (l lat)
    (cond
      ((null? l) #f)
      (else (or (eq? (car lat) l)
                (member? l (cdr lat)))))))


(define rember
  (lambda (a lat)
    (cond
      ((null? lat) (quote ()))
      (else (cond
              ((eq? (car lat) a) (cdr lat))
              (else (cons
                      (car lat)
                      (rember a (cdr lat)))))))))

(define firsts
  (lambda (l)
    (cond
      ((null? l) #f)
      (else (cons (car (car l)) (firsts (cdr l)))))))

(define insertR
  (lambda (new old lat)
    (cond
      ((null? lat) (quote ()))
      (else (cond
              ((eq? (car lat) old) (cons (old (cons new (cdr lat)))))
              (else (cons (car lat) (insertR new old (car lat)))))))))

(define multirember
  (lambda (a lat)
    (cond
      ((null? lat) (quote ()))
      (else
       (cond
         ((eq? (car lat) a)
          (multirember a (cdr lat)))
          (else (cons (car lat)
                      (multirember a (cdr lat)))))))))
