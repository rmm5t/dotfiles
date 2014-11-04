;;; Shell scripts

(add-to-list 'auto-mode-alist '("bashrc$" . sh-mode))
(add-to-list 'auto-mode-alist '("bash_profile$" . sh-mode))
(add-to-list 'auto-mode-alist '("bash_aliases$" . sh-mode))
(add-to-list 'auto-mode-alist '("bash_local$" . sh-mode))
(add-to-list 'auto-mode-alist '("bash_completion$" . sh-mode))
(add-to-list 'auto-mode-alist '(".powenv$" . sh-mode))

(add-hook 'shell-mode-hook (lambda () (setq tab-width 8)))
