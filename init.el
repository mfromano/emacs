(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("7f1d414afda803f3244c6fb4c2c64bea44dac040ed3731ec9d75275b9e831fe5" default))
 '(org-agenda-files
   '("/Users/mromano/Sync/todo.org" "/Users/mromano/Sync/Notebook/research/journal.org" "/Users/mromano/Sync/Notebook/radiology/notes.org" "/Users/mromano/Sync/Notebook/habits.org" "/Users/mromano/Sync/Notebook/calendar.org"))
 '(org-agenda-loop-over-headlines-in-active-region nil)
 '(org-agenda-window-setup 'current-window)
 '(org-capture-templates
   '(("t" "todo" entry
      (file+headline "/Users/mromano/Sync/todo.org" "Tasks")
      "* TODO [#A] %?")
     ("j" "ResearchJournal" entry
      (file+olp+datetree "/Users/mromano/Sync/Notebook/research/journal.org")
      "* %?
Entered on %U
  %i
  %a")
     ("n" "RadiologyNotes" entry
      (file+olp+datetree "/Users/mromano/Sync/Notebook/radiology/notes.org")
      "* %?
Entered on %U
  %i
  %a")
     ("b" "Journal" entry
      (file "/Users/mromano/Sync/Notebook/diary.org")
      "* %?
	    Entered on %U")
     ("h" "Habit" entry
      (file "/Users/mromano/Sync/Notebook/habits.org")
      "* TODO %?
SCHEDULED: <%<%Y-%m-%d %A> .+%^{Frequency?|1}d>
:PROPERTIES:
:STYLE: habit
:END:
Started on %U")
     ("c" "Calendar" entry
      (file "~/Sync/notebook/calendar.org")
      "* TODO %?")))
 '(org-export-backends '(ascii html icalendar latex md odt))
 '(org-modules
   '(ol-bbdb ol-bibtex ol-docview ol-doi ol-eww ol-gnus org-habit ol-info ol-irc ol-mhe ol-rmail ol-w3m))
 '(org-priority-default 65)
 '(org-todo-keywords
   '((sequence "TODO(t)" "WAITING(w)" "|" "DONE(d)" "CANCELLED(c)")))
 '(package-selected-packages
   '(tree-sitter jupyter ein jekyll-modes yaml-mode yaml ## cyberpunk-theme evil ess poly-markdown js2-mode anki-editor org-bullets anki-connect ac-helm tramp tramp-term which-key use-package-chords pdf-tools python))
 '(pdf-view-continuous t)
 '(warning-suppress-types '((ein))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'package)

;; Add melpa package source when using package list
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)


;; Load emacs packages and activate them
;; This must come before configurations of installed packages.
;; Don't delete this line.
(package-initialize)

(require 'helm)
(require 'use-package)
(require 'org-habit)

(setq inhibit-splash-screen t)
(tool-bar-mode -1)
(setq tramp-default-method "ssh")

(when (fboundp 'electric-indent-mode) (electric-indent-mode -1))
(setq initial-scratch-message "")

;; APPEARANCE
(load-theme 'cyberpunk t)
(set-face-attribute 'default (selected-frame) :height 150)

;; modes 
(setq-default word-wrap t)
(global-visual-line-mode t)
(which-key-mode t)
(add-to-list 'auto-mode-alist '("\\.md\\'" . jekyll-markdown-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . jekyll-html-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'auto-mode-alist '("\\.r\\'" . ess-r-mode))
(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
(global-auto-complete-mode t)
(evil-mode 1)

;; custom functions for SSH

(defun manu ()
  (interactive)
  (dired "/ssh:mfromano@manu.bumc.bu.edu:~"))

(defun echo ()
  (interactive)
  (dired "/ssh:mfromano@echo.bumc.bu.edu:~"))

(defun ayan ()
  (interactive)
  (dired "/ssh:mfromano@ayan.bumc.bu.edu:~"))

(defun wyn ()
  (interactive)
  (dired "/ssh:mfromano@plog1.wynton.ucsf.edu:~/Research"))

(defun wyndev ()
  (interactive)
  (dired "/ssh:mfromano@pdev1.wynton.ucsf.edu:~/Research"))

(defun research-notes ()
  (interactive)
  (shell-command "bash $HOME/research/utils/new_journal_date.sh"))

;; Shortcuts
(global-set-key (kbd "C-c m") 'manu)
(global-set-key (kbd "C-c w d") 'wyndev)
(global-set-key (kbd "C-c w w") 'wyn)
(global-set-key (kbd "C-x C-f") #'helm-find-files)
(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c s") 'tramp-term)
(global-set-key (kbd "C-c t") 'shell)

;;Exit insert mode by pressing j and then j quickly
(setq key-chord-two-keys-delay 0.5)
(key-chord-define evil-insert-state-map "jj" 'evil-normal-state)
(key-chord-mode 1)


;; set jupyter settings

(setq ein:jupyter-default-server-command "/Users/mromano/opt/anaconda3/bin/jupyter")

;; ORG MODE PREFERENCES
(setq org-agenda-files
  (quote ("/Users/mromano/Sync/todo.org"
   "/Users/mromano/Sync/Notebook/research/journal.org"
   "/Users/mromano/Sync/Notebook/radiology/notes.org"
   "/Users/mromano/Sync/Notebook/diary.org"
   "/Users/mromano/Sync/Notebook/habits.org"
   "/Users/mromano/Sync/Notebook/calendar.org"
)))

(setq org-todo-keywords '((sequence "TODO(t)" "WAITING(w)" "|" "DONE(d)" "CANCELLED(c)")))
(setq org-highest-priority ?A)
(setq org-lowest-priority ?C)
(setq org-default-priority ?A)
(setq org-priority-faces
   '((?A . (:foreground "#F0DFAF" :weight bold))
     (?B . (:foreground "LightSteelBlue"))
     (?C . (:foreground "OliveDrab"))))
(setq org-agenda-window-setup 'current-window)

(use-package pdf-tools
  :pin manual
  :config
  (pdf-tools-install)
  (setq-default pdf-view-display-size 'fit-width)
  (define-key pdf-view-mode-map (kbd "C-s") 'isearch-forward)
  :custom
  (pdf-annot-activate-created-annotations t "automatically annotate highlights")
  (require 'pdf-tools)
  )

 ;; config lines below from zzamboni.org/post, "How to insert screenshots in Org documents on macOS"
(use-package org-download
  :after org
  :defer nil
  :custom
  (org-download-method 'attach)
  (ord-download-image-dir "images")
  (org-download-heading-lvl nil)
  (org-download-timestamp "%Y%m%d-%H%M%S_")
  (org-image-actual-width 600)
  (org-download-screenshot-method "/opt/homebrew/bin/pngpaste %s")
  :bind
  ("C-M-y" . org-download-screenshot)
  :config
  (require 'org-download))

(add-hook 'after-init-hook (lambda () (execute-kbd-macro (kbd "C-c a n"))))
(setenv "TZ" "America/Los_Angeles")
