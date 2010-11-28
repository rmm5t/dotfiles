;;; cdargs support

(defun cdargs-find-file ()
  (interactive)
  (cdargs)
  (ido-find-file))

(global-set-key [(control x)(f)] 'cdargs-find-file)  ; was set-fill-column
