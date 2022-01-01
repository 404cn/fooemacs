;;; -*- lexical-binding: t -*-
;; Do not use `eat-package' with themes.

;; `spacemacs-theme'
(straight-use-package 'spacemacs-theme)

(setq
 spacemacs-theme-comment-italic t
 spacemacs-theme-keyword-italic t
 spacemacs-theme-org-agenda-height t
 spacemacs-theme-org-bold t
 spacemacs-theme-org-height t
 spacemacs-theme-org-highlight t
 spacemacs-theme-org-priority-bold t
 spacemacs-theme-org-bold t
 spacemacs-theme-underline-parens t)

;; `kaolin-themes'
(straight-use-package 'kaolin-themes)

(setq
 kaolin-themes-underline-wave nil
 kaolin-themes-modeline-border nil
 kaolin-themes-modeline-padded 4)

(with-eval-after-load 'kaolin-themes
  ;; NOTE maybe check `+icons-p' and `all-the-icons'
  (with-eval-after-load 'treemacs
    (kaolin-treemacs-theme)))

(add-hook 'after-init-hook
          (lambda ()
            (unless +theme-system-appearance
              (load-theme +theme t))))

(provide 'init-themes)
