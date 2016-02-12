(setq custom-file "~/.emacs.d/personal/custom.el")
(load custom-file 'noerror)

(load "~/.emacs.d/personal/defuns")

;; self managed
;; ------------------

(personal 'bindings)
(personal 'c)
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
(package 'exec-path-from-shell)
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
(package 'motion-mode)
(package 'multiple-cursors)
(package 'powerline)
(package 'projectile)
(package 'projectile-rails)
(package 'rbenv)
(package 'ruby-guard)
(package 'sass-mode)
(package 'shell-pop)
(package 'toggle-quotes)
(package 'textile-mode)
(package 'yaml-mode)
(package 'yasnippet)

;; submodule managed
;; ------------------
(add-to-list 'load-path "~/.emacs.d/vendor/")

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
(vendor 'insert-time   'insert-time 'insert-date 'insert-date-time 'insert-personal-time-stamp)
