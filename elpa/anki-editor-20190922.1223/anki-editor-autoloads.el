;;; anki-editor-autoloads.el --- automatically extracted autoloads  -*- lexical-binding: t -*-
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "anki-editor" "anki-editor.el" (0 0 0 0))
;;; Generated autoloads from anki-editor.el

(autoload 'anki-editor-mode "anki-editor" "\
anki-editor-mode

This is a minor mode.  If called interactively, toggle the
`anki-editor mode' mode.  If the prefix argument is positive,
enable the mode, and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate `anki-editor-mode'.

The mode's hook is called both when the mode is enabled and when
it is disabled.

\(fn &optional ARG)" t nil)

(register-definition-prefixes "anki-editor" '("anki-editor-"))

;;;***

;;;### (autoloads nil "fix-notes-0.3" "fix-notes-0.3.el" (0 0 0 0))
;;; Generated autoloads from fix-notes-0.3.el

(register-definition-prefixes "fix-notes-0.3" '("anki-editor-fix-"))

;;;***

;;;### (autoloads nil nil ("anki-editor-pkg.el") (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; anki-editor-autoloads.el ends here
