(setq custom-file "~/.emacs.d/personal/custom.el")
(load custom-file 'noerror)

(load "~/.emacs.d/personal/defuns")

;; self managed
;; ------------------

(personal 'bindings)
(personal 'c)
(personal 'company-mode)
(personal 'diff)
(personal 'dired)
(personal 'disabled)
(personal 'flymake)
(personal 'fonts)
(personal 'global)
(personal 'grep)
;; (personal 'ido) ;; replaced by flx-ido
(personal 'javascript)
(personal 'kbd-macros)
(personal 'mac)
(personal 'org)
(personal 'private)
(personal 'recentf)
(personal 'rectangle)
(personal 'ri-emacs)
(personal 'ruby-mode)
(personal 'saveplace)
(personal 'scratch)
(personal 'server-mode)
(personal 'shell-mode)
(personal 'tabs)
(personal 'theme)
(personal 'utf-8)
(personal 'zoom)

;; elpa managed
;; ------------------
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;; (add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)
(when (not package-archive-contents) (package-refresh-contents))

(package 'add-node-modules-path)
(package 'ag)
(package 'alchemist)
(package 'browse-kill-ring)
(package 'bundler)
(package 'coffee-mode)
(package 'csv-mode)
(package 'dash-at-point)
(package 'dimmer)
(package 'direnv)
(package 'docker)
(package 'dockerfile-mode)
(package 'editorconfig)
(package 'exec-path-from-shell)
(package 'expand-region)
(package 'feature-mode)
(package 'flx-ido)
(package 'flx-isearch)
(package 'flycheck)
(package 'groovy-mode)
(package 'haml-mode)
(package 'htmlize)
(package 'js2-mode)
(package 'json-mode)
(package 'lua-mode)
(package 'magit)
(package 'forge)
(package 'markdown-mode)
(package 'maxframe)
(package 'motion-mode)
(package 'multiple-cursors)
(package 'nodejs-repl)
(package 'powerline)
(package 'prettier-js)
(package 'projectile)
(package 'projectile-rails)
(package 'rbenv)
(package 'rhtml-mode)
(package 'restclient)
(package 'ruby-hash-syntax)
(package 'sass-mode)
(package 'shell-pop)
(package 'textile-mode)
(package 'typescript-mode)
(package 'vue-mode)
(package 'wgrep-ag)
(package 'yaml-mode)
(package 'yasnippet)

;; submodule managed
;; ------------------
(add-to-list 'load-path "~/.emacs.d/vendor/")

;; (vendor 'ace-jump-mode) ;; unused
;; (vendor 'auctex)        ;; unused
(vendor 'feature-mode)
;; (vendor 'hl-line)       ;; unused
(vendor 'jekyll)
;; (vendor 'key-chord)     ;; unused
(vendor 'mode-line-bell)
(vendor 'rcodetools    'xmp)
(vendor 'insert-time   'insert-time 'insert-date 'insert-date-time 'insert-personal-time-stamp)
(vendor 'electric-align 'electric-align-mode)
