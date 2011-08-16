;;; Environment variables

(setq exec-path (cons "/usr/local/bin" exec-path))
(setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))
(setq exec-path (cons "~/.rbenv/bin" exec-path))
(setenv "PATH" (concat "~/.rbenv/bin:" (getenv "PATH")))
(setq exec-path (cons "~/.rbenv/shims" exec-path))
(setenv "PATH" (concat "~/.rbenv/shims:" (getenv "PATH")))
(setq exec-path (cons "/usr/texbin" exec-path))
(setenv "PATH" (concat "/usr/texbin:" (getenv "PATH")))
(setq exec-path (cons "/usr/local/share/npm/bin" exec-path))
(setenv "PATH" (concat "/usr/local/share/npm/bin:" (getenv "PATH")))
(setq exec-path (cons "/Applications/Emacs.app/Contents/MacOS/bin" exec-path))
(setenv "PATH" (concat "/Applications/Emacs.app/Contents/MacOS/bin:" (getenv "PATH")))

