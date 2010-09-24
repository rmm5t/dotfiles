;;; Pretty colors

(color-theme-initialize)
(vendor 'color-theme-ir-black)
(color-theme-ir-black)

;; (vendor 'color-theme-arjen)
;; (color-theme-arjen)

;; (color-theme-reset-faces)

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

;; Cursor and region color overrides after switching to Emacs 23 on OSX
;; (set-cursor-color "#014C88")
(set-cursor-color "#666666")
(blink-cursor-mode)
(set-face-foreground 'region "white")
(set-face-background 'region "slategray")
