;;; Custom folding support

(defun zoom-way-out() (interactive)
  (set-selective-display 0))
(defun zoom-way-in() (interactive)
  (set-selective-display 4))
(defun zoom-out() (interactive)
  (set-selective-display
     (if selective-display
        (if (or (= selective-display 0) (>= selective-display 20))
        0
     (+ selective-display 2))
     0)))
(defun zoom-in() (interactive)
  (set-selective-display
     (if selective-display
        (if (= selective-display 0)
           20
           (if (<= selective-display 4)
              4
              (- selective-display 2)))
        20)))

(global-set-key [(meta \))] 'zoom-way-out)
(global-set-key [(meta _)] 'zoom-in)
(global-set-key [(meta +)] 'zoom-out)
