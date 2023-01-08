;;; auto-org-md-autoloads.el --- automatically extracted autoloads  -*- lexical-binding: t -*-
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "auto-org-md" "auto-org-md.el" (0 0 0 0))
;;; Generated autoloads from auto-org-md.el

(autoload 'auto-org-md-export "auto-org-md" nil nil nil)

(autoload 'auto-org-md-mode "auto-org-md" "\
cycle auto-org-md-mode between on/off

This is a minor mode.  If called interactively, toggle the
`Auto-org-md mode' mode.  If the prefix argument is positive,
enable the mode, and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate `auto-org-md-mode'.

The mode's hook is called both when the mode is enabled and when
it is disabled.

\(fn &optional ARG)" t nil)

(register-definition-prefixes "auto-org-md" '("auto-org-md-o"))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; auto-org-md-autoloads.el ends here
