;;; It's Magit! An Emacs mode for Git.

(add-hook
 'magit-mode-hook
 (lambda ()
   (setq yas/dont-activate t)
   ))

(eval-after-load 'magit
  '(progn
     (set-face-foreground 'magit-diff-add "green3")
     (set-face-foreground 'magit-diff-del "red3")
     (set-face-background 'magit-item-highlight "gray15")
     (define-key magit-mode-map (kbd "M-3") 'split-window-horizontally) ; was magit-show-level-3
     (define-key magit-mode-map (kbd "M-2") 'split-window-vertically)   ; was magit-show-level-2
     (define-key magit-mode-map (kbd "M-1") 'delete-other-windows)      ; was magit-show-level-1
     (defun magit-pull ()
       (interactive)
       (magit-run-git-async "pull" "--rebase" "-v"))
     ))
