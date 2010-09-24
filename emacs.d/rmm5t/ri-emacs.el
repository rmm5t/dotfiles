(add-to-list 'load-path (expand-file-name "~/.emacs.d/vendor/ri-emacs"))
(setq ri-ruby-script (expand-file-name "~/.emacs.d/vendor/ri-emacs/ri-emacs.rb"))
(autoload 'ri "ri-ruby" nil t)

(add-hook 'ruby-mode-hook
          (lambda ()
            (local-set-key [(f1)] 'ri)
;;             (local-set-key "\M-\C-i" 'ri-ruby-complete-symbol)
            (local-set-key [(meta f1)] 'ri-ruby-show-args)
            ))
