;;; Pretty colors

(add-to-list 'load-path (expand-file-name "~/.emacs.d/vendor/color-theme"))
(require 'color-theme)
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-hober)))

(load-file "~/.emacs.d/vendor/color-theme-arjen/color-theme-arjen.el")
(require 'color-theme-arjen)

;; (color-theme-reset-faces)

;; My current favorite color-theme
(color-theme-arjen)

;; Color-schemes that I thought were pleasing to the eye.  Most others are
;; pretty ugly.

;; Dark Backgrounds
;; (color-theme-classic)
;; (color-theme-dark-laptop)
;; (color-theme-clarity)
;; (color-theme-goldenrod)
;; (color-theme-billw)
;; (color-theme-gnome2)

;; Light Backgrounds
;; (color-theme-sitaramv-nt)
;; (color-theme-pierson)
;; (color-theme-rotor)
;; (color-theme-emacs-21)
;; (color-theme-gtk-ide)

