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

(defun indent-or-expand (arg)
  "Either indent according to mode, or expand the word preceding
point."
  (interactive "*P")
  (if (and
       (or (bobp) (= ?w (char-syntax (char-before))))
       (or (eobp) (not (= ?w (char-syntax (char-after))))))
      (hippie-expand arg)
    (indent-according-to-mode)))

;; Hippie expand.  Groovy vans with tie-dyes.
(add-to-list 'hippie-expand-try-functions-list 'yas/hippie-try-expand)
(global-set-key (kbd "TAB") 'indent-or-expand)
;; Replace yasnippets's TAB
(add-hook 'yas/minor-mode-hook (lambda () (define-key yas/minor-mode-map (kbd "TAB") 'indent-or-expand))) ; was yas/expand

;; Revert minibuffer tab completion back to its default
(define-key minibuffer-local-map [tab] 'minibuffer-complete)

(provide 'rmm-tabs)