(add-hook 'ruby-mode-hook
          (lambda ()
            (local-set-key (kbd "C-;") 'ruby-toggle-hash-syntax)
            ))
