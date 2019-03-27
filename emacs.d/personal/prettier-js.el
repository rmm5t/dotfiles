(require 'prettier-js)

(eval-after-load 'js-mode
  '(add-hook 'js-mode-hook #'prettier-js-mode))

(eval-after-load 'js2-mode
  '(add-hook 'js2-mode-hook #'prettier-js-mode))
