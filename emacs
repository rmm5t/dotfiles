;;;; Ryan McGeary's emacs initialization (2001-2008)

;; Enable a backtrace when problems occur
;; (setq debug-on-error t)

;; Load paths
(add-to-list 'load-path (expand-file-name "~/.emacs.d"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/vendor"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/personal"))

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)

;; Personal customizations
(load "my-generic")
(load "my-defuns")
(load "my-env-vars")
(load "my-disabled")
(load "my-carbon-emacs")
(load "my-fonts")
(load "my-colors")

;(load "my-iswitchb")
(load "my-ido")
(load "my-grep")
(load "my-dired")
(load "my-diff")
(load "my-rectangle")
(load "my-filladapt")
(load "my-hl-line")

(load "my-svn")
(load "my-git")

(load "my-flymake")
(load "my-ruby")
(load "my-rails")
(load "my-haml")
(load "my-javascript")
(load "my-erlang")

(load "my-tabs")
(load "my-snippets")

(load "my-csv")

(load "my-maxframe")
(load "my-zoom")
(load "my-recentf")

(load "my-utf-8")
(load "my-global-keys")

(load "my-twitter")
(load "my-private")

;; Beginning of the el4r block:
;; RCtool generated this block automatically. DO NOT MODIFY this block!
; (add-to-list 'load-path "/opt/local/share/emacs/site-lisp")
; (require 'el4r)
; (el4r-boot)
;; End of the el4r block.
;; User-setting area is below this line.
