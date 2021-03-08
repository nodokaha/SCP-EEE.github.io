(define (fib x) (letrec ((fib-iter (lambda (n f1 f2) (if (< n 1) f1 (fib-iter (- n 1) f2 (+ f1  f2))))))(fib-iter x 0 1)))
(console-log "ok")
(display (string-append "hello world" (number->string (fib 10)) "test"))
