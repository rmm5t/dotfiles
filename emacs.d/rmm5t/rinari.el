(global-rinari-mode)

(define-key rinari-minor-mode-map (kbd "C-c t") 'rinari-find-test)
(define-key rinari-minor-mode-map (kbd "C-c m") 'rinari-find-model)
(define-key rinari-minor-mode-map (kbd "C-c c") 'rinari-find-controller)
(define-key rinari-minor-mode-map (kbd "C-c v") 'rinari-find-view)
(define-key rinari-minor-mode-map (kbd "C-c i") 'rinari-find-migration)
(define-key rinari-minor-mode-map (kbd "C-c h") 'rinari-find-helper)
