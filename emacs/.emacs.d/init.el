;;; -*- lexical-binding: t -*-

(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Company mode
(setq company-idle-delay 0)
(setq company-minimum-prefix-length 1)

;; Checker Backend
(add-hook 'after-init-hook #'global-flycheck-mode)

;; lsp-mode

(setq lsp-signature-render-documentation nil)

;;; Clojure
(add-hook 'clojure-mode-hook #'lsp-deferred)
(add-hook 'clojurescript-mode-hook #'lsp-deferred)
(add-hook 'clojurec-mode-hook #'lsp-deferred)

;;; Typescript
;;;; https://emacs.stackexchange.com/a/12406
(add-hook 'typescript-ts-mode-hook #'lsp-deferred)
(add-hook 'typescript-ts-mode-hook #'yas-minor-mode)
;;;; Associate `.ts' files with major mode `typescript-mode'
(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-ts-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . typescript-ts-mode))

;;; Go
;;;; Set up before-save hooks to format buffer and add/delete imports.
(defun lsp-go-install-save-hooks ()
  (add-hook 'before-save-hook #'lsp-format-buffer t t)
  (add-hook 'before-save-hook #'lsp-organize-imports t t))
(add-hook 'go-mode-hook #'lsp-go-install-save-hooks)
;;;; Start LSP Mode and YASnippet mode
(add-hook 'go-mode-hook #'lsp-deferred)
(add-hook 'go-mode-hook #'yas-minor-mode)

(setq gc-cons-threshold (* 100 1024 1024)
      read-process-output-max (* 1024 1024)
      treemacs-space-between-root-nodes nil
      company-minimum-prefix-length 1)

;; Paredit
(autoload 'enable-paredit-mode "paredit"
  "Turn on pseudo-structural editing of Lisp code."
  t)
(add-hook 'emacs-lisp-mode-hook       'enable-paredit-mode)
(add-hook 'lisp-mode-hook             'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook 'enable-paredit-mode)
(add-hook 'scheme-mode-hook           'enable-paredit-mode)
(add-hook 'clojure-mode-hook          'enable-paredit-mode)
(add-hook 'clojurescript-mode-hook    'enable-paredit-mode)
(add-hook 'clojurec-mode-hook         'enable-paredit-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("390080494f00e19e9c1f0b3bb8343f6104cad6c5bb8ffad953b6e849793424d7"
     default))
 '(package-selected-packages
   '(affe cider clojure-mode company consult embark embark-consult
	  embark-theme exec-path-from-shell flycheck go-mode kkp
	  lsp-mode lsp-treemacs lsp-ui magit orderless paredit
	  projectile tree-sitter tree-sitter-langs vertico wgrep
	  whitespace-cleanup-mode yasnippet))
 '(warning-suppress-types '((use-package) (use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Show line number
(global-display-line-numbers-mode)

;; Set environment variables
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

;; Kitty Keyboard Protocol
(use-package kkp
  :config
  (global-kkp-mode 1))

(load-theme 'embark)

;; Backup directory
(setq backup-directory-alist '(("." . "~/.emacs.d/backup")))
;; Autosave directory
(setq auto-save-file-name-transforms
      `((".*" "~/.emacs.d/auto-save/" t)))

;; Exclude init.el from flycheck target
(setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc))

;; Projectile
(projectile-mode +1)
;; Recommended keymap prefix on macOS
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
;; Whitespace
;; (global-whitespace-mode) -- TODO

;; Enable Vertico.
(use-package vertico
  :custom
  (vertico-scroll-margin 0) ;; Different scroll margin
  ;; (vertico-count 20) ;; Show more candidates
  ;; (vertico-resize t) ;; Grow and shrink the Vertico minibuffer
  ;; (vertico-cycle t) ;; Enable cycling for `vertico-next/previous'
  :init
  (vertico-mode))

(use-package consult
  :ensure t
  :bind
  (("C-c r" . consult-ripgrep)))

(use-package embark
  :ensure t
  :bind
  (("C-c a" . embark-act)))

(use-package embark-consult
  :after (embark consult))

(use-package wgrep
  :ensure t)

;; Persist history over Emacs restarts. Vertico sorts by history position.
(use-package savehist
  :init
  (savehist-mode))

;; Emacs minibuffer configurations.
(use-package emacs
  :custom
  ;; Support opening new minibuffers from inside existing minibuffers.
  (enable-recursive-minibuffers t)
  ;; Hide commands in M-x which do not work in the current mode.  Vertico
  ;; commands are hidden in normal buffers. This setting is useful beyond
  ;; Vertico.
  (read-extended-command-predicate #'command-completion-default-include-p)
  ;; Do not allow the cursor in the minibuffer prompt
  (minibuffer-prompt-properties
   '(read-only t cursor-intangible t face minibuffer-prompt)))

;; Optionally use the `orderless' completion style.
(use-package orderless
  :custom
  ;; Configure a custom style dispatcher (see the Consult wiki)
  ;; (orderless-style-dispatchers '(+orderless-consult-dispatch orderless-affix-dispatch))
  ;; (orderless-component-separator #'orderless-escapable-split-on-space)
  (completion-styles '(orderless basic))
  (completion-category-defaults nil)
  (completion-category-overrides '((file (styles partial-completion)))))

;; Flex orderless power
(setq orderless-matching-styles '(orderless-flex))

;; Show search occurances
(setq isearch-lazy-count t)

;; Highlight line
(global-hl-line-mode)

(use-package affe
  :config
  ;; Manual preview key for `affe-grep'
  (consult-customize affe-grep :preview-key "M-."))

(defun affe-orderless-regexp-compiler (input _type _ignorecase)
  (setq input (cdr (orderless-compile input)))
  (cons input (apply-partially #'orderless--highlight input t)))
(setq affe-regexp-compiler #'affe-orderless-regexp-compiler)

