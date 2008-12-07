;;; Environment variables

(setq exec-path (cons "/opt/local/bin" exec-path))
(setenv "PATH" (concat "/opt/local/bin:" (getenv "PATH")))

(setenv "gems" "/opt/local/lib/ruby/gems/1.8/gems")

