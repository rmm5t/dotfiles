;;; Fonts

;; From: http://community.schemewiki.org/cgi-bin/scheme.cgi?Emacs
(and window-system
     (create-fontset-from-fontset-spec
      (concat
       "-apple-monaco-medium-r-normal--12-*-*-*-*-*-fontset-monaco,"
       "ascii:-apple-monaco-medium-r-normal--12-100-*-*-m-100-mac-roman,"
       "latin-iso8859-1:-apple-monaco-medium-r-normal--12-100-*-*-m-100-mac-roman"))
     (create-fontset-from-fontset-spec
      (concat
       "-apple-monaco-medium-r-normal--10-*-*-*-*-*-fontset-monaco,"
       "ascii:-apple-monaco-medium-r-normal--10-100-*-*-m-100-mac-roman,"
       "latin-iso8859-1:-apple-monaco-medium-r-normal--10-100-*-*-m-100-mac-roman"))
     (create-fontset-from-fontset-spec
      (concat
       "-apple-monaco-medium-r-normal--16-*-*-*-*-*-fontset-monaco,"
       "ascii:-apple-monaco-medium-r-normal--16-100-*-*-m-100-mac-roman,"
       "latin-iso8859-1:-apple-monaco-medium-r-normal--16-100-*-*-m-100-mac-roman"))
     (create-fontset-from-fontset-spec
      (concat
       "-apple-monaco-medium-r-normal--24-*-*-*-*-*-fontset-monaco,"
       "ascii:-apple-monaco-medium-r-normal--24-100-*-*-m-100-mac-roman,"
       "latin-iso8859-1:-apple-monaco-medium-r-normal--24-100-*-*-m-100-mac-roman"))
     (create-fontset-from-fontset-spec
      (concat
       "-apple-monaco-medium-r-normal--36-*-*-*-*-*-fontset-monaco,"
       "ascii:-apple-monaco-medium-r-normal--36-100-*-*-m-100-mac-roman,"
       "latin-iso8859-1:-apple-monaco-medium-r-normal--36-100-*-*-m-100-mac-roman"))
     )

;; (setq default-frame-alist '((font . "fontset-monaco")))

;; Disable italics
;; (set-face-italic-p 'font-lock-comment-face nil)

;; (set-face-font 'italic "-*-vt6x13-*-*-*-*-*-*-*-*-*-*-utf8")
;; (set-face-font 'bold-italic "-*-vt6x13-*-*-*-*-*-*-*-*-*-*-utf8")
;; (set-face-font 'bold "-*-vt6x13-*-*-*-*-*-*-*-*-*-*-utf8")
;; (set-default-font "-*-vt6x13-*-*-*-*-*-*-*-*-*-*-utf8")
;; (set-default-font "-*-monaco-*-*-*-*-*-*-*-*-*-*-utf8")

;; (setq w32-enable-italics t)
;; (set-default-font "-*-vt6x13-*-*-*-*-*-*-*-*-*-*-iso8859-1")
;; (set-default-font "-*-vt100-*-*-*-*-12-*-*-*-*-*-utf8")
