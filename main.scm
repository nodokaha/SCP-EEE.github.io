(define (fib x) (letrec ((fib-iter (lambda (n f1 f2) (if (< n 1) f1 (fib-iter (- n 1) f2 (+ f1  f2))))))(fib-iter x 0 1)))

(define start-text '("初めまして、ああ、いや、私にとってはいつも初めましてなんですけど。" "どこかでお会いしましたかね？…どうでもいいんですけど。" "ようこそ、ようこそ。趣味の悪い監獄へ…嘘です。" "今日はとても良い日ですね。" "またですか？…ああいや、こっちの話です。" "飽きたら言ってください。新しい自分を発注しなきゃいけないので。…なんてね。" "どうぞ、ユーザー。ここでは暇潰しが出来ますよ。人によってはですが。"))

(define (user-input) 
  (let ((msg (read (current-input-port)))) 
                       (if (symbol? msg) (symbol->string msg) 
                           (if (number? msg) (number->string msg) 
                               (begin (display "Error") (user-input))))))

(define blog "https://SCP-EEE.github.io/blog.html")

(define (help) (display "blog: ブログサイトのURIを出力します。するだけです。\n(fib n): フィボナッチ数列のn番目を計算してくれます。\n(tictactoe)： 良かったですね。○×ゲームで遊べますよ。さらに独り用です。\n(help)： これです。"))

(define helloworld "こんにちは世界\nこの手紙はあなたに見えているでしょうか？")
(display helloworld)

;(define (tictactoe) (display " | | \n-----\n | | \n------ | | \n1~9を入力してください。")
;  (let loop ((user-msg user-input)(user-mark '())(flag 0))
;    (if (random-integer 1)
;    (cond ((= user-msg "1") (loop (user-input) (list user-mark 1) 

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

(cond ((string=? user-msg "はい?") (begin (display "わかりませんか？") (display "ですよねぇ") (newline) (display "ようこそ、私のサイトへ")))
      ((string=? user-msg "わかんねえよ") (display "..."))
      ((string=? user-msg (number->string (fib 17)))(display "ようこそ、私のサイトへ"))
      (else (display "残念ですが、貴方は私のサイトに入る資格がなかったようです。\nまた、お越しください。...嘘です。")))

(display (list-ref start-text (random-integer (length start-text))))
(display "何をすればいいか分からなかったら(help)と入力してくださいね。")
