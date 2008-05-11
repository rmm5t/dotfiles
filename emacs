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
(require 'rmm-tabs)

(require 'rmm-iswitchb)
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

(require 'rmm-csv)

(require 'rmm-maxframe)
(require 'rmm-zoom)
(require 'rmm-pastie)

(require 'rmm-global-keys)
