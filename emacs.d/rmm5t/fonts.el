;;; Fonts

(when (eq system-type 'darwin)
  ;; default Latin font (e.g. Consolas)
  ;; default font size (point * 10)
  (set-face-attribute 'default nil :family "Monaco" :height 120 :weight 'normal))

;; To change a font size globally:
;; (set-face-attribute 'default nil :height 360)
;; (set-face-attribute 'default nil :height 240)
;; (set-face-attribute 'default nil :height 160)
;; (set-face-attribute 'default nil :height 120)

;; To change the font size interactively per buffer:
;; Up:    C-x C-+, C-x C-=
;; Down:  C-x C--
;; Reset: C-x C-0
