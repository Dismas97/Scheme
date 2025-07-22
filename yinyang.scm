(define (fncircle px py x y r)
 (let ( (x (- x px))
        (y (- y py)) )
  (< (+ (* x x) (* y y)) (* r r))))

(define (fnyinyang x y)
 (cond
  ((or  (< x 0)  (< y 0)  (> x 1)  (> y 1))
   0)
  ((not (fncircle x y 0.5 0.5 0.5))
   0)
  (else
   (let* ( (which (> y 0.5))
           (y (- y 0.125 (if which 0.5 0))) )
    (if (fncircle x y 0.5 0.125 0.25)
     (- 2 (if (xor which (fncircle x y 0.5 0.125 0.0625)) 1 0))
     (- 2 (if (> x 0.5) 1 0)))))))

(define char-lookup (vector " " "." "#"))

(define (draw-yin-yang height)
 (let ( (width (* height 2)) )
  (do ( (y 0 (+ y 1)) ) ( (>= y height) )
   (do ( (x 0 (+ x 1)) ) ( (>= x width) )
    (let ( (xx (/ x width))
           (yy (/ y height)) )
     (display (vector-ref char-lookup (fnyinyang xx yy)))))
   (newline))))

(draw-yin-yang 50)
