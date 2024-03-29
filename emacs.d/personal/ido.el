;;; Interactive do, find-file and iswitchb replacement with fuzzy/flex matching.

(ido-mode t)
(setq ido-enable-flex-matching t) ; fuzzy matching is a must have
(setq ido-enable-last-directory-history nil) ; forget latest selected directory names

;; prioritize order by extension
(setq ido-file-extensions-order '(".rb" ".emacs" ".el" ".md" ".txt" ".yml" ".json"))
