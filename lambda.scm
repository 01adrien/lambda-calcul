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

(define main
  (lambda ()
    (display ((or false) false))
    ))


(main)
