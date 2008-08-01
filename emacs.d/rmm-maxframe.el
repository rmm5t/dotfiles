;;; Frame size manipulation.

(defun mf ()
  (interactive)
  (set-frame-parameter nil 'fullscreen
                       (if (frame-parameter nil 'fullscreen) nil 'fullboth)))

(mf)
(global-set-key [(meta return)] 'mf)

;;   (set-frame-parameter nil 'fullscreen 'fullheight)
;;   (set-frame-parameter nil 'fullscreen 'fullwidth)
;;   (set-frame-parameter nil 'fullscreen nil)

;; ;; If on a Mac that supports it, go for it
;; (defun rmm-maxframe-mac ()
;;   (add-hook 'window-setup-hook 'mac-toggle-full-frame t)
;;   (global-set-key [(f15)] 'mac-toggle-full-frame)
;;   (defalias 'mf 'mac-toggle-full-frame))

;; (defun rmm-maxframe-generic ()
;;   (require 'maxframe)
;;   ;; Biggest monitor width I currently have.  This is necessary when multiple
;;   ;; monitors exist; otherwise, the frame will span multiple displays.
;;   (setq mf-max-width 1920)
;;   ;; Maximize on startup
;;   (add-hook 'window-setup-hook 'maximize-frame t)
;;   ;; Key bindings
;;   (global-set-key [(f14)] 'restore-frame)
;;   (global-set-key [(f15)] 'maximize-frame))

;; (if (fboundp 'mac-toggle-full-frame)
;;     (rmm-maxframe-mac)
;;   (rmm-maxframe-generic))

(provide 'rmm-maxframe)