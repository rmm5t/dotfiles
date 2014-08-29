;;; Frame size manipulation.

(defun rmm5t-init-fullscreen ()
  ;; (setq ns-auto-hide-menu-bar t)
  (setq ns-use-native-fullscreen nil)
  (toggle-frame-fullscreen)
  (global-set-key [(meta return)] 'toggle-frame-fullscreen))

(defun rmm5t-init-ns-fullscreen ()
  ;; (setq ns-auto-hide-menu-bar t)
  (setq ns-use-native-fullscreen nil)
  (ns-toggle-fullscreen)
  (global-set-key [(meta return)] 'ns-toggle-fullscreen))

(defun rmm5t-init-maxframe ()
  ;; Biggest monitor width I currently have.  This is necessary when multiple
  ;; monitors exist; otherwise, the frame will span multiple displays.
  (setq mf-max-width 2560)
  (add-hook 'window-setup-hook 'maximize-frame t)
  (global-set-key [(meta return)] 'mf))

(if (window-system)
    (cond
     ((fboundp 'toggle-frame-fullscreen)
      (rmm5t-init-fullscreen))
     ((fboundp 'ns-toggle-fullscreen)
      (rmm5t-init-ns-fullscreen))
     (t
      (rmm5t-init-maxframe))
     ))
