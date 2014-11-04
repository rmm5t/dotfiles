;;; Frame size manipulation.

(defun rmm5t-init-fullscreen ()
  ;; (setq ns-auto-hide-menu-bar t)
  (setq ns-use-native-fullscreen nil)
  (global-set-key [(meta return)] 'toggle-frame-fullscreen)
  (add-hook 'window-setup-hook 'toggle-frame-fullscreen t))

(defun rmm5t-init-ns-fullscreen ()
  ;; (setq ns-auto-hide-menu-bar t)
  (setq ns-use-native-fullscreen nil)
  (global-set-key [(meta return)] 'ns-toggle-fullscreen)
  (add-hook 'window-setup-hook 'ns-toggle-fullscreen t))

(defun rmm5t-init-maxframe ()
  ;; Biggest monitor width I currently have.  This is necessary when multiple
  ;; monitors exist; otherwise, the frame will span multiple displays.
  (setq mf-max-width 2560)
  (global-set-key [(meta return)] 'mf)
  (add-hook 'window-setup-hook 'maximize-frame t))

(if (window-system)
    (cond
     ((fboundp 'toggle-frame-fullscreen)
      (rmm5t-init-fullscreen))
     ((fboundp 'ns-toggle-fullscreen)
      (rmm5t-init-ns-fullscreen))
     (t
      (rmm5t-init-maxframe))
     ))
