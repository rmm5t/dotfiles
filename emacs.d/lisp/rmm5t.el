(add-to-list 'load-path "~/.emacs.d/vendor")

(setq custom-file "~/.emacs.d/rmm5t/custom.el")
(load custom-file 'noerror)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ;; ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar packages '(ag
                   browse-kill-ring+
                   bundler
                   coffee-mode
                   csv-mode
                   dired-details+
                   dropdown-list
                   expand-region
                   feature-mode
                   flx-ido
                   flx-isearch
                   haml-mode
                   htmlize
                   js2-mode
                   lua-mode
                   magit
                   markdown-mode
                   maxframe
                   mo-git-blame
                   multiple-cursors
                   powerline
                   projectile
                   projectile-rails
                   rbenv
                   ruby-guard
                   sass-mode
                   shell-pop
                   textile-mode
                   yaml-mode
                   yasnippet)
  "Libraries that should be installed by default.")

(dolist (package packages)
  (when (not (package-installed-p package))
    (package-install package)))

;; self managed
;; ------------------
(load "rmm5t/bindings")
(load "rmm5t/c")
(load "rmm5t/defuns")
(load "rmm5t/diff")
(load "rmm5t/dired")
(load "rmm5t/disabled")
(load "rmm5t/env")
(load "rmm5t/flymake")
(load "rmm5t/fonts")
(load "rmm5t/global")
(load "rmm5t/grep")
;; (load "rmm5t/ido") ;; replaced by flx-ido
;; (load "rmm5t/iswitchb") ;; replaced by ido-switch-buffer
(load "rmm5t/javascript")
(load "rmm5t/kbd-macros")
(load "rmm5t/mac")
(load "rmm5t/org")
(load "rmm5t/private" 'noerror)
(load "rmm5t/recentf")
(load "rmm5t/rectangle")
(load "rmm5t/ri-emacs")
(load "rmm5t/ruby-mode")
(load "rmm5t/saveplace")
(load "rmm5t/scratch")
(load "rmm5t/server-mode")
(load "rmm5t/shell-mode")
(load "rmm5t/tabs")
(load "rmm5t/theme")
(load "rmm5t/utf-8")
(load "rmm5t/zoom")
;; (load "rmm5t/hl-line")
;; (load "rmm5t/iswitchb")

;; package.el managed
;; ------------------
(load "rmm5t/csv-mode")
(load "rmm5t/dired-details")
(load "rmm5t/expand-region")
(load "rmm5t/flx") ;; flx-ido
(load "rmm5t/htmlize")
(load "rmm5t/js2-mode")
(load "rmm5t/lua-mode")
(load "rmm5t/magit")
(load "rmm5t/markdown-mode")
(load "rmm5t/maxframe")
(load "rmm5t/multiple-cursors")
(load "rmm5t/powerline")
(load "rmm5t/projectile")
(load "rmm5t/rbenv")
(load "rmm5t/shell-pop")
(load "rmm5t/textile-mode")
(load "rmm5t/yaml-mode")
(load "rmm5t/yasnippet")

;; submodule managed
;; ------------------
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
