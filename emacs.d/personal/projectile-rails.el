(projectile-rails-global-mode)

(setq projectile-rails-vanilla-command "bin/rails"
      projectile-rails-spring-command "bin/spring"
      projectile-rails-zeus-command "bin/zeus")

(define-key projectile-rails-mode-map (kbd "C-c r") 'projectile-rails-command-map)
