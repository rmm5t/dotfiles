;;; ack > grep

(defun ack-default-directory (pattern &optional regexp directory)
  (interactive (ack-interactive))
  (ack pattern regexp default-directory))
