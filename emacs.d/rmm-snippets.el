;;; Snippets make typing fun

(add-to-list 'load-path "~/.emacs.d/lisp/yasnippet")
(require 'yasnippet)
(yas/initialize)

(yas/load-directory "~/.emacs.d/lisp/yasnippet/snippets")
(yas/load-directory "~/.emacs.d/lisp/yasnippets-rails/rails-snippets")

(provide 'rmm-snippets)