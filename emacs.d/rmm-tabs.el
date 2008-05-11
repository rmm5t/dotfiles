;;; Tab management

;; Spaces instead of tabs
(setq-default indent-tabs-mode nil)

;; If there is a tab, make it the size of 2 spaces
(setq-default tab-width 2)

;; Mode specific indent sizes
;; TODO: Consider putting these in their own mode specific inits
(setq c-basic-offset 4)
(setq css-indent-offset 2)
(setq sh-basic-offset 2)
(set-default 'javascript-indent-level 2)

;; Tab completion everywhere (indent-and-complete comes from rails package)
(global-set-key [tab] 'indent-and-complete)
;; Revert minibuffer tab completion back to its default
(define-key minibuffer-local-map [tab] 'minibuffer-complete)

(provide 'rmm-tabs)