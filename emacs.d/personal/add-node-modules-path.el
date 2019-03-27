(eval-after-load 'js-mode
  '(add-hook 'js-mode-hook #'add-node-modules-path))

(eval-after-load 'js2-mode
  '(add-hook 'js2-mode-hook #'add-node-modules-path))
