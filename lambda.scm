;; λx.x
(define id
  (lambda (x) x))


;; λf.(f f)
(define self-apply
  (lambda (f) (f f)))


;; λfunc.λarg.(func arg)
(define apply
  (lambda (f) (lambda (arg) (f arg))))


;; λfirst.λsecond.first
(define first
  (lambda (x) (lambda (y) x)))


;; λfirst.λsecond.second
(define second
  (lambda (x) (lambda (y) y)))


(define true first)
(define false second)


;; λx.λy.λf.((f x) y)
(define pair
  (lambda (x) (lambda (y) (lambda (f) ((f x) y)))))


;; λx.((x false) true)
(define not
  (lambda (x) ((x false) true)))


;; λx.λy.((x y) false)
(define and
  (lambda (x) (lambda (y) ((x y) false))))


;; λx.λy.((x true) y)
(define or
  (lambda (x) (lambda (y) ((x true) y))))


;; representation of 0
(define zero id)


;; λn.λs.((s false) n)
(define successor
  (lambda (n) (lambda (s) ((s false) n))))


;; λn.(n select_first)
(define zero? 
  (lambda (n) (n first)))


;; λn.(((iszero n) zero) (n select_second))
(define predecessor
  (lambda (n) (((zero? n) zero) (n second))))


;; (not (and (true x) (false y)))
;; λx.λy.(x y true)
(define implies
  (lambda (x) (lambda (y) (x y true))))


;; λx.λy.(x y (not y))
(define equal?
  (lambda (x) (lambda (y) (x y (not y)))))


(define one (successor zero))
(define two (successor one))
(define three (successor two))  


;; main function
(define main
  (lambda ()
    (predecessor one)
    ))


(display (main))
