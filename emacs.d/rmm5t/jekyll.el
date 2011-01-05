;; Custom support for Jekyll blogs

(setq jekyll-directory     (expand-file-name "~/work/ryan.mcgeary.org/"))
(setq jekyll-post-ext      ".md")
(setq jekyll-post-template "---\nlayout: post\ntitle: %s\n---\n\n")

(defun jekyll-find-posts ()
  (interactive)
  (find-file (concat jekyll-directory jekyll-posts-dir)))

(defun jekyll-find-drafts ()
  (interactive)
  (find-file (concat jekyll-directory jekyll-drafts-dir)))

(global-set-key (kbd "C-c b n") 'jekyll-draft-post)
(global-set-key (kbd "C-c b P") 'jekyll-publish-post)
(global-set-key (kbd "C-c b p") 'jekyll-find-posts)
(global-set-key (kbd "C-c b d") 'jekyll-find-drafts)
