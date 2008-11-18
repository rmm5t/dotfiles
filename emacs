;;;; Ryan McGeary's emacs initialization (2001-2008)

;; Enable a backtrace when problems occur
;; (setq debug-on-error t)

;; Load paths
(add-to-list 'load-path (expand-file-name "~/.emacs.d"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/personal"))

;; Personal customizations
(require 'rmm-generic)
(require 'rmm-defuns)
(require 'rmm-env-vars)
(require 'rmm-disabled)
(require 'rmm-carbon-emacs)
(require 'rmm-fonts)
(require 'rmm-colors)

;(require 'rmm-iswitchb)
(require 'rmm-ido)
(require 'rmm-grep)
(require 'rmm-dired)
(require 'rmm-diff)
(require 'rmm-rectangle)
(require 'rmm-filladapt)
(require 'rmm-hl-line)

(require 'rmm-svn)
(require 'rmm-git)

(require 'rmm-flymake)
(require 'rmm-ruby)
(require 'rmm-rails)
(require 'rmm-haml)
(require 'rmm-javascript)
(require 'rmm-erlang)

(require 'rmm-snippets)
(require 'rmm-tabs)

(require 'rmm-csv)

(require 'rmm-maxframe)
(require 'rmm-zoom)
(require 'rmm-recentf)

(require 'rmm-utf-8)
(require 'rmm-global-keys)

(require 'rmm-twitter)
(require 'rmm-private)

;; Beginning of the el4r block:
;; RCtool generated this block automatically. DO NOT MODIFY this block!
; (add-to-list 'load-path "/opt/local/share/emacs/site-lisp")
; (require 'el4r)
; (el4r-boot)
;; End of the el4r block.
;; User-setting area is below this line.
