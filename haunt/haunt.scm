(use-modules (haunt asset)
             (haunt builder blog)
             (haunt builder atom)
             (haunt builder assets)
             (haunt builder rss)
             (haunt reader)
             (haunt reader texinfo)
             (haunt site))

(site #:title "ようこそ"
      #:default-metadata
      '((author . "SCP-EEE")
        (email  . "scpeee@wail.ch"))
      #:readers (list texinfo-reader sxml-reader html-reader)
      #:builders (list (blog)
                       (atom-feed)
                       (atom-feeds-by-tag)
                       (rss-feed)
                       (static-directory "images")))
