;;; Ruby

;; Run the current ruby buffer
(defun ruby-eval-buffer ()
   "Evaluate the buffer with ruby."
   (interactive)
   (shell-command-on-region (point-min) (point-max) "ruby"))

;; Local key bindings
(add-hook 'ruby-mode-hook
          (lambda ()
            (ruby-electric-mode)
            (local-set-key [(control meta f1)] 'xmp)
            (local-set-key [(control meta shift f1)] 'ruby-eval-buffer)
            ))

(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("autotest$" . ruby-mode))
(add-to-list 'auto-mode-alist '("irbrc$" . ruby-mode))
(add-to-list 'auto-mode-alist '("sake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("god$" . ruby-mode))



