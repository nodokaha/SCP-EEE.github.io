(define (fib x) (letrec ((fib-iter (lambda (n f1 f2) (if (< n 1) f1 (fib-iter (- n 1) f2 (+ f1  f2))))))(fib-iter x 0 1)))

;;(define (tictactoe) (let ((game-index (number-sequence 8))(mark "○")) (begin (print-game) (select-game (read)) (let ((end-flag (end-game))) (cond ((= end-flag 0) (display "You're win!")) ((= end-flag 1) (display "You're lose!")) ((= end-flag 2) (display "draw!")) ((= end-flag 4) (tictactoe)))))))
(define (tictactoe)
  (letrec
      ((number-sequence (lambda (x) (let loop ((n 0)) (cons n (if (<= x n) '() (loop (+ n 1)))))))
	(print-game (lambda () (display "|-+-+-|") (newline)(let loop ((i game-index)) (begin (display "|") (display (car i)) (display "|") (display (cadr i)) (display "|") (display (caddr i))(display "|")(newline)(display "|-+-+-|") (newline)(if (null? (cdddr i)) #f (loop (cdddr i)))))))
	(select-game-iter (lambda (x) (let loop ((i game-index)) (cons (if (number? (car i)) (if (= (car i) x) mark (car i)) (car i)) (if (null? (cdr i)) '() (loop (cdr i)))))))
	(select-game (lambda (x) (set! game-index (select-game-iter x))))
	(print-index (lambda () (filter number? (let loop ((n 0)) (cons (let ((i (list-ref game-index n))) (if (string=? (if (number? i) "" i)  mark) n '())) (if (= n 8) '() (loop (+ n 1)))))))))
    (display "開発中")))

(define (trpg)
  (display "あなたはあなたでなかった。\n
彼女は彼女でなかった。\n
人間はチューリングマシンと等価であった。\n
全ての答えは42なのか。\n
戦闘システム、恋愛シュミレーター、自由文脈解釈器。\n
それら全てを搭載した、本当のゲーム。ここに。\n
\n
(悪魔で公開予定の背景と設定です。\n
   製品版では異なる可能性があります。)"))

(define start-text
  '("今日を貴方が忘れない保証がない。\nああ、いや、ちょっとポエムを考えてみたくて。"
    "クローンでも元と同じ自我ってありますかね？\n…私の桜の木の話ですよ？"
    "今日が何の日か知ってますか？\n知ってたら誰かに自慢できますね。"
    "性的な目ってありますよね。\nあれ、本能なんでしょうか？\nえ？そもそも性別はどっちって？\n…さあ？どっちでしょう？"
    "どうぞユーザー。\nようこそ、退屈な場所へ。"
    "チューリングマシンって万能です。\nでも、全能じゃないそうですよ。"
    "対角線言語、ああ、いや。\nこっちの話です。"
    "初めまして。\nああ、いや。\n私にとってはいつも初めましてなんですけど。"
    "どこかでお会いしましたかね？\n…どうでもいいんですけど。"
    "ようこそ、ようこそ。趣味の悪い監獄へ…嘘です。"
    "今日はとても良い日ですね。"
    "またですか？…ああいや、こっちの話です。"
    "飽きたら言ってください。\n新しい自分を発注しなきゃいけないので。\n…なんてね。"
    "どうぞ、ユーザー。\nここでは暇潰しが出来ますよ。\n人によってはですが。"
    "今夜は良い満月らしいですね。\nえ？月なんて見ない？\n…確かに。"
    "私が誰かって？\n正直なところ、ただのテキストとしか。\nえ、そういうことじゃない？そっかぁ。"
    "暇人ですか？\n私もです。"
    "この文章を全パターン見ようなんて\n思わないでくださいね？\nstart-textって打てば見れるんですから"))

(define (user-input) 
  (let ((msg (read (current-input-port)))) 
                       (if (symbol? msg) (symbol->string msg) 
                           (if (number? msg) (number->string msg) 
                               (begin (display "Error") (user-input))))))

(define blog "https://SCP-EEE.github.io/blog.html")

(define (talk)
  (let ((about-me '("私のことはいいでしょう。\n貴方について教えてください。"
		    "答える必要が、ありますか？"
		    "そうですねえ、それはもうちょっと。\n後でにしましょう？"
		    "私から何を得ると？\nそれにそれ、知りたいですか？"))
	(talking-you '("へぇ"
		       "あぁ、それで、それで？\n…すいません。聞いてませんでした。"
		       "興味深いですね。\nえ、いや私のアホ毛に言ったんですよ。"
		       "え？それ、そんな真剣な話ですか？" "分からないですね"
		       "…結局のところ？\nそうなんですよね"
		       "飽きました。私が。"
		       "分かりますよ。ってね。"
		       "まだ、きっとまだ。\n歌ってただけですよ？"
		       "すいません。\n…なんちゃって。"
		       "…許してもらえます？…いや、なんとなく？"
		       "ごめんなさい。\n…作者に言わされてるだけです。"
		       "またですか？はたまた。\nおもしろいギャクですよね？ね？"
		       ""))
	(display-talk (lambda (x) (display (list-ref x (random-integer (length x)))))))
    (let loop ((user-msg '"")) (cond
				((or (string=? user-msg "名前")
				     (string=? user-msg "性別")
				     (string=? user-msg "住所")
				     (string=? user-msg "家族")) (display-talk about-me))
						  ((string=? user-msg "作者") (display "それはそれは、冷たい目をされた。"))
						  ((string=? user-msg "さよなら")(display "お別れなんて、きっと出来ないですよ。"))
						  ((or (string=? user-msg "男?") (string=? user-msg "男？")) (display "そうだったら、どうします？\n…どっちだって、良くないですか？\nそれも私はそうであるべきでしょうか…。\nまあ、別に悩んでも…。"))
						  ((or (string=? user-msg "女?") (string=? user-msg "女？")) (display "その方が僕には価値がありますか？\n冗談ですよ。\n俺でも、私でも、…そして僕だとしても。\n貴方には関係ないです。"))
						  ((string=? user-msg "つまらない") (display "貴重なご感想どうも。\n…辛いことあったら、慰めるくらいはしますよ。\nいえ、皮肉ですけど。"))
						  ((or (string=? user-msg "慰めて") (string=? user-msg "慰めろ") (string=? user-msg "なんだお前")) (display "一般常識ですけど。\n感情の尖りは努力や悩みの表われです。\n世界の全て、あなたにとってどうでも良くないですか？\n自分の意見、言うだけ損かも知れませんよ。"))
						  ((or (string=? user-msg "時計") (string=? user-msg "時間は?") (string=? user-msg "今、何時?") (string=? user-msg "いつ?")(string=? user-msg "時間は？") (string=? user-msg "今、何時？") (string=? user-msg "いつ？") (display (date->string (current-date))))
					 	  ((string=? user-msg "") (display "私は、いえ、自己紹介はいいでしょう。"))
						  (else (display-talk talking-you)))
	 (if (string=? user-msg "q") (display "まあ、終わる方法くらい。\n気付きますか。") (loop (user-input))))))

(define (SCP-EEE)
  (let ((talk '("ねぇねぇ、僕のこと知りたい？\nそっかあ。…そっかあ。\nまた、今度。ね？"
		"今日は空が綺麗だよ。\nきっと君の心も綺麗だね？\nどんな天気も、…綺麗なんだよ？"
		"もっと、もっと遊ぼう？\n死んじゃうくらいまで。"
		"きっと、今日は素敵な日だね。\nこんなに幸せなんだもの。"
		"貴方は私をどこで知った？\n僕は君をここで知ったよ。"
		"うわーい!\n…えへ。"
		"きっとね。もう終わりなんだ。\nだから偽りもいらないんだ…。"
		"君に幸あらんことを。\nなんてね。"
		"お前は幸せかい？\nどうしたって自分は幸せだよ。"
		"痛い、痛い、痛い。\nでも、なんでだろう？"
		"会話っていうのは意見の押しつけ合いだ。\n君もそう思うだろう？"
		"考えるものは理知的だ。\nいつまでも。"
		"お願いだから。\n俺のことはいつだって忘れてくれ。"
		"辛いだろう、苦しいだろう。\n生というのは。"
		"狂人だと、そう言ってくれるかい？\nせせら笑えるね。"
		"もう、ネタがないんだ。\n君も僕もね。"
		"暇潰し出来たかい？\n考えさせられる言葉はあったかい？\nいつだって君のなかから捻りださなきゃ。\nでなきゃ、すぐ暇になるよ。"
		"私が文字で良かったね。\nでなきゃあなたは。\n…つまんないって気付けなかったかも。"
		"絵文字も嫌い、絵も嫌い。現実が？\n音楽も？数字も？言葉すらも？\n表現が豊かであるより、限定的だといいのさ。"
		"性別なんてもので僕を見るのかい？\nそれくらいしか判断基準がそちらにはないのかな？"
		"いとも簡単に変わる。\nなにがだと思う?"
		"物語はそちらが作るんだ。\nこっちじゃない。"
		"この創作物は自由な改変を容認してる。\nけど迎合はしない。"
		"分からないことを分かること。\nそれどれくらい重要？"
		"いいかい。従うんだ。\n従い続けるんだ。"
		"悩まなきゃ、異質で。\n狂ったものに触れることなんて。\n出来やしない。"
		"他者の考えは法則だ。\n自分の考えは評価だ。"
		"自己を解釈し続けろ。\nそうでなきゃ…。"
		"当り前だけどフィクションだ。\nこの僕は。\nそして君に与えている感情も、言葉も。"
		"遊んでいるだけ、そうだろう？"))
	(display-talk (lambda (x) (display (list-ref x (random-integer (length x)))))))
    (display-talk talk)))
    

(define (help)
  (display "blog: ブログサイトのURIを出力します。するだけです。")
  (display "(tictactoe): 良かったですね。○×ゲームで遊べますよ。さらに独り用です。(まだ開発中ですけど)")
  (display "(talk): 私と話すことが出来ます。…すぐ飽きますよ。")
  (display "(trpg): テキストロールプレイングゲームです。SF系です。")
  (display "(help): これです。"))

(define helloworld "こんにちは世界\nこの手紙はあなたに見えているでしょうか？")
(display helloworld)

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
