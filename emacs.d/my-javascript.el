;;; Javscript is fun

;; Standard js-mode
(setq js-indent-level 2)

;; ;; Enhanced js2-mode
(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

(setq js2-basic-offset 2)
(setq js2-bounce-indent-p t)
