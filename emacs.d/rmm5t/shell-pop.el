;;; Shell-Pop is a utility which helps you pop up and pop out shell buffer
;;; window easily.

(shell-pop-set-internal-mode "shell")    ; shell, ansi-term, terminal, eshell
(shell-pop-set-internal-mode-shell "/bin/bash")
(shell-pop-set-window-height 40)         ; the number as a percentage
(shell-pop-set-window-position "bottom") ; pop-up position. (top or bottom)
(global-set-key [f7] 'shell-pop)
