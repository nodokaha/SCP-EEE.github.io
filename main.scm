(define (fib x) (letrec ((fib-iter (lambda (n f1 f2) (if (< n 1) f1 (fib-iter (- n 1) f2 (+ f1  f2))))))(fib-iter x 0 1)))
(define helloworld "こんにちは世界\nこの手紙はあなたに見えているでしょうか？")
(display helloworld)

(define (user-input) (let ((msg (read (current-input-port)))) (if (symbol? msg) (symbol->string msg) (begin (display "Error") (user-msg)))))

(define user-msg (user-input))
(console-log user-msg)
(display user-msg)

(cond ((string=? user-msg "はい") (display "そうですか"))
      ((string=? user-msg "いいえ") (display "..."))
      (else (display "...")))

(display "あなたにお願いしたいことがあります。")

(display "聞いてくれますか？")

(define user-msg (user-input))
(display user-msg)

(cond ((string=? user-msg "はい") (display "よかった"))
      ((string=? user-msg "いいえ") (display "..."))
      (else (display "...")))

(display "17番目のフィボナッチ数列の数はいくつですか？")

(define user-msg (user-input))
(display user-msg)

(cond ((string=? user-msg "はい?") (display "わかりませんか？"))
      ((string=? user-msg "わかんねえよ") (display "..."))
      ((string=? user-msg (number->string (fib 17)))(display "ようこそ、私のサイトへ"))
      (else (display "Bye")))

