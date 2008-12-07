;;; Wicked templates

(require 'haml-mode)
(require 'sass-mode)

(add-to-list 'auto-mode-alist '("\\.haml$"  . haml-mode))
(add-to-list 'auto-mode-alist '("\\.sass$"  . sass-mode))
