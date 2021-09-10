;;; -*- lexical-binding: t -*-

(eat-package meow
  :straight t
  :hook
  (after-init-hook . (lambda ()
                       (meow-global-mode 1)))
  (term-mode-hook . (lambda ()
                      (meow-mode -1)))
  :config
  ;; make Meow usable in TUI Emacs
  (unless (display-graphic-p)
    (meow-esc-mode 1))
  ;;; project.el use C-x p
  (global-unset-key (kbd "C-x C-p"))
  (global-set-key (kbd "C-x C-d") #'dired)
  ;; SPC x f to describe-funtion
  (global-set-key (kbd "C-h C-f") 'describe-funtion)
  (dolist (mode '(debuffer-mode
                  ielm-mode
                  inferior-python-mode
                  go-dot-mod-mode
                  diff-mode))
    (add-to-list 'meow-mode-state-list `(,mode . normal)))
  (when (display-graphic-p)
    (meow-setup-line-number))
  (meow-setup)
  :init
  (setq meow-replace-state-name-list '((normal . "OwO")
                                       (insert . "QAQ")
                                       (keypad . "-,-")
                                       (motion . "=-="))
        meow-esc-delay 0.001)
  (defun meow-setup ()
    (setq meow-cheatsheet-layout meow-cheatsheet-layout-qwerty)
    (meow-motion-overwrite-define-key
     '("j" . meow-next)
     '("k" . meow-prev))
    (meow-leader-define-key
     ;; completion
     ;; '("SPC" . execute-extended-command) ;; use `SPC-m-x' instead
     '("i" . consult-imenu)
     '("I" . imenu-list-smart-toggle)
     '("b" . switch-to-buffer)
     '("f" . find-file)
     ;; basic
     '("v" . magit)
     '("t" . tab-bar-select-tab-by-name)
     '("d" . dired)
     '("L" . display-line-numbers-mode)
     '("S" . ispell-word)
     '("B" . ibuffer)
     '("=" . align-regexp)
     ;; project
     '("p S" . consult-ripgrep)
     '("p s" . consult-git-grep)
     '("p p" . project-switch-project)
     '("p f" . project-find-file)
     '("p F" . project-find-regexp)
     '("p b" . project-switch-to-buffer)
     '("p K" . project-kill-buffers)
     '("p e" . project-eshell)
     '("p r" . project-query-replace-regexp)
     '("p d" . project-dired)
     ;; xref
     '("." . xref-find-definitions)
     '("z" . xref-pop-marker-stack)
     '("," . xref-pop-marker-stack)
     '("Z" . xref-find-references)
     '("?" . xref-find-references)
     ;; wrap && sp
     '("(" . "M-(")
     '("[" . "M-[")
     '("{" . "M-{")
     '("}" . "C-}")
     '(")" . "C-)")
     '("e" . meow-eval-last-exp)
     '(";" . comment-dwim)
     ;; window
     '("w" . ace-window)
     '("W" . ace-swap-window)
     '("o" . delete-other-windows)
     '("q" . delete-window)
     '("-" . split-window-below)
     '("\\" . split-window-right)
     ;; SPC j/k will run the original command in MOTION state.
     '("j" . meow-motion-origin-command)
     '("k" . meow-motion-origin-command))
    (meow-normal-define-key
     '("-" . hs-hide-block)
     '("=" . hs-show-block)
     '("_" . hs-hide-all)
     '("+" . hs-show-all)
     '("0" . meow-expand-0)
     '("9" . meow-expand-9)
     '("8" . meow-expand-8)
     '("7" . meow-expand-7)
     '("6" . meow-expand-6)
     '("5" . meow-expand-5)
     '("4" . meow-expand-4)
     '("3" . meow-expand-3)
     '("2" . meow-expand-2)
     '("1" . meow-expand-1)
     '("'" . negative-argument)
     '(";" . meow-reverse)
     '("," . meow-inner-of-thing)
     '("." . meow-bounds-of-thing)
     '("[" . meow-beginning-of-thing)
     '("]" . meow-end-of-thing)
     '("a" . meow-append)
     '("A" . meow-open-below)
     '("b" . meow-back-word)
     '("B" . meow-back-symbol)
     '("c" . meow-change)
     '("C" . meow-change-save)
     '("d" . meow-kill)
     '("x" . meow-delete)
     '("f" . meow-find)
     '("F" . meow-find-expand)
     '("g" . meow-keyboard-quit)
     '("G" . goto-line)
     '("h" . meow-head)
     '("H" . meow-head-expand)
     '("i" . meow-insert)
     '("I" . meow-open-above)
     '("m" . meow-mark-word)
     '("M" . meow-mark-symbol)
     '("s" . meow-search)
     '("S" . meow-pop-search)
     '("t" . meow-till)
     '("T" . meow-till-expand)
     '("w" . meow-next-word)
     '("W" . meow-next-symbol)
     '("j" . meow-next)
     '("J" . meow-next-expand)
     '("o" . meow-block)
     '("O" . meow-block-expand)
     '("k" . meow-prev)
     '("K" . meow-prev-expand)
     '("q" . meow-quit)
     '("r" . meow-replace)
     '("R" . meow-replace-save)
     '("l" . meow-tail)
     '("L" . meow-tail-expand)
     '("n" . scroll-up-command)
     '("N" . scroll-down-command)
     '("u" . undo)
     '("U" . undo-redo)
     '("v" . meow-line)
     '("V" . meow-visit)
     '("e" . meow-join)
     '("E" . delete-indentation)
     '("y" . meow-save)
     '("p" . meow-yank)
     '("z" . meow-pop-selection)
     '("Z" . meow-pop-all-selection)
     '("?" . meow-cheatsheet)
     '("&" . meow-query-replace)
     '("%" . meow-query-replace-regexp)
     '("<f2>" . meow-quick-kmacro)
     '("<f3>" . meow-start-kmacro)
     '("<f4>" . meow-end-or-call-kmacro)
     '("<escape>" . meow-last-buffer)
     ;; for theme mother fucker man that turn around and look my monitor
     '("/" . tab-bar-switch-to-recent-tab))))

(provide 'init-meow)
