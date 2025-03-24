;;; -*- lexical-binding: t -*-

(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Company mode
(setq company-idle-delay 0)
(setq company-minimum-prefix-length 1)

;; Checker Backend
; (add-hook 'after-init-hook #'global-flycheck-mode)

;;; Clojure
(add-hook 'clojure-mode-hook #'eglot-ensure)
(add-hook 'clojurescript-mode-hook #'eglot-ensure)
(add-hook 'clojurec-mode-hook #'eglot-ensure)

;;; Typescript
;;;; https://emacs.stackexchange.com/a/12406
(add-hook 'typescript-ts-mode-hook #'yas-minor-mode)
(add-hook 'typescript-ts-mode-hook #'yas-minor-mode)
(add-hook 'typescript-ts-mode-hook #'eglot-ensure)
(add-hook 'typescript-ts-mode-hook #'eglot-ensure)
;;;; Associate `.ts' files with major mode `typescript-mode'
(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-ts-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . typescript-ts-mode))

;;; Go
;;;; Set up before-save hooks to format buffer and add/delete imports.
(defun lsp-go-install-save-hooks ()
  (add-hook 'before-save-hook #'lsp-format-buffer t t)
  (add-hook 'before-save-hook #'lsp-organize-imports t t))
; (add-hook 'go-mode-hook #'lsp-go-install-save-hooks)
;;;; Start LSP Mode and YASnippet mode
(add-hook 'go-mode-hook #'eglot-ensure)
(add-hook 'go-mode-hook #'yas-minor-mode)

(setq gc-cons-threshold (* 100 1024 1024)
      read-process-output-max (* 1024 1024)
      treemacs-space-between-root-nodes nil
      company-minimum-prefix-length 1)

(use-package paredit
  :bind ("C-c )" . paredit-mode))

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
	  embark-theme exec-path-from-shell flycheck flycheck-eglot
	  flycheck-posframe go-mode kkp lsp-mode lsp-treemacs lsp-ui
	  magit orderless paredit projectile slime slime-company
	  tree-sitter tree-sitter-langs vertico wgrep
	  whitespace-cleanup-mode yasnippet))
 '(warning-suppress-types '((use-package) (use-package))))

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

;; Copilot
(use-package copilot
  :vc (:url "https://github.com/copilot-emacs/copilot.el"
            :rev :newest
            :branch "main"))
;; (add-hook 'prog-mode-hook 'copilot-mode)
(define-key copilot-completion-map (kbd "<tab>") 'copilot-accept-completion)
(define-key copilot-completion-map (kbd "TAB") 'copilot-accept-completion)

(electric-pair-mode)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(whitespace-empty ((t (:extend t :background "gray30" :foreground "black"))))
 '(whitespace-indentation ((t (:foreground "gray30"))))
 '(whitespace-line ((t nil)))
 '(whitespace-missing-newline-at-eof ((t (:background "gray30" :foreground "black"))))
 '(whitespace-newline ((t (:foreground "dimgray" :weight normal))))
 '(whitespace-space ((t (:foreground "gray30"))))
 '(whitespace-space-after-tab ((t (:background "gray30" :foreground "black"))))
 '(whitespace-space-before-tab ((t (:background "gray30" :foreground "black"))))
 '(whitespace-tab ((t (:background "gray20" :foreground "white"))))
 '(whitespace-trailing ((t (:background "gray30" :foreground "black" :weight bold)))))
; (global-whitespace-mode)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(with-eval-after-load 'prog-mode
  (with-eval-after-load 'flymake
    (define-key prog-mode-map (kbd "M-n") 'flymake-goto-next-error)
    (define-key prog-mode-map (kbd "M-p") 'flymake-goto-prev-error)))
(add-hook 'after-init-hook 'global-company-mode)

(tool-bar-mode -1)

;; Common Lisp FTW
(setq inferior-lisp-program "sbcl")

(use-package slime-company
  :after (slime company)
  :config (setq slime-company-completion 'fuzzy
                slime-company-after-completion 'slime-company-just-one-space))
(slime-setup '(slime-fancy slime-company))
