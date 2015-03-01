;;; It's Magit! An Emacs mode for Git.

(add-to-list 'load-path "~/.emacs.d/vendor/git-modes")

(add-hook
 'magit-mode-hook
 (lambda ()
   (setq yas-dont-activate t)))

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

;; Allow ignoring of whitespace
;; borrowed from http://whattheemacsd.com/setup-magit.el-02.html
(defun magit-toggle-whitespace ()
  (interactive)
  (if (member "-w" magit-diff-options)
      (magit-dont-ignore-whitespace)
    (magit-ignore-whitespace)))

(defun magit-ignore-whitespace ()
  (interactive)
  (add-to-list 'magit-diff-options "-w")
  (magit-refresh))

(defun magit-dont-ignore-whitespace ()
  (interactive)
  (setq magit-diff-options (remove "-w" magit-diff-options))
  (magit-refresh))

(eval-after-load 'magit
  '(progn
     (set-face-background 'magit-item-highlight "#3f4747")
     (set-face-foreground 'magit-item-highlight nil)
     (set-face-underline  'magit-item-highlight nil)
     (define-key magit-mode-map (kbd "M-3") 'split-window-horizontally) ; was magit-show-level-3
     (define-key magit-mode-map (kbd "M-2") 'split-window-vertically)   ; was magit-show-level-2
     (define-key magit-mode-map (kbd "M-1") 'delete-other-windows)      ; was magit-show-level-1
     (define-key magit-mode-map (kbd "<tab>") 'magit-toggle-section)    ; was smart-tab
     (define-key magit-status-mode-map (kbd "M-K") 'magit-quit-session)
     (define-key magit-status-mode-map (kbd "W") 'magit-toggle-whitespace)
     ))
