;;; Shell-Pop is a utility which helps you pop up and pop out shell buffer
;;; window easily.

(setq shell-pop-shell-type  (quote ("ansi-term" "*ansi-term*" (lambda nil (ansi-term shell-pop-term-shell)))))
(setq shell-pop-shell  "/bin/bash")
(setq shell-pop-window-height  40)
(setq shell-pop-window-position "bottom")
(global-set-key [f7] 'shell-pop)
