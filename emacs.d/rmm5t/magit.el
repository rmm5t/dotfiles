;;; It's Magit! An Emacs mode for Git.

(add-hook
 'magit-mode-hook
 (lambda ()
   (setq yas-dont-activate t)))

(add-hook
 'magit-log-edit-mode-hook
 (lambda ()
   (setq fill-column 72)
   (turn-on-auto-fill)))

;; full screen magit-status
;; borrowed from http://whattheemacsd.com/setup-magit.el-01.html
(defadvice magit-status (around magit-fullscreen activate)
  (window-configuration-to-register :magit-fullscreen)
  ad-do-it
  (delete-other-windows))

(defun magit-quit-session ()
  "Restores the previous window configuration and kills the magit buffer"
  (interactive)
  (kill-buffer)
  (jump-to-register :magit-fullscreen))


(eval-after-load 'magit
  '(progn
     (set-face-background 'highlight nil) ;; highlight is overriding other background colors for diff chunks
     (set-face-foreground 'highlight nil) ;; highlight is overriding other foreground colors for diff chunks
     (set-face-underline  'highlight nil)
     (define-key magit-mode-map (kbd "M-3") 'split-window-horizontally) ; was magit-show-level-3
     (define-key magit-mode-map (kbd "M-2") 'split-window-vertically)   ; was magit-show-level-2
     (define-key magit-mode-map (kbd "M-1") 'delete-other-windows)      ; was magit-show-level-1
     (define-key magit-mode-map (kbd "<tab>") 'magit-toggle-section)    ; was smart-tab
     (define-key magit-status-mode-map (kbd "M-K") 'magit-quit-session)
     ))
