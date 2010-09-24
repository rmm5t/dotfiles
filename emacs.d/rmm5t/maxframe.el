;;; Frame size manipulation.

;; (defun mf ()
;;   (interactive)
;;   (set-frame-parameter nil 'fullscreen
;;                        (if (frame-parameter nil 'fullscreen) nil 'fullboth)))
;; (mf)
;; (global-set-key [(meta return)] 'mf)

(require 'maxframe)
;; Biggest monitor width I currently have.  This is necessary when multiple
;; monitors exist; otherwise, the frame will span multiple displays.
(setq mf-max-width 1920)
;; Maximize on startup
(add-hook 'window-setup-hook 'maximize-frame t)

;; Key bindings
(global-set-key [(meta return)] 'mf)

