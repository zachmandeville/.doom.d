(exec-path-from-shell-initialize)

(setq user-full-name "Zach Mandeville"
      user-mail-address "zz@ii.coop")

(setq doom-localleader-key ",")

(setq doom-font (font-spec :family "Recursive Mono Casual Static" :size 16 :weight 'light)
     ;; )(font-spec :family "Source Code Pro" :size 8 :weight 'semi-light)
     doom-variable-pitch-font (font-spec :family "Recursive Sans Casual Static" :size 16)
     doom-unicode-font (font-spec :family "Recursive Mono Casual Static" :size 16))

(setq doom-theme 'doom-one)

(use-package! lsp-ui
:config
          (setq lsp-navigation 'both)
          (setq lsp-ui-doc-enable t)
          (setq lsp-ui-doc-position 'top)
          (setq lsp-ui-doc-alignment 'frame)
          (setq lsp-ui-doc-use-childframe t)
          (setq lsp-ui-doc-use-webkit t)
          (setq lsp-ui-doc-delay 0.2)
          (setq lsp-ui-doc-include-signature nil)
          (setq lsp-ui-sideline-show-symbol t)
          (setq lsp-ui-remap-xref-keybindings t)
          (setq lsp-ui-sideline-enable t)
          (setq lsp-prefer-flymake nil)
          (setq lsp-print-io t))

(setq display-line-numbers-type t)

(setq standard-indent 2)

(add-to-list 'initial-frame-alist '(fullscreen . maximized))

(defun ek/babel-ansi ()
  (when-let ((beg (org-babel-where-is-src-block-result nil nil)))
    (save-excursion
      (goto-char beg)
      (when (looking-at org-babel-result-regexp)
        (let ((end (org-babel-result-end))
              (ansi-color-context-region nil))
          (ansi-color-apply-on-region beg end))))))
(add-hook 'org-babel-after-execute-hook 'ek/babel-ansi)

(setq org-directory "~/org/")
(setq org-roam-directory "~/org/roam/")

(setq web-mode-enable-auto-closing t)
(setq-hook! web-mode web-mode-auto-close-style 2)

(setq org-babel-default-header-args:sql-mode
      '((:results . "replace code")
        (:product . "postgres")
        (:wrap . "SRC example")))

(setq org-babel-default-header-args:go
      '((:results . "replace code")
        (:wrap . "SRC example")))

(use-package! graphviz-dot-mode)
(use-package! sql)
(use-package! ii-utils)
(use-package! ii-pair)
(after! ii-pair (osc52-set-cut-function))

(require 'ox-gfm)

(setq org-babel-default-header-args
      '((:session . "none")
        (:results . "replace code")
        (:comments . "org")
        (:exports . "both")
        (:eval . "never-export")
        (:tangle . "no")))

(setq org-babel-default-header-args:shell
      '((:results . "output code verbatim replace")
        (:wrap . "example")))
