;;; Diff

;; Side by side is the only way
(setq ediff-split-window-function 'split-window-horizontally)

;; Pretty colors for diff output.  Credit goes to Rob C.  There must be a better
;; way to do this instead of defface.
(defface diff-added '((t (:inherit diff-changed :background "#70FB67" :foreground "black"))) nil)
(defface diff-file-header '((((class color) (min-colors 88) (background dark)) (:background "#5686E2" :weight bold))) nil)
(defface diff-header '((((class color) (min-colors 88) (background dark)) (:background "#3469D0"))) nil)
(defface diff-hunk-header '((t (:inherit diff-header :background "#3469D0"))) nil)
(defface diff-index '((t (:inherit diff-file-header :background "#5686E2"))) nil)
(defface diff-removed '((t (:inherit diff-changed :background "#FF453C"))) nil)

