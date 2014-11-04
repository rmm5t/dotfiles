;;; Rectangles

;; Compliment to kill-rectangle (just like kill-ring-save compliments
;; kill-region)
;; http://www.emacsblog.org/2007/03/17/quick-tip-set-goal-column/#comment-183
(defun kill-save-rectangle (start end &optional fill)
  "Save the rectangle as if killed, but don't kill it.  See
`kill-rectangle' for more information."
  (interactive "r\nP")
  (kill-rectangle start end fill)
  (goto-char start)
  (yank-rectangle))

;; Give it a memorable key binding
(global-set-key (kbd "C-x r M-k") 'kill-save-rectangle)
