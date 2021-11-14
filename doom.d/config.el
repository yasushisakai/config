;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Yasushi Sakai"
      user-mail-address "yasushi@fastmail.com")

;; make emacs 'tile' when running in bspwm (it floats)
(setq frame-resize-pixelwise t)

;; Appearances
(setq doom-font (font-spec :family "HackGen35Nerd Console" :size 20)
      doom-variable-pitch-font (font-spec :family "Noto Sans CJK JP" :size 21 :weight 'semi-light))

(setq doom-theme 'doom-nord)

(setq display-line-numbers-type t)

;; easily move files when you have two panes of dired
(setq dired-dwim-target t)

;; org mode
;; needs to have this before org
(setq org-directory "~/org/")

;; org agenda filtering
(defun ys-org-skip-subtree-if-priority (priority)
  "Skip an agenda subtree if it has a priority of PRIORITY.
PRIORITY may be one of the characters ?A, ?B, or ?C."
  (let ((subtree-end (save-excursion (org-end-of-subtree t)))
        (pri-value (* 1000 (- org-lowest-priority priority)))
        (pri-current (org-get-priority (thing-at-point 'line t))))
    (if (= pri-value pri-current)
        subtree-end
      nil )))


(after! org
  (add-hook 'org-mode-hook 'visual-line-mode)
  (add-hook 'org-mode-hook 'variable-pitch-mode)
  (setq org-roam-directory org-directory)
  (setq org-cite-global-bibliography '("~/Dropbox/org/main.bib"))
  (setq org-roam-capture-templates '(
                                     ("d" "default" plain "%?" :target
                                      (file+head "${slug}.org" "#+title: ${title}
#+date: %<%Y-%m-%d %H:%M>
:drawer:
#+latex_class: japanese
#+FILETAGS: :draft:
:end:
")
                                      :unnarrowed t)))
(setq org-agenda-custom-commands
      '(("c" "Simple agenda view" ((tags "PRIORITY=\"A\""
                                         ((org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done))
                                          (org-agenda-overriding-header "High-priority undone tasks:")))
                                   (agenda "" ((org-agenda-span 8)
                                               (org-agenda-start-day "-1d")
                                               (org-deadline-warning-days 0)
                                               (org-agenda-start-on-weekday nil)
                                               (org-habit-show-habits-only-for-today t)))
                                   (alltodo ""
                                            ((org-agenda-skip-function
                                              '(or (ys-org-skip-subtree-if-priority ?A)
                                                   (org-agenda-skip-if nil '(scheduled deadline))))))))))


(setq org-latex-pdf-process(list "latexmk -f %f"))
)

(after! ox-latex
(add-to-list 'org-latex-classes
            '("japanese"
"\\RequirePackage{plautopatch}
\\documentclass[lualatex]{ltjsarticle}
\\usepackage{luatexja}"
              ("\\section{%s}" . "\\section*{%s}")
              ("\\subsection{%s}" . "\\subsection*{%s}")
              ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
              ("\\paragraph{%s}" . "\\paragraph*{%s}")
              ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))))

(use-package! mixed-pitch
  :hook
  (text-mode . mixed-pitch-mode))

