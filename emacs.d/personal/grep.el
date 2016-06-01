;;; Grep is wicked

;; Grep/Find.  This needs some cleanup
(setq grep-command "grep -Irine ")

(eval-after-load 'grep
  '(progn
     (add-to-list 'grep-find-ignored-files "*.log")
     (add-to-list 'grep-find-ignored-directories "log")
     (add-to-list 'grep-find-ignored-directories "vendor")
     (add-to-list 'grep-find-ignored-directories "build")
     ))
