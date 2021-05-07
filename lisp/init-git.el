;;; -*- lexical-binding: t -*-

(straight-use-package 'magit)
(straight-use-package 'hl-todo)
(straight-use-package '(gitmoji :type git :host github :repo "Tiv0w/gitmoji"))
(straight-use-package 'diff-hl)

;; magit
(autoload #'magit "magit" nil t)

;; gitmoji
(setq
 gitmoji--insert-utf8-emoji t
 gitmoji--display-utf8-emoji t)

(with-eval-after-load "magit"
  (require 'gitmoji))

;; diff-hl
(autoload #'diff-hl-mode "diff-hl")

(add-hook 'dired-mode-hook 'diff-hl-dired-mode)
(add-hook 'prog-mode-hook 'diff-hl-mode)
(add-hook 'conf-mode-hook 'diff-hl-mode)

;; hl-todo
(add-hook 'dired-mode-hook 'hl-todo-mode)
(add-hook 'prog-mode-hook 'hl-todo-mode)
(add-hook 'conf-mode-hook 'hl-todo-mode)

(provide 'init-git)
