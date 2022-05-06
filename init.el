;;; Bootstrap straight.el

;; https://www.reddit.com/r/emacs/comments/mtb05k/emacs_init_time_decreased_65_after_i_realized_the/
(setq straight-check-for-modifications '(check-on-save find-when-checking))
(setq straight-vc-git-default-clone-depth 1)

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(defun font-installed-p (font-name)
  "Check if font with FONT-NAME is available."
  (find-font (font-spec :name font-name)))

(defun my/font-installed (list)
  "Return first installed font from LIST."
  (catch 'value
    (dolist (font list)
      (when (font-installed-p font)
        (throw 'value font)))))

;; first installed font will be set
;; last font is the fall back font on system
(defvar +fonts-default '("Roboto Mono" "Iosevka" "Menlo" "Source Code Pro")
  "Default font.")
(defvar +fonts-unicode '("Apple Color Emoji" "Noto Color Emoji")
  "Emoji font.")
(defvar +fonts-cn '("LXGW WenKai" "PingFang SC")
  "Chinese font.")
(defvar +fonts-variable-pitch '("Cardo" "Bookerly" "Nimbus Sans" "Helvetica")
  "Variable font.")

(defvar +font-size 12
  "Default font size")

(defvar +icons-p t
  "Whether to enable `all-the-icons'.")
(defvar +theme 'modus-operandi
  "Default theme.")
(defvar +theme-tui 'carbon
  "Default theme in terminal.")
(defvar +theme-system-light 'modus-operandi
  "Default light theme after system appearance changed.")
(defvar +theme-system-dark 'spacemacs-dark
  "Default dark theme. after system appearance changed.")
(defvar +theme-hooks nil
  "((theme-id . function) ...)")

(defvar +enable-benchmark nil
  "Enable `benchmark-init', run `benchmark-init/show-durations-tree' to see result.")
(defvar +meow-layout 'dvorak
  "Layout config for `meow', qwerty or dvorak.")

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "site-lisp" user-emacs-directory))
(add-to-list 'custom-theme-load-path (expand-file-name "themes" user-emacs-directory))

;; require all packages in emacsclient
(setq eat-all-packages-daemon t)


;;; others
(let ((file-name-handler-alist nil))
  (require 'eat-package)
  ;;  must work on emacs -Q
  (require 'init-default)
  ;;  some funcs
  (require 'init-utils)
  (require 'init-builtin)
  (require 'init-shell)
  ;; font theme modeline
  (require 'init-ui)
  ;;  must work on normal
  (require 'init-dog)
  (require 'init-edit)
  (require 'init-completion)
  (require 'init-dev)
  (require 'init-windows)
  ;;  鸡肋
  (when (and +icons-p (display-graphic-p))
    (require 'init-icons))
  ;;  emacs app，telega，magit
  (require 'init-app)
  ;;  modes
  (require 'init-mode)
  (require 'init-org)
  ;;  lib like all-the-icons
  (require 'init-lib)
  ;;  just straight
  (require 'init-mole)
  (require 'init-xterm))
