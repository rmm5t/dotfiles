;;; Fast switching between buffers using substrings

(iswitchb-mode 1)

;; Common ignores
(add-to-list 'iswitchb-buffer-ignore "^ ")
(add-to-list 'iswitchb-buffer-ignore "*ECB")
(add-to-list 'iswitchb-buffer-ignore "*Messages")
(add-to-list 'iswitchb-buffer-ignore "*Buffer")
(add-to-list 'iswitchb-buffer-ignore "*Completions")
(add-to-list 'iswitchb-buffer-ignore "*ftp ")
(add-to-list 'iswitchb-buffer-ignore "*bsh")
(add-to-list 'iswitchb-buffer-ignore "*jde-log") ; TODO: put this in my-jde
(add-to-list 'iswitchb-buffer-ignore "^[tT][aA][gG][sS]$")
(add-to-list 'iswitchb-buffer-ignore "*ediff")
(add-to-list 'iswitchb-buffer-ignore "*vc#")
(add-to-list 'iswitchb-buffer-ignore "*cvs-commit*")

;; Case sensitivity
;; (setq iswitchb-case nil) ; nil for case sensitive

