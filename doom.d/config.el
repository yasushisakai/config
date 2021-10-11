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

;; citation
(setq bibtex-actions-bibliography '("~/Dropbox/bib/main.bib"))
