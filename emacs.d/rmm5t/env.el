;;; Environment variables

(setq exec-path (cons "/usr/local/bin" exec-path))
(setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))
(setq exec-path (cons "/usr/texbin" exec-path))
(setenv "PATH" (concat "/usr/texbin:" (getenv "PATH")))
(setq exec-path (cons "/usr/local/share/npm/bin" exec-path))
(setenv "PATH" (concat "/usr/local/share/npm/bin:" (getenv "PATH")))

