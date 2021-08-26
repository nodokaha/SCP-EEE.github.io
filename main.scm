(define (fib x) (letrec ((fib-iter (lambda (n f1 f2) (if (< n 1) f1 (fib-iter (- n 1) f2 (+ f1  f2))))))(fib-iter x 0 1)))

(define (number-sequence x) (let loop ((n 0)) (cons n (if (<= x n) '() (loop (+ n 1))))))

(define game-index (number-sequence 8))

(define (print-game) (display "|-+-+-|") (newline)(let loop ((i game-index)) (begin (display "|") (display (car i)) (display "|") (display (cadr i)) (display "|") (display (caddr i))(display "|")(newline)(display "|-+-+-|") (newline)(if (null? (cdddr i)) #f (loop (cdddr i))))))

(define (select-game-iter x) (let loop ((i game-index)) (cons (if (number? (car i)) (if (= (car i) x) mark (car i)) (car i)) (if (null? (cdr i)) '() (loop (cdr i))))))

(define (select-game x) (set! game-index (select-game-iter x)))

(define (print-index) (filter number? (let loop ((n 0)) (cons (let ((i (list-ref game-index n))) (if (string=? (if (number? i) "" i)  mark) n '())) (if (= n 8) '() (loop (+ n 1)))))))

(define start-text '("初めまして。\nああ、いや。\n私にとってはいつも初めましてなんですけど。" "どこかでお会いしましたかね？\n…どうでもいいんですけど。" "ようこそ、ようこそ。趣味の悪い監獄へ…嘘です。" "今日はとても良い日ですね。" "またですか？…ああいや、こっちの話です。" "飽きたら言ってください。\n新しい自分を発注しなきゃいけないので。\n…なんてね。" "どうぞ、ユーザー。\nここでは暇潰しが出来ますよ。\n人によってはですが。" "今夜は良い満月らしいですね。\nえ？月なんて見ない？\n…確かに。" "私が誰かって？\n正直なところ、ただのテキストとしか。\nえ、そういうことじゃない？そっかぁ。" "暇人ですか？\n私もです。" "この文章を全パターン見ようなんて\n思わないでくださいね？\nstart-textって打てば見れるんですから"))

(define (user-input) 
  (let ((msg (read (current-input-port)))) 
                       (if (symbol? msg) (symbol->string msg) 
                           (if (number? msg) (number->string msg) 
                               (begin (display "Error") (user-input))))))

(define blog "https://SCP-EEE.github.io/blog.html")

(define (help) (display "blog: ブログサイトのURIを出力します。するだけです。\n(fib n): フィボナッチ数列のn番目を計算してくれます。\n(tictactoe)： 良かったですね。○×ゲームで遊べますよ。さらに独り用です。(まだ開発中ですけど)\n(help)： これです。"))

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
