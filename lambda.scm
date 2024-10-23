(define id
  (lambda (x) x))


(define self-apply
  (lambda (f) (f f)))


(define apply
  (lambda (f) (lambda (arg) (f arg))))


(define first
  (lambda (x) (lambda (y) x)))


(define second
  (lambda (x) (lambda (y) y)))


(define pair
  (lambda (x) (lambda (y) (lambda (f) ((f x) y)))))


(define main
  (lambda ()
    (define my-pair ((pair 'A) 'B))
    (display (my-pair second))
    ))


(main)
