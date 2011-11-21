;;; Key-chord without modifier keys

(key-chord-mode 1)

(key-chord-define-global "jk" 'ace-jump-word-mode)
(key-chord-define-global "hj" 'ace-jump-char-mode)
(key-chord-define-global "kl" 'ace-jump-line-mode)
