;;; Rails

;; Rinari
(add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp/rinari"))
(require 'rinari)

;; rhtml-mode
(add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp/rhtml"))
(require 'rhtml-mode)
(add-hook 'rhtml-mode-hook
  (lambda () (rinari-launch)))

;; Map .html.erb extension
(add-to-list 'auto-mode-alist '("\\.html\\.erb$"  . rhtml-mode))

;; Rinari rhtml-mode color overrides
(set-face-background 'erb-face "gray9")
(set-face-background 'erb-delim-face "gray9")
(set-face-background 'erb-out-delim-face "gray9")

(provide 'rmm-rails)