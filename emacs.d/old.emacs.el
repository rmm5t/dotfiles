;;============================================================
;; Set the debug option to enable a backtrace when a
;; problem occurs.
;;============================================================
;(setq debug-on-error t)
(setq debug-on-error nil)
(setq user-mail-address "ryan@example.com")

(setq change-log-default-name "CHANGELOG")

;(setq mac-allow-anti-aliasing t)
;(setq mac-allow-anti-aliasing nil)

;(mac-key-mode)

;(setq inhibit-startup-message t)

;(mac-hide-menu-bar)
;(mac-show-menu-bar)

;; hide the tool bar on Carbon Emacs
(tool-bar-mode 0)

;; slow down the mouse wheel acceleration
(setq mouse-wheel-scroll-amount '(0.01))

(setq visible-bell t)

(setq dired-recursive-deletes 'top)

(server-start)

;;============================================================
;; Update the Emacs load-path to include the path to
;; the JDE and its require packages. This code assumes
;; that you have installed the packages in the .emacs.d/lisp
;; subdirectory of your home directory.
;;============================================================
(add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp/jde-2.3.5.1/lisp"))

;(setq semantic-load-turn-useful-things-on nil)
;(setq semantic-load-turn-useful-things-on t)
(load-file "~/.emacs.d/lisp/cedet-1.0pre3/common/cedet.el")

;(add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp/elib"))

;;============================================================
;; other load-paths
;;============================================================
(add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp-personal"))
;; (add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp/csharp"))
;; (add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp/gnuserv"))
;; (add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp/tramp-2.1.0/lisp"))
;; (add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp/ruby"))
;; (add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp/mmm-mode-0.4.8"))
;; (add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp/psgml-1.2.5"))

(require 'maxframe)
(setq mf-max-width 1920)
(add-hook 'window-setup-hook 'maximize-frame t)

;;============================================================
;; requires
;;============================================================
;(require 'ido)
;(require 'cua)
(require 'insert-time)
(require 'bm)
(require 'filladapt)
(require 'sqlplus-mode)
(require 'plsql)
(require 'eol-conversion)
(require 'fm)
(require 'vtl)
(require 'color-theme)
(require 'swbuff)
(require 'psvn)
;(require 'ruby-mode)
;(require 'ruby-electric)
(require 'javascript-mode)
(require 'php-mode)
(require 'mmm-mode)
;(require 'nxml-mode)
;(require 'gnuserv)
;(require 'html-helper-mode) ; Even though we no longer modify the syntax table.
;(require 'htmlize)
;(require 'recentf)
;(require 'tramp)
;(require 'html-script)
;(require 'ecmascript-mode)
;(require 'ecb)
;(require 'csde)
;(require 'find-recursive)
;(require 'globalff)
;(require 'gse-locate)
;(require 'grep-edit)
;(require 'globrep)
(require 'fmode)
(require 'haml-mode nil 't)
(require 'zenburn)

(load "nxml/autostart.el")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Ruby on Rails
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(autoload 'run-ruby "inf-ruby"
  "Run an inferior Ruby process")
(autoload 'inf-ruby-keys "inf-ruby"
  "Set local key defs for inf-ruby in ruby-mode")
(add-hook 'ruby-mode-hook
      '(lambda ()
         (inf-ruby-keys)
))

(defun try-complete-abbrev (old)
  (if (expand-abbrev) t nil))

(require 'rails)
(require 'autotest)
(require 'rcodetools)
(setq auto-mode-alist  (cons '("\\.html\\.erb$"  . html-mode) auto-mode-alist))

(defun rails-rake:delete-task-cache()
  "Deletes the tasks cache file."
  (interactive
   (rails-project:in-root
   (let* ((cache-file (rails-core:file "tmp/.tasks-cache")))
     (if (file-exists-p cache-file)
         (delete-file cache-file)
       )))))

(setq sgml-set-face t)
(setq sgml-auto-activate-dtd t)
(setq sgml-indent-data t)

;(setq tramp-default-method "sshx")

(setq tail-hide-delay 10)
(setq tail-max-size 10)
(setq tail-volatile nil)
(setq tail-raise t)

;; required for nxml validation
;(load "rng-auto")

;(recentf-mode 1)

(autoload 'csharp-mode "csharp-mode"
  "Major mode for editing C# code." t)

(autoload 'css-mode "css-mode")
(setq css-indent-offset 2)


(setq sh-basic-offset 2)

;; One useful way to enable this minor mode is to put the following in your
;; .emacs:
;;
;;      (autoload 'turn-on-vtl-mode "vtl" nil t)
;;      (add-hook 'html-mode-hook 'turn-on-vtl-mode t t)
;;      (add-hook 'xml-mode-hook 'turn-on-vtl-mode t t)
;;      (add-hook 'text-mode-hook 'turn-on-vtl-mode t t)

;;============================================================
;; some basic custom settings
;;============================================================
(toggle-scroll-bar -1)
(fset 'yes-or-no-p 'y-or-n-p)
;(resize-minibuffer-mode)

;(setq svn-status-verbose t)
(setq svn-status-verbose nil)
;(setq svn-status-hide-unmodified nil)
(setq svn-status-hide-unmodified t)
(set-default 'fill-column 80)
(setq line-number-mode    t)
(setq column-number-mode  t)
(show-paren-mode          t)
(setq transient-mark-mode t)
(setq truncate-lines nil)
;;(setq truncate-lines t)
(setq truncate-partial-width-windows nil)
;;(setq truncate-partial-width-windows t)
(setq grep-command "grep -Irine ")
(setq grep-find-command
      (format "%s . -type f \\( -name '*~' -o -name '*#' -o -name '*.log' -o -path '*CVS/*' -o -path '*.svn/*' -o -path '*vendor/rails/*' -o -path '*build/*' -prune -o -print0 \\) | xargs -0 %s"
              find-program grep-command))

;WINDOWS-ONLY;;(setq ange-ftp-ftp-program-name "c:/WINDOWS/system32/ftp")

(setq plsql-indent 2)

(setq archive-zip-use-pkzip nil)

;WINDOWS-ONLY;;(setq compile-command "cd c:/work/femaweb/build; ant -emacs -quiet war_caps -Dbuild.prefix=mw-internal")
;WINDOWS-ONLY;;(setq compile-command "cd c:/work/femaweb/build; ant -emacs -quiet war_caps; cd C:/Tomcat/webapps/caps; jar xvf c:/work/_build_staging/wars/caps.war")

;WINDOWS-ONLY;;(setq compile-command "export JAVA_HOME=c:/jdk1.5.0_01; cd c:/work/gigviz; ant -emacs -quiet compile")

;WINDOWS-ONLY;;(setq compile-command "cd c:/work/nimcast; ant -emacs -quiet compile")
;WINDOWS-ONLY;;(setq compile-command "cd c:/work/nimcast; ant -emacs -quiet dist -Dmachine.target=prod-nimcast")
;WINDOWS-ONLY;;(setq compile-command "cd c:/work/nimcast; ant -emacs -quiet dist -Dmachine.target=beta-public")

;WINDOWS-ONLY;;(setq compile-command "cd c:/work/ramp; ant -emacs -quiet compile")
;WINDOWS-ONLY;;(setq compile-command "cd c:/work/ramp; ant -emacs -quiet dist -Dmachine.target=prod-internal-onp")
;WINDOWS-ONLY;;(setq compile-command "cd c:/work/ramp; ant -emacs -quiet dist -Dmachine.target=beta-public")

;WINDOWS-ONLY;;(setq compile-command "cd c:/work/totalvid/tpsync; ant -emacs -quiet all")

;WINDOWS-ONLY;;;(setq compile-command "cd c:/work/iwvisual; ant -emacs")

(setq-default tab-width 2)
;(setq-default tab-width 8)
;; i hate tabs!
(setq-default indent-tabs-mode nil)

;(setq default-buffer-file-coding-system 'utf-8-unix)
;(modify-coding-system-alist 'file "\.*" 'utf-8-unix)
;(setq default-buffer-file-coding-system 'utf-8)
;(modify-coding-system-alist 'file "\.*" 'utf-8)

;;============================================================
;; printer mappings
;;============================================================
;(set 'printer-name' "//phoenix/HP LaserJet 1100")
;(set 'ps-printer-name' "//slim/8000hp")

;;============================================================
;; other settings
;;============================================================
;WINDOWS-ONLY;;;(setq java-open-source-path '("c:/j2sdk1.4.2_06/src" "c:/work/femaweb/src"))

;(icomplete-mode 1)

(iswitchb-mode 1)
(add-to-list 'iswitchb-buffer-ignore "^ ")
(add-to-list 'iswitchb-buffer-ignore "*ECB")
(add-to-list 'iswitchb-buffer-ignore "*Messages")
(add-to-list 'iswitchb-buffer-ignore "*Buffer")
(add-to-list 'iswitchb-buffer-ignore "*Completions")
(add-to-list 'iswitchb-buffer-ignore "*ftp ")
(add-to-list 'iswitchb-buffer-ignore "*bsh")
(add-to-list 'iswitchb-buffer-ignore "*jde-log")
(add-to-list 'iswitchb-buffer-ignore "^[tT][aA][gG][sS]$")
(add-to-list 'iswitchb-buffer-ignore "*ediff")
(add-to-list 'iswitchb-buffer-ignore "*vc#")
(add-to-list 'iswitchb-buffer-ignore "*cvs-commit*")

;(setq iswitchb-case t)

;(gnuserv-start)
;(setq gnuserv-frame (selected-frame))

(global-hl-line-mode 1)

;;============================================================
;; If you want Emacs to defer loading the JDE until you open a
;; Java file, edit the following line:
;;   set it to 't' to defer loading; 'nil' otherwise
;;============================================================
(setq defer-loading-jde nil)

(if defer-loading-jde
    (progn
      (autoload 'jde-mode "jde" "JDE mode." t)
      (setq auto-mode-alist
        (append
         '(("\\.java\\'" . jde-mode))
         auto-mode-alist)))
  (require 'jde))

;;============================================================
;; constants
;;============================================================
;;(defconst my-c-style
;;  '((c-basic-offset . 4)
;;  (c-comment-only-line-offset 0 . 0)
;;  (c-offsets-alist
;;   (arglist-intro . +)
;;   (arglist-cont . 0)
;;   (arglist-close . 0)
;;   (block-open . -)
;;   (inline-open . 0))
;;   (knr-argdecl-intro . 0)
;;   (label . 0)
;;   (statement-block-intro . +)
;;   (substatement-open . 0)
;;   (statement-case-open . +)
;;   (statement-cont . +)
;;  (c-special-indent-hook . c-gnu-impose-minimum)
;;  (c-comment-continuation-stars . "* ")
;;  (c-hanging-comment-ender-p . t))
;;  "My C Programming Style")

(defconst my-c-style
  '((c-basic-offset . 4)
    (c-comment-only-line-offset 0 . 0)
    (c-offsets-alist
     (string . c-lineup-dont-change)
     (c . c-lineup-C-comments)
     (defun-open . 0)
     (defun-close . 0)
     (defun-block-intro . +)
     (class-open . 0)
     (class-close . 0)
     (inline-close . 0)
     (func-decl-cont . +)
     (knr-argdecl . 0)
     (topmost-intro . 0)
     (topmost-intro-cont . 0)
     (member-init-intro . +)
     (member-init-cont . c-lineup-multi-inher)
     (inher-intro . +)
     (inher-cont . +)
     (block-open . -)
     (block-close . 0)
     (brace-list-open . 0)
     (brace-list-close . 0)
     (brace-list-intro . +)
     (brace-list-entry . 0)
     (brace-entry-open . 0)
     (statement . 0)
     (statement-case-intro . +)
     (substatement . +)
     (case-label . 0)
     (access-label . -)
     (do-while-closure . 0)
     (else-clause . 0)
     (catch-clause . 0)
     (comment-intro . c-lineup-comment)
     (arglist-cont . 0)
     (arglist-cont-nonempty . c-lineup-arglist)
     (stream-op . c-lineup-streamop)
     (inclass . +)
     (cpp-macro .
                [0])
     (cpp-macro-cont . c-lineup-dont-change)
     (friend . 0)
     (objc-method-intro .
                        [0])
     (objc-method-args-cont . c-lineup-ObjC-method-args)
     (objc-method-call-cont . c-lineup-ObjC-method-call)
     (extern-lang-open . 0)
     (extern-lang-close . 0)
     (inextern-lang . +)
     (namespace-open . 0)
     (namespace-close . 0)
     (innamespace . +)
     (template-args-cont c-lineup-template-args +)
     (inlambda . 0)
     (lambda-intro-cont . +)
     (inexpr-statement . 0)
     (inexpr-class . +)
     (statement-block-intro . +)
     (knr-argdecl-intro . 0)
     (substatement-open . 0)
     (label . 0)
     (statement-case-open . +)
     (statement-cont . +)
     (arglist-intro . +)
     (arglist-close . 0)
     (inline-open . 0))
    (c-special-indent-hook . c-gnu-impose-minimum)
    (c-comment-continuation-stars . "* ")
    (c-hanging-comment-ender-p . t))
  "My C Programming Style")

;;============================================================
;; defuns
;;============================================================
;; The current expression before point delimited by white space
(defun currentExpression ()
  (save-excursion
      (let (startPoint endPoint)
        (if (string-match "\\s" (char-to-string (char-before)))
            (skip-chars-backward " \t\n"))
        (if (search-backward-regexp "[ \t\n]" nil t)
            (forward-char)
          (beginning-of-buffer))
        (setq startPoint (point))
        (if (search-forward-regexp "[ \t\n]" nil t)
            (backward-char)
            (end-of-buffer))
        (setq endPoint (point))
        (buffer-substring startPoint endPoint))))


(require 'comint)

;; Use the text around point as a cue what it is that we want from the
;; editor. Allowance has to be made for the case that point is at the
;; edge of a buffer.
(defun indent-or-expand (arg)
  "Either indent according to mode, or expand the word preceding
point."
  (interactive "*P")
  (if (and
       (or (bobp) (= ?w (char-syntax (char-before))))
       (or (eobp) (not (= ?w (char-syntax (char-after))))))
      (dabbrev-expand arg)
    (indent-according-to-mode)))

;;;;;;;;;;;;;;;;;;;;;;;

(defun iwb() "indent whole buffer"  (interactive)
  (delete-trailing-whitespace)
  (indent-region (point-min) (point-max) nil)
  (untabify (point-min) (point-max)))

(defun my-jde-build() "calls jde-ant-build after making sure the project file is loaded" (interactive)
  (jde-load-project-file)
  (call-interactively (car '(jde-ant-build)))
)

(defun my-c-fix ()
  (c-add-style "PERSONAL" my-c-style t)
  (setq c-basic-offset 4))

(defun my-short-c-fix ()
  (c-add-style "PERSONAL" my-c-style t)
  (setq c-basic-offset 2))

(defun my-tab-fix ()
;;  (setq tab-width 4)
;;  (setq indent-tabs-mode nil)
  (interactive)
  (local-set-key [tab] 'indent-or-expand)
)

(defun my-short-tab-fix ()
  (my-tab-fix)
  (setq tab-width 2))

;; sqlplus add-on by jsquires
(defun sqlplus-login (user password server)
  "some documentation"
  (interactive
   "Buser: \nBpassword: \nBserver: "
   )
  (setq sqlplus-command-args (concat user "/" password "@" server))
  (message "logging in to sqlplus as user %s" sqlplus-command-args)
  (sqlplus))

;; sqlplus add-on by jsquires
(defun sqlplus-login-personal ()
  "some documentation"
;  (setq sqlplus-command-args "system/manager@webdbdev")
  (setq sqlplus-command-args "system/fr0m0hi0@lab")
  (message "logging in to sqlplus as user %s" sqlplus-command-args)
  (sqlplus)
  (interactive))

(defun insert-debug-println ()
  (forward-line 1)
  (beginning-of-line)
  (insert (concat '"System.out.println(\"" (int-to-string (point)) "\");\n"))
;;  (insert (concat '"alert(\"" (int-to-string (point)) "\");\n"))
  (interactive))

(defun insert-arrow ()
  (delete-horizontal-space)
  (insert " => ")
  (interactive))

(defun custom-sqlplus-send-current ()
  (sqlplus-send-current)
  (forward-line 1)
  (interactive))

(defun match-paren (arg)
  "Go to the matching parenthesis if on parenthesis."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
        ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
        ))
;        (t (self-insert-command (or arg 1)))))

(defun custom-jde-bindings ()
  (local-set-key [(control c)(control v)(g)] 'jde-import-organize)
  (local-set-key [(control c)(control v)(k)] 'jde-import-kill-extra-imports))

(defun delete-window-replacement (&optional p)
  "Kill current window.  If called with PREFIX, kill the buffer too."
  (interactive "P")
  (if p
      (kill-buffer nil))
  (delete-window))

(defun delete-other-windows-replacement (&optional p)
  "Make the selected window fill its frame.  If called with PREFIX,
kill all other visible buffers."
  (interactive "P")
  (if p
      (dolist (window (window-list))
        (unless (equal (window-buffer window) (current-buffer))
          (kill-buffer (window-buffer window)))))
  (delete-other-windows))


(defun kill-save-rectangle (start end &optional fill)
  "Save the rectangle as if killed, but don't kill it.  See
`kill-rectangle' for more information."
  (interactive "r\nP")
  (kill-rectangle start end fill)
  (goto-char start)
  (yank-rectangle))


;;============================================================
;; If the *scratch* buffer is killed, recreate it automatically
;;============================================================
(save-excursion
  (set-buffer (get-buffer-create "*scratch*"))
  (lisp-interaction-mode)
  (make-local-variable 'kill-buffer-query-functions)
  (add-hook 'kill-buffer-query-functions 'kill-scratch-buffer))
(defun kill-scratch-buffer ()
  ;; Kill the current (*scratch*) buffer
  (remove-hook 'kill-buffer-query-functions 'kill-scratch-buffer)
  (kill-buffer (current-buffer))
  ;; Make a brand new *scratch* buffer
  (set-buffer (get-buffer-create "*scratch*"))
  (lisp-interaction-mode)
  (make-local-variable 'kill-buffer-query-functions)
  (add-hook 'kill-buffer-query-functions 'kill-scratch-buffer)
  ;; Since we killed it, don't let caller do that.
  nil)

;;============================================================
;; hooks
;;============================================================
(add-hook 'c-mode-hook             'my-tab-fix)
(add-hook 'c-mode-hook             'my-c-fix)
(add-hook 'c++-mode-hook           'my-tab-fix)
(add-hook 'c++-mode-hook           'my-c-fix)
(add-hook 'sql-mode-hook           'my-tab-fix)
(add-hook 'jde-mode-hook           'my-tab-fix)
(add-hook 'jde-mode-hook           'my-c-fix)
(add-hook 'jde-mode-hook           'custom-jde-bindings)
;(add-hook 'jde-mode-hook           'jde-electric-return-mode)
;(add-hook 'jde-mode-hook           'jde-abbrev-mode)
(add-hook 'java-mode-hook          'my-tab-fix)
(add-hook 'java-mode-hook          'my-c-fix)
(add-hook 'csharp-mode-hook        'my-tab-fix)
(add-hook 'csharp-mode-hook        'my-c-fix)
(add-hook 'html-helper-mode-hook   'my-tab-fix)
(add-hook 'text-mode-hook          'my-tab-fix)
;(add-hook 'shell-script-mode-hook  'my-short-tab-fix)
(add-hook 'nroff-mode-hook         'my-tab-fix)
(add-hook 'outline-mode-hook       'my-tab-fix)
(add-hook 'javascript-mode-hook    'my-tab-fix)
;(add-hook 'ruby-mode-hook          'ruby-electric-mode)
(add-hook 'after-save-hook         'executable-make-buffer-file-executable-if-script-p)
(add-hook 'lisp-mode-hook          'my-tab-fix)
(add-hook 'lisp-interaction-mode-hook 'my-tab-fix)
(add-hook 'emacs-lisp-mode-hook    'my-tab-fix)

(add-hook 'conf-javaprop-mode-hook
          '(lambda () (conf-quote-normal nil)))

;; create a before-save-hook
(defvar before-save-hook nil)
(make-local-hook 'before-save-hook)
(defadvice save-buffer (before crs-before-save-run-hooks)
  "Run before-save-hook before saving."
  (run-hooks 'before-save-hook))
(ad-activate 'save-buffer)

;; use that new before-save-hook to set the file-coding-system
;; unix files only!
;;(add-hook 'before-save-hook
;;            '(lambda ()
;;              (set-buffer-file-coding-system 'utf-8)))

(remove-hook 'shell-mode-hook 'nt-shell-mode-hook)

;;============================================================
;; file extensions
;;============================================================
;(autoload 'sgml-mode "psgml" "Major mode to edit SGML files." t)
;(autoload 'xml-mode "psgml" "Major mode to edit XML files." t)
(autoload 'html-helper-mode "html-helper-mode" "Yay HTML" t)
(autoload 'php-mode "php-mode" "PHP mode" t)

(fmode-replace-default-mode 'xml-mode 'nxml-mode)
(add-to-list 'auto-mode-alist '("\\.svg\\'"   . nxml-mode))
(add-to-list 'auto-mode-alist '("\\.xslt\\'"  . nxml-mode))
(add-to-list 'auto-mode-alist '("\\.proc\\'"  . plsql-mode))
(add-to-list 'auto-mode-alist '("\\.ps\\'"    . plsql-mode))
(add-to-list 'auto-mode-alist '("\\.pb\\'"    . plsql-mode))
(add-to-list 'auto-mode-alist '("\\.sql\\'"   . plsql-mode))
(add-to-list 'auto-mode-alist '("\\.emacs\\'" . emacs-lisp-mode))
(add-to-list 'auto-mode-alist '("\\.java\\'"  . jde-mode))
(add-to-list 'auto-mode-alist '("\\.jsp\\'"   . html-helper-mode))
(add-to-list 'auto-mode-alist '("\\.php\\'"   . html-helper-mode))
(add-to-list 'auto-mode-alist '("\\.asp\\'"   . html-helper-mode))
(add-to-list 'auto-mode-alist '("\\.aspx\\'"  . html-helper-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'"    . javascript-mode))
(add-to-list 'auto-mode-alist '("\\.cs\\'"    . csharp-mode))
(add-to-list 'auto-mode-alist '("\\.h\\'"     . c++-mode))
(add-to-list 'auto-mode-alist '("\\.c\\'"     . c++-mode))
(add-to-list 'auto-mode-alist '("\\.rb\\'"    . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.otl\\'"   . outline-mode))
(add-to-list 'auto-mode-alist '("\\.css\\'"   . css-mode))
(add-to-list 'auto-mode-alist '("\\.html'"  . html-helper-mode))
(add-to-list 'auto-mode-alist '("\\.shtml\\'" . html-helper-mode))
;; Jakarta Velocity templates are usually html
(add-to-list 'auto-mode-alist '("\\.vm\\'" . html-helper-mode))
 ;; this is for "View Source" in Internet Explorer
(add-to-list 'auto-mode-alist '("\\[1]\\'" . html-helper-mode))
(add-to-list 'auto-mode-alist '("\\[2]\\'" . html-helper-mode))
(add-to-list 'auto-mode-alist '("\\[3]\\'" . html-helper-mode))
(add-to-list 'auto-mode-alist '("\\[4]\\'" . html-helper-mode))
(add-to-list 'auto-mode-alist '("\\[5]\\'" . html-helper-mode))

(add-to-list 'completion-ignored-extensions ".class")
(add-to-list 'completion-ignored-extensions ".exe")

;;(setq auto-mode-alist (cons '("\\.html$" . html-helper-mode) auto-mode-alist))

;;============================================================
;; key mappings
;;============================================================
;(define-key global-map [(control x)(control m)]     'execute-extended-command)

(define-key global-map [(control kp-6)]             'enlarge-window-horizontally)
(define-key global-map [(control kp-4)]             'shrink-window-horizontally)
(define-key global-map [(control kp-8)]             'enlarge-window)
(define-key global-map [(control kp-2)]             'shrink-window)

(define-key global-map [(f1)]                       'jde-build)
(define-key global-map [(control f1)]               'jde-build)
(define-key global-map [(shift f1)]                 'compile)
(define-key global-map [(control f1)]               'ruby-eval-buffer)
(define-key global-map [(control meta f1)]          'xmp)

(define-key global-map [(f2)]                       'bm-next)
(define-key global-map [(control f2)]               'bm-toggle)
(define-key global-map [(shift f2)]                 'bm-previous)

(define-key global-map [(f3)]                       'grep-find)
(define-key global-map [(control f3)]               'find-name-dired)
(define-key global-map [(shift f3)]                 'grep)
(define-key global-map [(meta f3)]                  'occur)

(define-key global-map [(shift f4)]                 'kmacro-start-macro-or-insert-counter)
;(define-key global-map [(f4)]                       'kmacro-end-or-call-macro)  ;; already defined

(define-key global-map [(f5)]                       'revert-buffer)
(define-key global-map [(control f5)]               'toggle-read-only)
(define-key global-map [(shift f5)]                 'ecb-redraw-layout)

(define-key global-map [(shift f6)]                'sqlplus-login)
(define-key global-map [(meta f6)]                 'sqlplus-login-personal)
(define-key global-map [f6]                        'sqlplus-send-current)
(define-key global-map [(control f6)]              'custom-sqlplus-send-current)
(define-key global-map [(control meta f6)]         'sqlplus-send-interrupt)

;(define-key global-map [(f6)]                       'java-open-class-at-point)
;(define-key global-map [(shift f6)]                 'java-open-base-class-source)


;(define-key global-map [(f7)]                       'kmacro-end-or-call-macro)
;(define-key global-map [(shift f7)]                 'kmacro-start-macro-or-insert-counter)

(define-key global-map [(f8)]                       'indent-region)
(define-key global-map [(control f8)]               'align)
(define-key global-map [(shift f8)]                 'align-current)

(define-key global-map [(control f9)]               'rails-svn-status-into-root)
(define-key global-map [(control meta f9)]          (function (lambda () (interactive)
                                                       (svn-status default-directory))))
(define-key global-map [(meta f9)]                  'autotest-switch)

;(define-key global-map [(control f12)]              'custom-sqlplus-send-current)
;(define-key global-map [(shift f12)]                'sqlplus-send-region)
;(define-key global-map [(shift f12)]                'insert-debug-println)

(define-key global-map [(home)]                     'beginning-of-line)
(define-key global-map [(control home)]             'beginning-of-buffer)
(define-key global-map [(control meta home)]        'beginning-of-buffer)
(define-key global-map [(end)]                      'end-of-line)
(define-key global-map [(control end)]              'end-of-buffer)
(define-key global-map [(control meta end)]         'end-of-buffer)
;(define-key global-map [(control del)]              'backward-kill-word)  ;; currently a default

(define-key global-map [(control c)(d)]             'insert-date)
(define-key global-map [(control c)(control v)(d)]  'insert-personal-time-stamp)

(define-key global-map [(control c)(control v)(control b)]  'jde-build)

(define-key global-map [(control meta n)]           'next-error)
(define-key global-map [(control meta p)]           'previous-error)

(define-key global-map [(control \')]               'match-paren)

(define-key global-map [(control >)]               'insert-arrow)

(define-key global-map [(control x)(0)] 'delete-window-replacement)
(define-key global-map [(control x)(1)] 'delete-other-windows-replacement)

;(global-set-key [(control x)(r)(meta k)] 'kill-save-rectangle)
(global-set-key (kbd "C-x r M-k") 'kill-save-rectangle)

; Map the window manipulation keys to meta 0, 1, 2, o
(global-set-key (kbd "M-3") 'split-window-horizontally) ; was digit-argument
(global-set-key (kbd "M-2") 'split-window-vertically) ; was digit-argument
(global-set-key (kbd "M-1") 'delete-other-windows) ; was digit-argument
(global-set-key (kbd "M-0") 'delete-window) ; was digit-argument
(global-set-key (kbd "M-o") 'other-window) ; was facemenu-keymap

; Mac conventions
(global-set-key (kbd "M-a") 'mark-whole-buffer) ; was backward-sentence.
(global-set-key (kbd "M-s") 'save-buffer)  ; was center-line. cmd-s is OS X convention.
; (defalias 'center-line 'save-buffer)

(global-set-key [(f14)] 'restore-frame)
(global-set-key [(f15)] 'maximize-frame)

(define-key isearch-mode-map (kbd "C-o")
  (lambda ()
    (interactive)
    (let ((case-fold-search isearch-case-fold-search))
      (occur (if isearch-regexp isearch-string
               (regexp-quote isearch-string))))))


;;============================================================
;; Environment variables and exec-path
;;============================================================
;;WINDOWS-ONLY;;(setq exec-path (cons "C:/cygwin/bin" exec-path))
;;WINDOWS-ONLY;;(setenv "PATH" (concat "C:\\cygwin\\bin;" (getenv "PATH")))

;;(setq exec-path (cons "/opt/local/bin" exec-path))
;;(setenv "PATH" (concat "/opt/local/bin:" (getenv "PATH")))

;;(setq exec-path (cons "~/bin" exec-path))
;;(setenv "PATH" (concat "~/bin:" (getenv "PATH")))

;;(setq exec-path (cons "/usr/local/instantclient" exec-path))
;;(setenv "PATH" (concat "/usr/local/instantclient:" (getenv "PATH")))

(setq exec-path (cons "/opt/local/bin" exec-path))
(setenv "PATH" (concat "/opt/local/bin:" (getenv "PATH")))


(setenv "SQLPATH" "/usr/local/instantclient")
(setenv "TNS_ADMIN" "/usr/local/instantclient")
(setenv "DYLD_LIBRARY_PATH" "/usr/local/instantclient")

(setenv "rj" "~/work/ramp/src/java/gov/fema/web/ramp")
(setenv "rw" "~/work/ramp/web")
(setenv "rd" "~/work/ramp/db")
(setenv "rh" "~/work/ramp")

(setenv "ej" "~/work/eyestreet-java/src/java/com/eyestreet")
(setenv "et" "~/work/eyestreet-java/src/test/com/eyestreet")
(setenv "eh" "~/work/eyestreet-java")

(setenv "fj" "~/work/femaweb-java/src/java/gov/fema")
(setenv "fh" "~/work/femaweb-java")

(setenv "nj" "~/work/nimcast/src/java/gov/fema/web/nimcast")
(setenv "nw" "~/work/nimcast/web")
(setenv "nd" "~/work/nimcast/db")
(setenv "nh" "~/work/nimcast")

(setenv "gems" "/opt/local/lib/ruby/gems/1.8/gems")

;(setq process-coding-system-alist '(("bash" . undecided-unix)))
;;
;; This removes unsightly ^M characters that would otherwise
;; appear in the output of java applications.
;;
(add-hook 'comint-output-filter-functions
      'comint-strip-ctrl-m)

;; NT-emacs assumes a Windows command shell, which you change
;; here.
(setq shell-file-name "bash")
(setq shell-command-switch "-c")
(setq explicit-shell-file-name shell-file-name)
(setenv "SHELL" shell-file-name)
(setq explicit-sh-args '("-login" "-i"))
(if (boundp 'w32-quote-process-args)
  (setq w32-quote-process-args ?\")) ;; Include only for MS Windows.

;;(setq w32-quote-process-args ?\")
;;(setq shell-file-name "bash")
;;(setenv "SHELL" shell-file-name)
;;(setq explicit-shell-file-name shell-file-name)

;; Add color to a shell running in emacs 'M-x shell'
(autoload 'ansi-color-for-comint-mode-on "ansi-color"
          "Set `ansi-color-for-comint-mode' to t." t)
(setq ansi-color-names-vector ; better contrast colors
      ["black" "red4" "green4" "yellow4"
       "blue3" "magenta4" "cyan4" "white"])
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; Turn off word wrap and to make the prompt read-only:
(add-hook 'shell-mode-hook '(lambda () (toggle-truncate-lines 1)))
(setq comint-prompt-read-only t)

;;============================================================
;; Fonts
;;============================================================

;; FROM: http://community.schemewiki.org/cgi-bin/scheme.cgi?Emacs
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
     )

(setq default-frame-alist '((font . "fontset-monaco")))


;; enable/disable italics
;; (set-face-italic-p 'font-lock-comment-face t)
;; (set-face-italic-p 'font-lock-comment-face nil)

;; (set-face-font 'italic "-*-vt6x13-*-*-*-*-*-*-*-*-*-*-utf8")
;; (set-face-font 'bold-italic "-*-vt6x13-*-*-*-*-*-*-*-*-*-*-utf8")
;; (set-face-font 'bold "-*-vt6x13-*-*-*-*-*-*-*-*-*-*-utf8")
;; (set-default-font "-*-vt6x13-*-*-*-*-*-*-*-*-*-*-utf8")
;; (set-default-font "-*-monaco-*-*-*-*-*-*-*-*-*-*-utf8")

;; (setq w32-enable-italics t)
;; (set-default-font "-*-vt6x13-*-*-*-*-*-*-*-*-*-*-iso8859-1")
;; (set-default-font "-*-vt100-*-*-*-*-12-*-*-*-*-*-utf8")

;;============================================================
;; colors
;;============================================================
;; Below is a list of color-schemes that I thought were pleasing to the eye.
;; Most of the others are pretty ugly.
(color-theme-initialize)
;(color-theme-reset-faces)

;(color-theme-classic)
(color-theme-arjen)
;(color-theme-dark-laptop)
;(color-theme-clarity)
;(color-theme-goldenrod)
;(color-theme-billw)

;(color-theme-gnome2)

;(color-theme-sitaramv-nt)
;(color-theme-pierson)
;(color-theme-pierson)
;(color-theme-rotor)
;(color-theme-emacs-21)
;(color-theme-gtk-ide)

(set-face-background 'bm-face                      "DarkSlateBlue")
(set-face-foreground 'bm-face                      "yellow")

;(set-face-background 'hl-line    "lemon chiffon")
;(set-face-background 'hl-line    "#220")
;(set-face-background 'hl-line    "#110")
;(set-face-background 'hl-line    "#222")
(set-face-background 'hl-line    "#181818")
;(set-face-background 'hl-line    "#111")
;(set-face-foreground 'hl-line   "white")
;(set-face-foreground 'hl-line   nil)

;;============================================================
;; custom folding support
;;============================================================
(defun zoom-way-out() (interactive)
  (set-selective-display 0))
(defun zoom-way-in() (interactive)
  (set-selective-display 2))
(defun zoom-out() (interactive)
  (set-selective-display
     (if selective-display
        (if (or (= selective-display 0) (= selective-display 20))
        0
     (+ selective-display 1))
     0)))
(defun zoom-in() (interactive)
  (set-selective-display
     (if selective-display
        (if (= selective-display 0)
           20
           (if (= selective-display 2)
              2
              (- selective-display 1)))
        20)))

(global-set-key [(meta \))] 'zoom-way-out)
(global-set-key [(meta _)] 'zoom-in)
(global-set-key [(meta +)] 'zoom-out)


;;============================================================
;; desktop support
;;============================================================
(load "desktop")
(desktop-load-default)
(desktop-read)

;;============================================================
;; personal macros
;;============================================================
;;update orders set user_id='<USER>', tracking_number='<TRACK>', status='shipped' where cash_id='<CASH>';
(fset 'orders-shipped
   [?\C-a ?\M-d ?\M-d ?\M-d ?\M-d ?\M-d ?\M-d ?\M-d ?\M-d ?\M-d ?\C-d ?\C-d ?\M-d ?\C-e ?  ?\C-y ?\C-a ?\M-d ?\M-d ?\C-d ?\C-d ?u ?p ?d ?a ?t ?e ?  ?o ?r ?d ?e ?r ?s ?  ?s ?e ?t ?  ?u ?s ?e ?r ?_ ?i ?d ?+ backspace ?= ?' ?\M-f ?' ?, ?  ?t ?r ?a ?c ?k ?i ?n ?g ?_ ?n ?u ?m ?b ?e ?r ?= ?' ?\M-d ?\M-d ?\M-d ?\M-d ?\M-d ?\C-d ?\C-d ?\M-f ?' ?, ?  ?s ?t ?a ?t ?u ?s ?= ?' ?s ?h ?i ?p ?p ?e ?d ?' ?  ?w ?h ?e ?r ?e ?  ?c ?a ?s ?h ?_ ?i ?d ?= ?' ?\M-d ?\M-d ?\M-d ?\C-d ?\M-f ?' ?\; ?\C-n])

(fset 'orders-shipped-slow
   [?\C-a ?\M-\\ ?\M-d ?\C-e ?  ?\C-y ?\C-a ?u ?p ?d ?a ?t ?e ?  ?o ?r ?d ?e ?r ?s ?  ?s ?e ?t ?  ?u ?s ?e ?r ?_ ?i ?d ?\\ backspace ?= ?' ?\M-\\ ?\M-f ?' ?, ?  ?t ?r ?a ?c ?k ?i ?n ?g ?_ ?n ?u ?m ?b ?e ?r ?= ?\M-\\ ?' ?\M-f ?' ?, ?  ?s ?t ?a ?t ?u ?s ?= ?' ?s ?h ?i ?p ?p ?e ?d ?' ?  ?w ?h ?e ?r ?e ?  ?c ?a ?s ?h ?_ ?i ?d ?= ?' ?\M-\\ ?\M-f ?' ?\; ?\C-n])


;;============================================================
;; do not edit below this line
;;============================================================

(setq svn-status-default-diff-arguments '("-x -wbu --ignore-eol-style"))

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(backup-directory-alist (quote (("." . "~/.emacs.d/backup"))))
 '(compilation-scroll-output t)
 '(ecb-options-version "2.20")
 '(ediff-split-window-function (quote split-window-horizontally))
 '(global-semantic-show-tag-boundaries-mode nil nil (semantic-util-modes))
 '(global-semantic-stickyfunc-mode nil nil (semantic-util-modes))
 '(jde-ant-args "-quiet -emacs")
 '(jde-ant-enable-find t)
 '(jde-ant-home "/opt/local/share/java/apache-ant")
 '(jde-ant-invocation-method (quote ("Ant Server")))
 '(jde-ant-program "ant")
 '(jde-ant-read-buildfile nil)
 '(jde-ant-read-target t)
 '(jde-build-function (quote (my-jde-build)))
 '(jde-checkstyle-option-lcurly-type (quote ("nl")))
 '(jde-compile-option-hide-classpath t)
 '(jde-complete-display-qualified-types nil)
 '(jde-complete-insert-method-signature nil)
 '(jde-complete-signature-display (quote ("Buffer")))
 '(jde-complete-signature-display-time 10)
 '(jde-gen-k&r nil)
 '(jde-global-classpath (quote ("/opt/local/share/java/apache-ant/lib/ant.jar" "~/work/store/src" "")))
 '(jde-import-group-of-rules (quote (("^javax?\\.") ("^com\\.eyestreet\\.") ("^com\\.elasticpath\\.") ("^com\\.kajeet\\.") ("^gov\\.fema\\.") ("^org\\.apache\\."))))
 '(jde-javadoc-author-tag-template "\"* @author Ryan McGeary\"")
 '(jde-javadoc-version-tag-template "\"* @version $Id: .emacs 416 2007-06-07 18:29:50Z ryan $\"")
 '(jde-jdk-registry (quote (("1.4.2" . "/System/Library/Frameworks/JavaVM.framework/Versions/1.4.2") ("1.5.0" . "/System/Library/Frameworks/JavaVM.framework/Versions/1.5.0"))))
 '(jde-run-read-app-args t)
 '(jde-sourcepath (quote ("$JAVA_HOME/src" "~/work/ramp/src")))
 '(jde-wiz-get-javadoc-template nil)
 '(jde-wiz-get-set-static-members nil)
 '(jde-wiz-get-set-variable-prefix "")
 '(jde-wiz-set-javadoc-template nil)
 '(recentf-exclude (quote ("^/sshx:")) t)
 '(recentf-max-menu-items 30)
 '(rmail-summary-scroll-between-messages t)
 '(rng-schema-locating-files (quote ("schemas.xml" "/Applications/Emacs.app/Contents/Resources/lisp/nxml-mode/schema/schemas.xml" "~/.emacs.d/schemas/schemas.xml")))
 '(semanticdb-default-save-directory "~/.emacs.d/semanticcache")
 '(semanticdb-project-roots (quote ("~/work/ramp"))))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(diff-added ((t (:inherit diff-changed :background "#70FB67" :foreground "black"))))
 '(diff-file-header ((((class color) (min-colors 88) (background dark)) (:background "#5686E2" :weight bold))))
 '(diff-header ((((class color) (min-colors 88) (background dark)) (:background "#3469D0"))))
 '(diff-hunk-header ((t (:inherit diff-header :background "#3469D0"))))
 '(diff-index ((t (:inherit diff-file-header :background "#5686E2"))))
 '(diff-removed ((t (:inherit diff-changed :background "#FF453C"))))
 '(flymake-errline ((((class color)) (:background "#330000" :overline "red" :underline "red"))))
 '(flymake-warnline ((((class color)) (:background "#333300" :overline "yellow" :underline "yellow"))))
 '(rng-error-face ((t (:background "#080808" :overline "red" :underline "red"))))
 '(semantic-highlight-attribute-face-private ((((class color) (background light)) (:background "darkseagreen2")))))

(put 'upcase-region 'disabled nil)

(put 'downcase-region 'disabled nil)

(put 'dired-find-alternate-file 'disabled nil)

(put 'set-goal-column 'disabled nil)

;; '(jde-global-classpath (quote ("/opt/local/share/java/apache-ant/lib/ant.jar:/opt/local/share/java/apache-ant/lib/ant-launcher.jar")))

;; '(rng-error-face ((t (:background "pink" :overline "red" :underline "red"))))


;; ============================================================
;;  TESTING AREA
;; ============================================================

(defun th-display-buffer (buffer force-other-window)
  "If BUFFER is visible, select it.

If it's not visible and there's only one window, split the
current window and select BUFFER in the new window. If the
current window (before the split) is more than 165 columns wide,
split horizontally, else split vertically.

If the current buffer contains more than one window, select
BUFFER in the least recently used window.

This function returns the window which holds BUFFER.

FORCE-OTHER-WINDOW is ignored."
  (or (get-buffer-window buffer)
      (if (one-window-p)
          (let ((new-win (if (> (window-width) 165)
                             (split-window-horizontally)
                           (split-window-vertically))))
            (set-window-buffer new-win buffer)
            new-win)
        (let ((new-win (get-lru-window)))
          (set-window-buffer new-win buffer)
          new-win))))

(setq display-buffer-function 'th-display-buffer)



;;----------------------------------

;;  (require 'filecache)
;;  (load "iswitchb-fc")
;;  (defun rails-add-proj-to-file-cache (dir)
;;   "Adds all the ruby and rhtml files recursively in the current directory to the file-cache"
;;   (interactive "DAdd directory: ")
;;     (file-cache-clear-cache)
;;     (file-cache-add-directory-recursively dir "\\.r\\(b\\|html\\|xml\\|js\\)")
;;     (file-cache-delete-file-regexp "\\.svn"))
;;
;;  (defun java-add-proj-to-file-cache (dir)
;;   "Adds all the java and jsp files recursively in the current directory to the file-cache"
;;   (interactive "DAdd directory: ")
;;   (file-cache-clear-cache)
;;   (file-cache-add-directory-recursively (concat dir "/src") "\\(xml\\|java\\|properties\\)")
;;   (file-cache-add-directory-recursively (concat dir "/web") "\\(jsp\\|html\\|xml\\|js\\|properties\\|vm\\)")
;;   (file-cache-delete-file-regexp "\\.svn"))

;;----------------------------------

(defun ruby-load-buffer (&optional buffer)
  "Load buffer's Ruby file into the inferior Ruby process.
Saving the buffer first if needed."
  (interactive (list
        (if current-prefix-arg
            (get-buffer (read-buffer "Load Ruby buffer: "
                         (current-buffer))))))
  (or buffer (setq buffer (current-buffer)))
  (let ((proc (ruby-proc)))
    (save-excursion
      (set-buffer buffer)
      (or (eq major-mode 'ruby-mode)
      (error "Not ruby mode"))
      (save-buffer buffer))
    (pop-to-buffer (process-buffer proc))
    (comint-send-string
     proc
     (concat "(load '" (buffer-file-name buffer) "'\)\n"))))

(defun inferior-ruby-load-buffer (buffer)
  (interactive "bLoad Ruby buffer: ")
  (ruby-load-buffer (get-buffer buffer)))

(let ((hook (function (lambda ()
            (define-key ruby-mode-map "\C-c\C-l" 'ruby-load-buffer)
            (define-key inferior-ruby-mode-map "\C-cl" 'inferior-ruby-load-buffer)
            ))))
  (if (featurep 'inf-ruby)
      (progn (require 'ruby-mode)
         (funcall hook))
  (add-hook 'inf-ruby-load-hook hook)))


(defun ruby-eval-buffer ()
   "Evaluate the buffer with ruby."
   (interactive)
   (shell-command-on-region (point-min) (point-max) "/opt/local/bin/ruby"))

(put 'narrow-to-region 'disabled nil)

