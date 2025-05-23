;; -*- lexical-binding: t; -*-
;; Note: This file is automatically generated from init.org.
;; Please do not edit this file directly but init.org instead.

(dolist (symbol '(dired-find-alternate-file
                  downcase-region
                  eval-expression
                  narrow-to-page
                  narrow-to-region
                  scroll-left
                  upcase-region))
  (put symbol 'disable nil))

(add-to-list 'load-path (expand-file-name "scripts/" (file-name-directory load-file-name)))

;;;;* Load Customizations
(unless (and (boundp 'custom-file)
             custom-file
             (file-writable-p custom-file))
  (let ((default-custom-file (expand-file-name "custom.el"
					       (file-name-directory load-file-name))))
    (setq custom-file default-custom-file)))

(when (eql system-type 'windows-nt)
  (defvar oa-proxy-connect:*process* nil
    "Contains the process of ch.swisslife.ProxyConnect.")
  (defun oa-proxy-connect:start ()
    "Start ProxyConnect and return the process object."
    (interactive)
    (unless (process-live-p oa-proxy-connect:*process*)
      (setq oa-proxy-connect:*process* (start-process "ProxyConnect" nil "ProxyConnect"))))
  (defun oa-proxy-connect:stop ()
    "Stop ProxyConnect and return `true' if a running process has been stopped, `nil' else."
    (interactive)
    (when-let ((livep (process-live-p oa-proxy-connect:*process*)))
      (delete-process oa-proxy-connect:*process*)
      (setq oa-proxy-connect:*process* nil)
      livep))
  (setopt url-proxy-services
          '(("no_proxy" . "^\\\\(.*[.]slcloud.ch\\\\|localhost\\\\|10\\\\..*\\\\|192\\\\.168\\\\..*\\\\)")
            ("http" . "localhost:8080")
            ("https" . "localhost:8080")))
  (oa-proxy-connect:start))

(require 'package)

(setopt package-archives
        '(("gnu" . "https://elpa.gnu.org/packages/")
          ("melpa" . "https://melpa.org/packages/")
          ("org" . "https://orgmode.org/elpa/"))
        package-check-signature nil
        package-selected-packages nil)

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setopt use-package-always-ensure t)

(use-package emacs
  :ensure nil
  :custom
  (current-language-environment "UTF-8")
  (savehist-mode t)
  (recentf-mode t)
  (recentf-save-file "~/.config/emacs/recentf")
  (recentf-exclude '(".*/[.]recentf\\'"))
  (search-whitespace-regexp ".*?")
  (isearch-allow-scroll t)
  (isearch-lazy-count t)
  (show-paren-style 'expression)
  (enable-recursive-minibuffers t)
  (minibuffer-depth-indicate-mode t)
  (mouse-autoselect-window -0.25)
  (focus-follows-mouse 'auto-raise)
  (indent-tabs-mode nil)
  (use-file-dialog nil)
  (use-dialog-box nil)
  (pop-up-windows nil)
  (column-number-mode t)
  (global-display-line-numbers-mode t))

(use-package general)

(use-package all-the-icons)

(use-package vertico
  :custom
  (vertico-cycle t)
  (vertico-mode 1))

(use-package marginalia
  :custom (marginalia-mode 1))

(use-package all-the-icons-completion
  :after all-the-icons
  :custom (all-the-icons-completion-mode 1))

(use-package orderless
  :custom
  (completion-styles '(orderless))
  (completion-category-defaults nil)    ; I want to be in control!
  (orderless-component-separator 'orderless-escapable-split-on-space)
  (orderless-matching-styles
   '(orderless-literal
     orderless-prefixes
     orderless-initialism
     orderless-regexp
     ;; orderless-flex
     ;; orderless-strict-leading-initialism
     ;; orderless-strict-initialism
     ;; orderless-strict-full-initialism
     ;; orderless-without-literal          ; Recommended for dispatches instead
     ))
  (orderless-style-dispatchers
   '(prot-orderless-literal-dispatcher
     prot-orderless-strict-initialism-dispatcher
     prot-orderless-flex-dispatcher))
  :config
  (load-file (expand-file-name "~/.config/emacs/scripts/orderless-utils.el")))

(use-package consult)

(use-package embark
  :bind (("C-." . embark-act)
         :map minibuffer-local-map
              ("C-c C-c" . embark-collect)
              ("C-c C-e" . embark-export)))

(use-package embark-consult)

(use-package corfu
  :init
  (defun corfu-maybe-enable-in-minibuffer ()
    "Enable Corfu in some minibuffers."
    (when (local-variable-p 'completion-at-point-functions)
      (setq-local corfu-auto t)
      (setq-local corfu-echo-delay nil)
      (corfu-mode 1)))
  :config
  (add-hook 'minibuffer-setup-hook #'corfu-maybe-enable-in-minibuffer)
  (global-corfu-mode)
  (corfu-popupinfo-mode))

(use-package which-key
  :config (which-key-mode)
  :diminish which-key-mode
  :custom (which-key-idle-delay 0.5))

(use-package helpful
  :ensure t
  :bind
  ([remap describe-function] . helpful-callable)
  ([remap describe-command] . helpful-command)
  ([remap describe-variable] . helpful-variable)
  ([remap describe-key] . helpful-key))

(use-package ace-window
  :bind
  (("C-$" . ace-window))
  :custom
  (aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l)))

(use-package wgrep
  :bind
  (:map grep-mode-map
        ("e" . wgrep-change-to-wgrep-mode)
        ("C-x C-q" . wgrep-change-to-wgrep-mode)
        ("C-c C-c" . wgrep-finish-edit)))

(use-package rg)

(use-package multiple-cursors)

(use-package iedit
  :config
  (defun iedit-dwim (arg)
    "Starts iedit but uses \\[narrow-to-defun] to limit its scope."
    (interactive "P")
    (if arg
        (iedit-mode)
      (save-excursion
        (save-restriction
          (widen)
          ;; this function determines the scope of `iedit-start'.
          (if iedit-mode
              (iedit-done)
            ;; `current-word' can of course be replaced by other
            ;; functions.
            (narrow-to-defun)
            (iedit-start (format "\\_<%s\\_>" (current-word)) (point-min) (point-max)))))))
  :bind
  (( "C-;" . iedit-dwim)))

(use-package magit
  :custom
  (magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1))

(use-package ediff
  :custom
  (ediff-keep-variants nil)
  (ediff-make-buffers-readonly-at-startup nil)
  (ediff-merge-revisions-with-ancestor t)
  (ediff-show-clashes-only t)
  (ediff-window-setup-function 'ediff-setup-windows-plain))

(use-package magit-filenotify)

(use-package git-timemachine)

(use-package git-modes)

(use-package git-gutter
  :hook (prog-mode . git-gutter-mode)
  :config
  (setq git-gutter:update-interval 0.02))

(use-package git-gutter-fringe
  :config
  (define-fringe-bitmap 'git-gutter-fr:added [224] nil nil '(center repeated))
  (define-fringe-bitmap 'git-gutter-fr:modified [224] nil nil '(center repeated))
  (define-fringe-bitmap 'git-gutter-fr:deleted [128 192 224 240] nil nil 'bottom))

(use-package swagg
  :custom
  swagg-definitions
  '((:name "FI-R-GIT"
           :base "http://fi-r-git.slcloud.ch/api/v1"
           :json "http://fi-r-git.slcloud.ch/swagger.v1.json"
           :headers (("Authorization" . "token c41ffd470c3211c0bd773d79d1e152273f62f1a1")))
    (:name "GitHub"
           :json "https://raw.githubusercontent.com/github/rest-api-description/main/descriptions/api.github.com/api.github.com.json"
           :base "https://api.github.com")
    (:name "GitLab"
           :yaml "https://gitlab.com/gitlab-org/gitlab/-/raw/master/doc/api/openapi/openapi.yaml"
           :base "https://gitlab.com/api")))

(use-package impatient-showdown
  :custom
  (httpd-port 80)
  (impatient-showdown-scripts (cl-remove-duplicates (cl-list* "https://polyfill.io/v3/polyfill.min.js?features=es6"
                                                              "https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js"
                                                              "https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.4/latest.js?config=AM_CHTML"
                                                              "http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-MML-AM_HTMLorMML"
                                                              (when (boundp 'impatient-showdown-scripts)
                                                                impatient-showdown-scripts))
                                                    :test 'string=))
  (impatient-showdown-flavor 'github))

(use-package org
  :pin org

  :hook
  ((org-mode . variable-pitch-mode)
   (org-mode . visual-line-mode)
   (org-mode . org-indent-mode))

  :bind
  ("C-c j" . (lambda () (interactive) (org-capture nil "jj")))

  :config

  (require 'org-habit)
  (add-to-list 'org-modules 'org-habit)
  ;;(advice-add 'org-refile :after 'org-save-all-org-buffers)
  ;; Replace list hyphen with dot
  (font-lock-add-keywords 'org-mode
                          '(("^ *\\([-]\\) "
                             (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

  :custom
  (org-M-RET-may-split-line '((default . nil)))
  (org-insert-heading-respect-content t)
  (org-ellipsis " ▾")
  (org-hide-emphasis-markers t)
  (org-highlight-latex-and-related '(latex script entities))

  :custom-face
  (org-block ((t (:inherit fixed-pitch))))
  (org-table ((t (:inherit fixed-pitch))))
  (org-formula ((t (:inherit fixed-pitch))))
  (org-code ((t (:inherit fixed-pitch))))
  (org-latex-and-related ((t (:inherit fixed-pitch))))
  (org-table ((t (:inherit fixed-pitch))))
  (org-verbatim ((t (:inherit fixed-pitch))))
  (org-special-keyword ((t (:inherit (font-lock-comment-face fixed-pitch)))))
  (org-meta-line ((t (:inherit (font-lock-comment-face fixed-pitch)))))
  (org-checkbox ((t (:inherit fixed-pitch)))))

(use-package org-bullets
  :after org
  :hook (org-mode . org-bullets-mode)
  :custom
  (org-bullets-bullet-list '("◉" "○" "●" "○" "●" "○" "●")))

(use-package visual-fill-column
  :after org
  :hook (org-mode . visual-fill-column-mode)
  :custom
  (visual-fill-column-width 100)
  (visual-fill-column-center-text t))

(use-package org-download
  :after (org dired)
  :hook (dired-mode . org-download-enable))

(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (python . t)))

(push '("conf-unix" . conf-unix) org-src-lang-modes)

;; This is needed as of Org 9.2
(require 'org-tempo)

(dolist (template '(("sh" . "src shell")
                    ("el" . "src emacs-lisp")
                    ("py" . "src python")))
  (add-to-list 'org-structure-template-alist template))

(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :hook
  ((lsp-mode . lsp-headerline-breadcrumb-mode)
   (lsp-mode . (lambda ()
      	   (keymap-local-set lsp-keymap-prefix lsp-command-map)))
   (lsp-mode . lsp-enable-which-key-integration))
  :custom
  (lsp-keymap-prefix "C-c l"))

(use-package lsp-ui
  :hook (lsp-mode . lsp-ui-mode)
  :custom
  (lsp-ui-doc-position 'bottom))

(use-package lsp-treemacs
  :after lsp)

(defun oa:init-isearch-mode-map ()
  (make-local-variable 'isearch-mode-map)
  (define-key isearch-mode-map "\C-w" 'isearch-yank-symbol-or-char))

(add-hook 'emacs-lisp-mode-hook 'oa:init-isearch-mode-map)
(add-hook 'lisp-mode-hook 'oa:init-isearch-mode-map)

(use-package macrostep)

(use-package paren-face
  :config (global-paren-face-mode)
  :custom-face
  (parenthesis ((t (:foreground "DodgerBlue4")))))

(use-package highlight-parentheses
  :config
  (global-highlight-parentheses-mode)
  :hook
  ((emacs-lisp-mode lisp-mode) . highlight-parentheses-mode)
  :custom
  (highlight-parentheses-colors
   '("gold1" "orange1" "IndianRed2" "Purple2" "SteelBlue" "dark slate gray")))

(use-package highlight-stages
  :hook ((emacs-lisp-mode lisp-mode) . highlight-stages-mode)
  :custom
  (highlight-stages-highlight-real-quote nil)
  :custom-face
  (highlight-stages-negative-level-face ((((background light))
                                          :background "#ffdfdf")
                                         (t :background "red4")))
  (highlight-stages-level-1-face ((((background light))
                                   :background "#ffffbf")
                                  (t :background "#051020")))
  (highlight-stages-level-2-face ((((background light))
                                   :background "#efffcf")
                                  (t :background "#101015")))
  (highlight-stages-level-3-face ((((background light))
                                   :background "#dfffdf")
                                  (t :background "#151010")))
  (highlight-stages-higher-level-face ((((background light))
                                        :background "#cfffef")
                                       (t :background "#201005"))))

(use-package paredit
  :bind (:map paredit-mode-map
              ([return] . paredit-newline)
              ([C-return] . comment-indent-new-line))
  :hook
  ((emacs-lisp-mode lisp-mode) . paredit-mode))

(add-hook 'emacs-lisp-mode-hook 'eldoc-mode)
(add-hook 'lisp-interaction-mode-hook
          (lambda () (local-set-key [C-S-return] 'eval-print-last-sexp)))

(add-hook 'lisp-mode-hook
          (lambda () (setq lisp-indent-function 'common-lisp-indent-function)))

(use-package sly)

(use-package sly-quicklisp)

(use-package sly-named-readtables)

(use-package sly-macrostep)

(use-package sly-asdf)

(load (expand-file-name ".roswell/helper.el" "~/") t)

(add-hook (derived-mode-hook-name 'shell-mode)
          (lambda () (set-buffer-process-coding-system 'cp850-dos 'cp850-dos)))

(use-package eshell-git-prompt)

(use-package eshell
  :config
  (eshell-git-prompt-use-theme 'powerline)
  :custom
  (eshell-modules-list
   '(eshell-alias eshell-banner eshell-basic eshell-cmpl eshell-dirs eshell-glob eshell-hist eshell-ls eshell-pred eshell-prompt eshell-rebind eshell-script eshell-smart eshell-term eshell-unix)))

(use-package dired
  :ensure nil
  :commands (dired dired-jump)
  :bind (("C-x C-j" . dired-jump))
  :custom
  (dired-auto-revert-buffer #'dired-directory-changed-p)
  (dired-make-directory-clickable t)
  (dired-recursive-copies 'always)
  (dired-recursive-deletes 'always)
  (delete-by-moving-to-trash t)
  (dired-dwim-target t)
  (dired-listing-switches "-AGFhlv --group-directories-first --time-style=iso --dired --color"))

(use-package dired-git-info)

(use-package dired-k)

(use-package dired-quick-sort)

(use-package dired-rainbow)

(use-package dired-subtree)

(use-package all-the-icons-dired
  :hook (dired-mode . all-the-icons-dired-mode))

(use-package dired-open)

(use-package dired-hide-dotfiles
  :hook (dired-mode . dired-hide-dotfiles-mode))

(use-package pdf-tools
  :defer t
  :commands (pdf-loader-install)
  :mode "\\.pdf\\'"
  :init (pdf-loader-install)
  :config (add-to-list 'revert-without-query ".pdf")
  :hook ((pdf-view-mode) . (lambda () (interactive) (display-line-numbers-mode -1))))

(let ((hooks '(org-mode-hook dired-mode-hook treemacs-mode-hook term-mode-hook shell-mode-hook eshell-mode-hook)))
(dolist (hook hooks)
  (add-hook hook (lambda () (display-line-numbers-mode 0))))
)

(use-package display-line-numbers
  :custom
  (display-line-numbers-grow-only t)
  (display-line-numbers-width-start 50)
  (display-line-numbers-minor-tick 0)
  (display-line-numbers-major-tick 10))

(load custom-file t t t t)

(use-package emacs
  :custom-face
  (fixed-pitch ((t (:foundry "outline"
                             :family "Fira Code Retina"))))
  (default ((t (:height 130
                        :weight normal
                        :width normal
                        :slant normal
                        :foundry "outline"
                        :family "Fira Code Retina"))))
  (fixed-pitch-serif ((t (:family "Courier New"))))
  (variable-pitch ((t (:inherit default
                                :height 1.4
                                :foundry "outline"
                                :family "Fira Sans")))))

(use-package ligature
  :ensure t
  :config
  (ligature-set-ligatures
   't
   '("www" "&&" "||" "::" "->" "<-" "=>" "<=>" "==" "===" "!=" "!=="))
  (global-ligature-mode t))

(load-theme 'modus-vivendi)

(set-face-attribute 'line-number nil
                    :inherit '(shadow default)
                    :foreground "dark slate gray"
                    :height 0.7)
(set-face-attribute 'line-number-current-line nil
                    :inherit 'line-number
                    :foreground "olive drab")
(set-face-attribute 'line-number-major-tick nil
                    :inherit 'line-number
                    :weight (face-attribute 'line-number :weight) 
                    :background (face-attribute 'line-number :background)
                    :foreground "#3f4f0f")
(set-face-attribute 'line-number-minor-tick nil
                    :inherit 'line-number)
