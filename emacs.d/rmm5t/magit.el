;;; It's Magit! An Emacs mode for Git.

(add-hook
 'magit-mode-hook
 (lambda ()
   (setq yas/dont-activate t)
   ))

(eval-after-load 'magit
  '(progn
     (set-face-background 'highlight nil) ;; highlight is overriding other background colors for diff chunks
     (set-face-foreground 'highlight nil) ;; highlight is overriding other foreground colors for diff chunks
     (set-face-underline  'highlight nil)
     (define-key magit-mode-map (kbd "M-3") 'split-window-horizontally) ; was magit-show-level-3
     (define-key magit-mode-map (kbd "M-2") 'split-window-vertically)   ; was magit-show-level-2
     (define-key magit-mode-map (kbd "M-1") 'delete-other-windows)      ; was magit-show-level-1
     (define-key magit-mode-map (kbd "<tab>") 'magit-toggle-section)    ; was smart-tab
     (defun magit-pull ()
       (interactive)
       (magit-run-git-async "pull" "--rebase" "-v"))
     ))
