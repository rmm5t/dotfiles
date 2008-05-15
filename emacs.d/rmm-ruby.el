;;; Ruby

(require 'rcodetools)

;; Run the current ruby buffer
(defun ruby-eval-buffer ()
   "Evaluate the buffer with ruby."
   (interactive)
   (shell-command-on-region (point-min) (point-max) "/opt/local/bin/ruby"))

;; Local key bindings
(add-hook 'ruby-mode-hook
          (lambda ()
            (local-set-key [(control f1)]      'ruby-eval-buffer)
            (local-set-key [(control meta f1)] 'xmp)
            ))

(add-to-list 'auto-mode-alist '("autotest$" . ruby-mode))
(add-to-list 'auto-mode-alist '("sake$" . ruby-mode))

(add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp/ri-emacs"))
(setq ri-ruby-script (expand-file-name "~/.emacs.d/lisp/ri-emacs/ri-emacs.rb"))
(autoload 'ri "ri-ruby" nil t)
(add-hook 'ruby-mode-hook
          (lambda ()
            (local-set-key [(f1)] 'ri)
;;             (local-set-key "\M-\C-i" 'ri-ruby-complete-symbol)
            (local-set-key [(meta f1)] 'ri-ruby-show-args)
            ))

(provide 'rmm-ruby)