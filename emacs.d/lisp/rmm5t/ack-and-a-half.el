;;; ack > grep

(defun ack-default-directory (pattern &optional regexp directory)
  (interactive (ack-and-a-half-interactive))
  (ack-and-a-half-run default-directory regexp pattern))

;; Create shorter aliases
(defalias 'ack 'ack-and-a-half)
(defalias 'ack-same 'ack-and-a-half-same)
(defalias 'ack-find-file 'ack-and-a-half-find-file)
(defalias 'ack-find-same-file 'ack-and-a-half-find-file-same)
