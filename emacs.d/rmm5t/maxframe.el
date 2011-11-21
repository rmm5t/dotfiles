;;; Frame size manipulation.

(defun rmm5t-init-ns-fullscreen ()
  (ns-toggle-fullscreen)
  (global-set-key [(meta return)] 'ns-toggle-fullscreen))

(defun rmm5t-init-maxframe ()
  ;; Biggest monitor width I currently have.  This is necessary when multiple
  ;; monitors exist; otherwise, the frame will span multiple displays.
  (setq mf-max-width 2560)
  (add-hook 'window-setup-hook 'maximize-frame t)
  (global-set-key [(meta return)] 'mf))

(if (and (window-system) (fboundp 'ns-toggle-fullscreen))
    (rmm5t-init-ns-fullscreen) (rmm5t-init-maxframe))
