(defun server-save-edit ()
  (interactive)
  (save-buffer)
  (server-edit)
  (kill-buffer))

(add-hook 'server-visit-hook
          (lambda ()
            (unless (equal major-mode 'git-commit-mode)
              (local-set-key [(control c) (control c)] 'server-save-edit))
            ))
