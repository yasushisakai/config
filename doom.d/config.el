;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Yasushi Sakai"
      user-mail-address "yasushi@fastmail.com")

;; make emacs 'tile' when running in bspwm (it floats)
(setq frame-resize-pixelwise t)

;; Appearances
(setq doom-font (font-spec :family "HackGen35Nerd Console" :size 14)
      doom-variable-pitch-font (font-spec :family "Noto Sans CJK JP" :size 15 :weight 'semi-light))

(setq doom-theme 'doom-nord)

(setq display-line-numbers-type t)

;; easily move files when you have two panes of dired
(setq dired-dwim-target t)

;; org mode
;; this is symlinked to ~/Dropbox/org
(setq org-directory "~/org/")

;; org mode is org-roam
(setq org-roam-directory org-directory)

(add-hook 'org-mode-hook 'visual-line-mode)
(add-hook 'org-mode-hook 'variable-pitch-mode)

;; email
(setq +notmuch-sync-backend 'mbsync)

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
