;;; Snippets make typing fun

(add-to-list 'load-path "~/.emacs.d/vendor/yasnippet")
(require 'yasnippet)
(yas/global-mode 1)

(yas/load-directory "~/.emacs.d/vendor/yasnippet/snippets")
;; (yas/load-directory "~/.emacs.d/vendor/yasnippet/extras/imported")
(yas/load-directory "~/.emacs.d/vendor/yasnippets-rails/rails-snippets")
(yas/load-directory "~/.emacs.d/vendor/yasnippets-shoulda")

(setq yas/prompt-functions '(yas/ido-prompt
                             yas/dropdown-prompt
                             yas/completing-prompt))

;; Hippie expand.  Groovy vans with tie-dyes.
(add-to-list 'hippie-expand-try-functions-list 'yas/hippie-try-expand)

;; Replace yasnippets's TAB
(add-hook 'yas/minor-mode-hook
          (lambda () (define-key yas/minor-mode-map
                       (kbd "TAB") 'indent-or-expand))) ; was yas/expand

