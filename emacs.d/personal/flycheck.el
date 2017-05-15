;;; http://www.flycheck.org/manual/latest/index.html
(require 'flycheck)

;; disable lisp checkdoc
(with-eval-after-load 'flycheck
  (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc)))

;; turn on flychecking globally
(add-hook 'after-init-hook #'global-flycheck-mode)

;; disable jshint since we prefer eslint checking
(setq-default flycheck-disabled-checkers
  (append flycheck-disabled-checkers
    '(javascript-jshint)))

;; use eslint with web-mode
;; (flycheck-add-mode 'javascript-eslint 'web-mode)

;; customize flycheck temp file prefix
(setq-default flycheck-temp-prefix ".flycheck")

;; disable json-jsonlist checking for json files
(setq-default flycheck-disabled-checkers
  (append flycheck-disabled-checkers
    '(json-jsonlist)))

;; ;; https://github.com/purcell/exec-path-from-shell
;; ;; only need exec-path-from-shell on OSX
;; ;; this hopefully sets up path and other vars better
;; (when (memq window-system '(mac ns))
;;   (exec-path-from-shell-initialize))

;; use local eslint from node_modules before global
;; http://emacs.stackexchange.com/questions/21205/flycheck-with-file-relative-eslint-executable
(defun my/use-eslint-from-node-modules ()
  (let* ((root (locate-dominating-file
                (or (buffer-file-name) default-directory)
                "node_modules"))
         (eslint (and root
                      (expand-file-name "node_modules/eslint/bin/eslint.js"
                                        root))))
    (when (and eslint (file-executable-p eslint))
      (setq-local flycheck-javascript-eslint-executable eslint))))
(add-hook 'flycheck-mode-hook #'my/use-eslint-from-node-modules)

;; Disable some js2-mode features when flycheck is enabled
(add-hook 'flycheck-mode-hook (lambda () (setq-local js2-strict-missing-semi-warning nil)))


(set-face-attribute 'flycheck-error nil
                    :underline "orange"
                    :background "firebrick4")
(set-face-attribute 'flycheck-warning nil
                    :underline "DarkOrange"
                    :background "yellow")
(set-face-attribute 'flycheck-info nil
                    :underline "forest green")
