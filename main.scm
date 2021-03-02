(define (fib x) (letrec ((fib-iter (lambda (n f1 f2) (if (< n 1) f1 (fib-iter (- n 1) f2 (+ f1  f2))))))))
(console-log "ok")
(display (string-append "hello world" (fib 10) "test"))
