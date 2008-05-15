;;; Rails

;; Emacs Rails
(add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp/emacs-rails"))
(require 'rails)

;; Rinari
(add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp/rinari/rhtml"))
(require 'rhtml-mode)

;; Rinari rhtml-mode color overrides
(set-face-background 'erb-face "gray6")
(set-face-background 'erb-delim-face "gray6")

;; Map .html.erb extension
(add-to-list 'auto-mode-alist '("\\.html\\.erb$"  . rhtml-mode))

;; Deletes the tasks cache file.
(defun rails-rake:delete-task-cache()
  "Deletes the tasks cache file."
  (interactive
   (rails-project:in-root
   (let* ((cache-file (rails-core:file "tmp/.tasks-cache")))
     (if (file-exists-p cache-file)
         (delete-file cache-file)
       )))))

;;  (require 'iswitchb-fc)
;;  (defun rails-add-proj-to-file-cache (dir)
;;   "Adds all the ruby and rhtml files recursively in the current directory to the file-cache"
;;   (interactive "DAdd directory: ")
;;     (file-cache-clear-cache)
;;     (file-cache-add-file-list    (find-lisp-find-files (concat dir "/app") ".*"))stat
;; ;;     (file-cache-delete-file-list (find-lisp-find-files (concat dir "/app") "\\.svn"))
;;     (file-cache-add-file-list    (find-lisp-find-files (concat dir "/config")))
;; ;;     (file-cache-delete-file-list (find-lisp-find-files (concat dir "/config") "\\.svn"))
;;     (file-cache-add-file-list    (find-lisp-find-files (concat dir "/db")))
;; ;;     (file-cache-delete-file-list (find-lisp-find-files (concat dir "/db") "\\.svn"))
;;     (file-cache-add-file-list    (find-lisp-find-files (concat dir "/lib")))
;; ;;     (file-cache-delete-file-list (find-lisp-find-files (concat dir "/lib") "\\.svn"))
;;     (file-cache-add-file-list    (find-lisp-find-files (concat dir "/public")))
;; ;;     (file-cache-delete-file-list (find-lisp-find-files (concat dir "/public") "\\.svn"))
;;     (file-cache-add-file-list    (find-lisp-find-files (concat dir "/test")))
;; ;;     (file-cache-delete-file-list (find-lisp-find-files (concat dir "/test") "\\.svn"))
;;     (file-cache-delete-file-regexp "\\.svn")
;; )

;; (setq dir "/Users/rmcgeary/work/retirehq")
;; (find-lisp-find-files dir "\\.svn")

(provide 'rmm-rails)