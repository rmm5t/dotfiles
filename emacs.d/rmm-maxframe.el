;;; Frame size manipulation.

(require 'maxframe)

;; Biggest monitor width I currently have.  This is necessary when multiple
;; monitors exist; otherwise, the frame will span multiple displays.
(setq mf-max-width 1920)

;; Maximize on startup
(add-hook 'window-setup-hook 'maximize-frame t)

;; Key bindings
(global-set-key [(f14)] 'restore-frame)
(global-set-key [(f15)] 'maximize-frame)

(provide 'rmm-maxframe)