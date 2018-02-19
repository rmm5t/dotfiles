;;; Snippets make typing fun

(yas-global-mode 1)

;; (yas-load-directory "~/.emacs.d/vendor/yasnippet/snippets")
;; (yas-load-directory "~/.emacs.d/vendor/yasnippets-rails/rails-snippets")
;; (yas-load-directory "~/.emacs.d/vendor/yasnippets-shoulda")

(setq yas-prompt-functions '(yas-ido-prompt
                             yas-completing-prompt))

;; (add-hook 'yas-minor-mode-hook
;;           (lambda () (define-key yas-minor-mode-map
;;                        (kbd "TAB") 'smart-tab))) ; was yas-expand
