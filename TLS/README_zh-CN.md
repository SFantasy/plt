# The Little Schemer

阅读书目：[《The Little Schemer - 递归与函数式的奥妙》（中文）](https://book.douban.com/subject/27080946/)

使用 DrRacket 软件进行编程学习，可以通过如下指令使其识别 Scheme 的语法：

```scheme
#lang scheme
```

## Scheme 五法

*这是第一章中的内容，通过非常丰富的互动式问答让读者去理解 Scheme 中的这五中操作（法则）*

基本原件 Primitive |     解释     |    示例      |    备注
------------------|-------------|-------------|------------
car    | 仅针对非空列表，获取列表的第一个元素 | `(car (a b c))` -> `a` |
cdr    | 仅针对非空列表，任意非空列表的 cdr 总是另一个列表 | `(cdr (a b c))` -> `(b c)` |
cons   | 需要两个参数，第二个参数必须是一个列表，结果返回一个新的列表 | `(cons a (b c))` -> `(a b c)` |
null?  | 仅针对列表 | `(null? (1 2 3))` -> `#f` |
eq?    | 需要两个参数，都必须是非数字的原子 | `(eq? 1 1)` -> `#t` |

## Scheme 十戒

*十戒的内容在后面几章中通过不同的代码（函数）示例逐渐引出*

1. 在表述任意函数时，总是将询问 `null?` 作为诸问题之首：

```scheme
#lang scheme

(define lat?
  (lambda (l)
    (cond
      ((null? l) #t)
      ((atom? (car l)) (lat? (cdr l)))
      (else #f))))
```

这个程序定义了一个名为 `lat?` 的函数，用以判断是否一个列表中的的 S-表达式 都是原子。

这一戒可以简单的理解为递归时，对最终情况的处理总是需要放在程序开始的时候。

2. 使用 `cons` 来构建列表：

```scheme
#lang scheme

(define rember
  (lambda (a lat)
    (cond
      ((null? lat) ())
      (else (cond
              ((eq? (car lat) a) (cdr lat))
              (else (cons
                      (car lat)
                      (rember a (cdr lat)))))))))
```

这个程序定义了一个名为 `rember` 的函数，用来移除一个列表中包含某个第一次出现的原子。

3. 构建一个列表的时候，描述第一个典型元素，之后 `cons` 该元素到一般性递归上：

```scheme
#lang scheme

(define firsts
  (lambda (l)
    (cond
      ((null? l) (quote ()))
      (else (cons
              (car (car l)
              (first (cdr l))))))))
```

要理解这一戒，则需要先理解什么是「典型元素」与「一般性递归」。

4. 在递归时总是改变至少一个参数。该参数必须向着不断接近结束条件而改变。改变的参数必须在结束条件中得以测试：当使用 `cdr` 时，用 `null?` 测试是否结束。

