(require 'motion-mode)
;; following add-hook is very important.
(add-hook 'ruby-mode-hook 'motion-recognize-project)
;; (add-to-list 'ac-modes 'motion-mode)
;; (add-to-list 'ac-sources 'ac-source-dictionary)
;; set key-binds as you like
(define-key motion-mode-map (kbd "C-c C-c") 'motion-execute-rake)
(define-key motion-mode-map (kbd "C-c C-d") 'motion-dash-at-point)
