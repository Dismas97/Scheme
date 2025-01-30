;

;(define (def-cero x) (list 'define (string->symbol x) 0))
;(define (def-cero-lista x) (map def-cero x))
;(define codigo-generado (def-cero-lista (list "variable1" "variable2" "variable3")))

;(for-each (lambda (x) (eval x (interaction-environment))) codigo-generado)

;(define (rango x y)
;  (if (> y x) 
;	  (cons x (rango (+ x 1) y))
;	  '()))
;(display (rango 0 20))

(use-modules (web server))

(define (controlador request request-body)
  (values '((content-type . (text/plain)))
          "Hello World!"))

(run-server controlador 'http '(#:port 9092))
