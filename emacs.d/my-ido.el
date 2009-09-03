;;; Interactive do, find-file and iswitchb replacement with fuzzy/flex matching.

(ido-mode t)
(setq ido-enable-flex-matching t) ; fuzzy matching is a must have

;; This tab override shouldn't be necessary given ido's default
;; configuration, but minibuffer-complete otherwise dominates the
;; tab binding because of my custom tab-completion-everywhere
;; configuration.
(add-hook 'ido-setup-hook
          (lambda ()
            (define-key ido-completion-map (kbd "TAB") 'ido-complete)))

