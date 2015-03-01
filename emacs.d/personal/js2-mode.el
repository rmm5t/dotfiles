;; js2-mode

(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

(setq js2-cleanup-whitespace t)
(setq js2-basic-offset 2)
(setq js2-bounce-indent-p t)

;; Special improvements using the mooz fork
;; https://github.com/mooz/js2-mode
(setq js2-consistent-level-indent-inner-bracket-p t)
(setq js2-use-ast-for-indentation-p t)
