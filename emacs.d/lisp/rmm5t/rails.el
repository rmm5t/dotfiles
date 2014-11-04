;;; Rails

;; ;; Rinari
;; (add-to-list 'load-path (expand-file-name "~/.emacs.d/vendor/rinari"))
;; (require 'rinari)

;; (defalias 'rake 'rinari-rake)

;; ;; rhtml-mode
;; (add-to-list 'load-path (expand-file-name "~/.emacs.d/vendor/rhtml"))
;; (require 'rhtml-mode)
;; (add-hook 'rhtml-mode-hook
;;   (lambda () (rinari-launch)))

;; ;; Map .html.erb extension
;; (add-to-list 'auto-mode-alist '("\\.html\\.erb$"  . rhtml-mode))

;; ;; Rinari rhtml-mode color overrides
;; (set-face-background 'erb-face "gray9")
;; (set-face-background 'erb-delim-face "gray9")
;; (set-face-background 'erb-out-delim-face "gray9")

(add-to-list 'load-path (expand-file-name "~/.emacs.d/vendor/emacs-rails-reloaded"))
(require 'rails-autoload)