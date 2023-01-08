(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("7f1d414afda803f3244c6fb4c2c64bea44dac040ed3731ec9d75275b9e831fe5" default))
 '(org-export-backends '(ascii html icalendar latex md odt))
 '(package-selected-packages
   '(jupyter ein conda tramp tramp-term helm-tramp hippie-exp-ext which-key helm-lsp helm-fuzzy helm-org use-package-chords markdown-mode pdf-tools solarized-theme smartparens python eglot)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'package)
(require 'org)

;; Add melpa package source when using package list
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)


;; Load emacs packages and activate them
;; This must come before configurations of installed packages.
;; Don't delete this line.
(package-initialize)

(require 'markdown-mode)
(require 'helm-org)
(require 'python)
(require 'hippie-exp-ext)
(require 'helm-fuzzy)
(require 'smartparens)
(require 'use-package)
(require 'tramp)
(require 'tramp-term)
(require 'ein)
(require 'conda)

;; disable splash
(setq inhibit-splash-screen t)

(setq tramp-default-method "ssh")

(load-theme 'solarized-dark t)

;; enable transient mark mode
(transient-mark-mode 1)

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

(global-set-key (kbd "C-c m") 'manu)
(global-set-key (kbd "C-c w d") 'wyndev)
(global-set-key (kbd "C-c w w") 'wyn)

;; from pragmaticemacs.wordpress.com
(global-set-key (kbd "C-c a") 'org-agenda)

(setq org-agenda-files (quote
  ("/Users/mromano/.spacemacs.d/todo.org"
   "/Users/mromano/Google Drive/My Drive/Notebook/research/")))

(setq org-highest-priority ?A)
(setq org-lowest-priority ?C)
(setq org-default-priority ?A)

(setq org-priority-faces '((?A . (:foreground
"#F0DFAF" :weight bold))
                         (?B . (:foreground
"LightSteelBlue"))
                         (?C . (:foreground
"OliveDrab"))))

(setq org-agenda-window-setup (quote current-window))

(define-key global-map (kbd "C-c c") 'org-capture)

(setq org-capture-templates
      '(("t" "todo" entry (file+headline "/Users/mromano/.spacemacs.d/todo.org" "Tasks") "* TODO [#A] %?")
      ("j" "Journal" entry (file+datetree "/Users/mromano/Google Drive/My Drive/Notebook/research/journal.org") "* %?\nEntered on %U\n  %i\n  %a")
      ("n" "Journal" entry (file+datetree "/Users/mromano/Google Drive/My Drive/Notebook/radiology/notes.org") "* %?\nEntered on %U\n  %i\n  %a"))
      )

(setq-default word-wrap t)
(global-visual-line-mode t)

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
  (org-download-method 'directory)
  (ord-download-image-dir "images")
  (org-download-heading-lvl nil)
  (org-download-timestamp "%Y%m%d-%H%M%S_")
  (org-image-actual-width 600)
  (org-download-screenshot-method "/opt/homebrew/bin/pngpaste %s")
  :bind
  ("C-M-y" . org-download-screenshot)
  :config
  (require 'org-download))

(when (fboundp 'electric-indent-mode) (electric-indent-mode -1))

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
 '(org-capture-templates
   '(("t" "todo" entry
      (file+headline "/Users/mromano/.spacemacs.d/todo.org" "Tasks")
      "* TODO [#A] %?")
     ("j" "ResearchJournal" entry
      (file+olp+datetree "/Users/mromano/Google Drive/My Drive/Notebook/research/journal.org")
      "* %?
Entered on %U
  %i
  %a")
     ("n" "RadiologyNotes" entry
      (file+olp+datetree "/Users/mromano/Google Drive/My Drive/Notebook/radiology/notes.org")
      "* %?
Entered on %U")
     ("g" "RadioGraphics" entry
      (file "/Users/mromano/Google Drive/My Drive/Notebook/radiology/rg.org")
      "* %? %^g
Entered on %U")))

(add-to-list 'default-frame-alist '(fullscreen . maximized))

(setq initial-scratch-message "")
