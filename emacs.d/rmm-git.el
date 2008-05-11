;;; Git

(add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp/git"))

;; git-status
(require 'git)

;; Add the VC backend
(add-to-list 'vc-handled-backends 'GIT)

;; If you need to blame somebody
(autoload 'git-blame-mode "git-blame"
  "Minor mode for incremental blame for Git." t)

(provide 'rmm-git)
