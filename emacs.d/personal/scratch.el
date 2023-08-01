;; Scratch buffer goodness
;; https://emacs.stackexchange.com/a/74/10738

(defun prepare-scratch-for-kill ()
  (save-excursion
    (set-buffer (get-buffer-create "*scratch*"))
    (add-hook 'kill-buffer-query-functions 'kill-scratch-buffer t)))

(defun kill-scratch-buffer ()
  (let (kill-buffer-query-functions)
    (kill-buffer (current-buffer)))
  ;; no way, *scratch* shall live
  (prepare-scratch-for-kill)
  ;; Since we "killed" it, don't let caller try too
  nil)

(prepare-scratch-for-kill)
