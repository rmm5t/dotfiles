;;; Git

(add-to-list 'load-path (expand-file-name "~/.emacs.d/vendor/git"))

;; git-status
(autoload 'git-status "git" nil t)

;; Add the VC backend
(add-to-list 'vc-handled-backends 'GIT)

;; If you need to blame somebody
(autoload 'git-blame-mode "git-blame"
  "Minor mode for incremental blame for Git." t)

;; Override git's ediff feature.  The default puts the buffers in the wrong
;; order.
;; TODO: Cleanup the temporary "HEAD" buffer after quiting ediff
(defun git-diff-file-idiff ()
  "Perform an interactive diff on the current file."
  (interactive)
  (let ((files (git-marked-files-state 'added 'deleted 'modified)))
    (unless (eq 1 (length files))
      (error "Cannot perform an interactive diff on multiple files."))
    (let* ((filename (car (git-get-filenames files)))
           (buff1 (find-file-noselect filename))
           (buff2 (git-run-command-buffer (concat filename ".~HEAD~") "cat-file" "blob" (concat "HEAD:" filename))))
      (ediff-buffers buff2 buff1))))

