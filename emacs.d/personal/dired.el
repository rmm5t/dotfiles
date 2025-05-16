;;; Dired

;; Use gnu ls instead (macos requires `brew install coreutils`)
(setq insert-directory-program "gls")
(setq dired-listing-switches "-ah --dired --group-directories-first --time-style=long-iso")

;; Allows recursive deletes
(setq dired-recursive-deletes 'top)

;; Borrowed from http://whattheemacsd.com/setup-dired.el-02.html
(defun dired-back-to-top ()
  (interactive)
  (beginning-of-buffer)
  (dired-next-line 4))

(defun dired-jump-to-bottom ()
  (interactive)
  (end-of-buffer)
  (dired-next-line -1))

(add-hook 'dired-mode-hook
          (lambda ()
            (define-key dired-mode-map
              (vector 'remap 'beginning-of-buffer) 'dired-back-to-top)
            (define-key dired-mode-map
              (vector 'remap 'end-of-buffer) 'dired-jump-to-bottom)
            ))
