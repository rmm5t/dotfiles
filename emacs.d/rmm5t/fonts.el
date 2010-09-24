;;; Fonts

;; From: http://community.schemewiki.org/cgi-bin/scheme.cgi?Emacs
(and window-system
     (create-fontset-from-fontset-spec
      (concat
       "-apple-monaco-medium-r-normal--12-*-*-*-*-*-fontset-monaco,"
       "ascii:-apple-monaco-medium-r-normal--12-100-*-*-m-100-mac-roman"))
     )
