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
(define bool-equal?
  (lambda (x) (lambda (y) (x y (not y)))))


;; same as pair but args in different order
(define IF
  (lambda (c) (lambda (e1) (lambda (e2) ((c e1)  e2)))))


;; number 0 => 10
;;(define zero (lambda() (id)))
(define zero id)
(define one (successor zero))
(define two (successor one))
(define three (successor two))  
(define four (lambda() (successor three)))
(define five (lambda() (successor four)))
(define six (lambda() (successor five)))  
(define seven (lambda() (successor six)))
(define eight (lambda() (successor seven)))
(define nine (lambda() (successor eight)))  
(define ten (lambda() (successor nine)))



(define value 5)

(define lazy-add
  (lambda (f)
    (lambda (x)
      (lambda (y)
	(display "HELLO ")
	 (((IF (zero? y)) x) (((f f) (successor x)) (predecessor y)))))))

(define add (lazy-add lazy-add))

;;      (((_if (zero? y)) x) ((add (successor x)) (predecessor y)))

(display one)
(newline)
;;(display (zero? (one)))
;;(display (((if (zero? (one))) "ZERO") "NOT ZERO"))
(define res ((add two) two))
(display res)
;;(display (main))
