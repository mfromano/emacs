;;; helm-fuzzy-autoloads.el --- automatically extracted autoloads  -*- lexical-binding: t -*-
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "helm-fuzzy" "helm-fuzzy.el" (0 0 0 0))
;;; Generated autoloads from helm-fuzzy.el

(defvar helm-fuzzy-mode nil "\
Non-nil if Helm-Fuzzy mode is enabled.
See the `helm-fuzzy-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `helm-fuzzy-mode'.")

(custom-autoload 'helm-fuzzy-mode "helm-fuzzy" nil)

(autoload 'helm-fuzzy-mode "helm-fuzzy" "\
Minor mode 'helm-fuzzy-mode'.

This is a minor mode.  If called interactively, toggle the
`Helm-Fuzzy mode' mode.  If the prefix argument is positive,
enable the mode, and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate `(default-value \\='helm-fuzzy-mode)'.

The mode's hook is called both when the mode is enabled and when
it is disabled.

\(fn &optional ARG)" t nil)

(register-definition-prefixes "helm-fuzzy" '("helm-fuzzy-"))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; helm-fuzzy-autoloads.el ends here
