;;; Markdown

(add-to-list 'auto-mode-alist '("\\.markdown$" . gfm-mode))
(add-to-list 'auto-mode-alist '("\\.md$" . gfm-mode))
(add-to-list 'auto-mode-alist '("\\.text$" . gfm-mode))

;; Original premise borrowed from https://gist.github.com/siancu/4542778
(defun marked-markdown-preview ()
  "run Marked on the current file if Marked is installed;
otherwise fallback to markdown-preview"
  (interactive)
  (or
   (dolist (app '("/Applications/Marked 2.app" "/Applications/Marked.app"))
     (when (file-exists-p app)
       (return (shell-command (concat "open -a " (shell-quote-argument app) " " (shell-quote-argument buffer-file-name))))))
   (markdown-preview)))

(eval-after-load 'markdown-mode
  '(progn
     (define-key markdown-mode-map (kbd "C-c C-v") 'marked-markdown-preview)))
