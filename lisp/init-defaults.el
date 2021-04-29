;;; -*- lexical-binding: t -*-

(setq-default
 ;; no start messages
 inhibit-startup-message t
 ;; don't read x resource file
 inhibit-x-resources t
 ;; no welcome screen
 inhibit-splash-screen t
 inhibit-startup-screen t
 ;; no startup messages
 inhibit-startup-echo-area-message t
 frame-inhibit-implied-resize t
 initial-scratch-message ""
 hl-line-sticky-flag nil
 ;; Don't create lockfiles
 create-lockfiles nil
 ;; UTF-8
 buffer-file-coding-system 'utf-8-unix
 default-file-name-coding-system 'utf-8-unix
 default-keyboard-coding-system 'utf-8-unix
 default-process-coding-system '(utf-8-unix . utf-8-unix)
 default-sendmail-coding-system 'utf-8-unix
 default-terminal-coding-system 'utf-8-unix
 ;; add final newline
 require-final-newline t
 ;; Disable auto save and backup
 make-backup-files nil
 auto-save-default nil
 auto-save-list-file-prefix nil
 ;; Xref no prompt
 xref-prompt-for-identifier nil
 ;; Mouse yank at point instead of click position.
 mouse-yank-at-point t
 ;; This fix the cursor movement lag
 auto-window-vscroll nil
 tab-width 4
 ;; Don't show cursor in non selected window.
 cursor-in-non-selected-windows nil
 comment-empty-lines t
 visible-cursor t
 ;; Window divider setup
 window-divider-default-right-width 1
 window-divider-default-bottom-width 0
 window-divider-default-places t
 ;; allow resize by pixels
 frame-resize-pixelwise t
 x-gtk-resize-child-frames nil
 x-underline-at-descent-line t
 ;; Improve long line display performance
 bidi-inhibit-bpa t
 bidi-paragraph-direction 'left-to-right
 ;; don't wait for keystrokes display
 echo-keystrokes 0.01
 show-paren-style 'parenthese
 ;; indent with whitespace by default
 indent-tabs-mode nil
 read-process-output-max (* 1024 1024)
 ;; Default line number width.
 display-line-numbers-width 3
 ;; Disable title bar text and icon for macos
 ns-use-proxy-icon  nil
 frame-title-format nil
 ;; Don't use Fcitx5 in Emacs in PGTK build
 pgtk-use-im-context-on-new-connection nil
 ;; Don't display compile warnings
 warning-suppress-log-types '((comp))
 ;; prefer y or n
 y-or-n-p-use-read-key t
 ;; Don't truncate lines in a window narrower than 65 chars.
 truncate-partial-width-windows 65
 ;; always follow link
 vc-follow-symlinks t
 ;; tab bar
 tab-bar-show nil
 tab-bar-new-tab-choice "*scratch*")


(setq package-enable-at-startup nil
      custom-file (expand-file-name "custom.el" user-emacs-directory)
      *font* "Operator Mono SSm Lig"
      *font-cn* "WenQuanYi Micro Hei"
      *font-unicode* "Apple Color Emoji"
      *font-height* (cond ((eq system-type 'darwin) 130)
                          (t 110)))

(provide 'init-defaults)
