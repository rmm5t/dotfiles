(add-to-list 'load-path "~/.emacs.d/lisp")
(setq custom-file "rmm5t/custom.el")
(load custom-file 'noerror)

;; self managed
;; ------------------
(load "rmm5t/defuns")

(personal 'bindings)
(personal 'c)
(personal 'diff)
(personal 'dired)
(personal 'disabled)
(personal 'env)
(personal 'flymake)
(personal 'fonts)
(personal 'global)
(personal 'grep)
(personal 'ido) ;; replaced by flx-ido
(personal 'iswitchb) ;; replaced by ido-switch-buffer
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

;; package.el managed
;; ------------------
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)
(when (not package-archive-contents) (package-refresh-contents))

(package 'ag)
(package 'browse-kill-ring+)
(package 'bundler)
(package 'coffee-mode)
(package 'csv-mode)
(package 'dired-details+)
(package 'dropdown-list)
(package 'expand-region)
(package 'feature-mode)
(package 'flx-ido)
(package 'flx-isearch)
(package 'haml-mode)
(package 'htmlize)
(package 'js2-mode)
(package 'lua-mode)
(package 'magit)
(package 'markdown-mode)
(package 'maxframe)
(package 'mo-git-blame)
(package 'multiple-cursors)
(package 'powerline)
(package 'projectile)
(package 'projectile-rails)
(package 'rbenv)
(package 'ruby-guard)
(package 'sass-mode)
(package 'shell-pop)
(package 'textile-mode)
(package 'yaml-mode)
(package 'yasnippet)

;; submodule managed
;; ------------------
(add-to-list 'load-path "~/.emacs.d/vendor")

;; (vendor 'ace-jump-mode) ;; unused
;; (vendor 'auctex)        ;; unused
(vendor 'feature-mode)
(vendor 'filladapt)
;; (vendor 'hl-line)       ;; unused
(vendor 'jekyll)
;; (vendor 'key-chord)     ;; unused
(vendor 'mode-line-bell)
(vendor 'rcodetools    'xmp)
(vendor 'revbufs       'revbufs)
