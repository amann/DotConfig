(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :extend nil :stipple nil :background "SystemWindowText" :distant-foreground "SystemWindowText" :foreground "SystemWindow" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "outline" :family "Fira Code Retina"))))
 '(cursor ((t (:background "gray"))))
 '(escape-glyph ((t (:foreground "dark green"))))
 '(fixed-pitch ((t (:inherit default :foundry "outline" :family "Fira Code Retina"))))
 '(fixed-pitch-serif ((t (:family "Courier New"))))
 '(font-lock-comment-face ((nil (:foreground "SlateGray4"))))
 '(font-lock-function-name-face ((t (:foreground "RoyalBlue1"))))
 '(font-lock-string-face ((t (:background "gray20" :foreground "orange1"))))
 '(highlight-changes ((t (:background "gray30"))))
 '(highlight-changes-delete ((((min-colors 88) (class color)) (:background "maroon4"))))
 '(highlight-stages-level-1-face ((t (:background "#333300"))))
 '(highlight-stages-level-2-face ((t (:background "#003300"))))
 '(highlight-stages-level-3-face ((t (:background "#003333"))))
 '(highlight-stages-negative-level-face ((t (:background "red1"))))
 '(line-number ((t (:inherit (shadow default) :foreground "dark slate gray" :height 0.7))))
 '(line-number-current-line ((t (:inherit line-number :foreground "olive drab"))))
 '(line-number-major-tick ((t (:inherit line-number :foreground "#3f4f0f"))))
 '(line-number-minor-tick ((t (:inherit line-number :foreground "#3f4f0f"))))
 '(paren-face ((((class color)) (:foreground "DeepSkyBlue4"))))
 '(parenface-paren-face ((t (:foreground "DodgerBlue4"))))
 '(parenthesis ((t (:foreground "DodgerBlue4"))))
 '(show-paren-match ((t (:background "#003137" :underline "#003136"))))
 '(tab-bar ((t (:inherit variable-pitch :background "SystemBackground" :foreground "dark slate gray" :box (:line-width 2 :style pressed-button) :weight bold :height 0.9))))
 '(tab-bar-tab ((t (:inherit tab-bar-tab-inactive :foreground "dark olive green" :box (:line-width 1 :style released-button)))))
 '(tab-bar-tab-inactive ((t (:inherit tab-bar :box (:line-width 1 :style pressed-button)))))
 '(variable-pitch ((t (:foundry "outline" :family "Fira Sans")))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-DVI-via-PDFTeX t)
 '(TeX-PDF-mode t)
 '(TeX-auto-global "/var/auctex/")
 '(TeX-auto-private '("~/.emacs.d/TeX/auto/"))
 '(TeX-auto-save t)
 '(TeX-electric-escape nil)
 '(TeX-electric-sub-and-superscript t)
 '(TeX-macro-default "~/texmf/tex/")
 '(TeX-macro-private '("~/.texmf/tex/" "~/.TeX/" "~/texmf/tex/"))
 '(TeX-math-close-double-dollar t)
 '(TeX-mode-hook '((lambda nil (setq fill-column 85))))
 '(TeX-newline-function 'reindent-then-newline-and-indent)
 '(TeX-output-view-style
   '(("^dvi$" "^pstricks$\\|^pst-\\|^psfrag$" "dvips %d -o && start \"\" %f")
     ("^dvi$" "." "yap -1 %dS %d")
     ("^pdf$" "." "SumatraPDF.exe %o %(outpage)")
     ("^html?$" "." "start \"\" %o")) t)
 '(TeX-parse-self t)
 '(TeX-save-query nil)
 '(TeX-source-correlate-mode t)
 '(TeX-style-private '("~/.emacs.d/TeX/style/"))
 '(TeX-view-style '(("^epsf$" "start \"\" %f") ("." "yap -1 %dS %d")) t)
 '(auto-revert-verbose nil)
 '(aw-keys '(97 115 100 102 103 104 106 107 108))
 '(backup-by-copying-when-linked t)
 '(browse-url-browser-function 'browse-url-default-windows-browser)
 '(browse-url-firefox-program "C:/Program Files/Mozilla Firefox/firefox.exe")
 '(c-mode-common-hook
   '((lambda nil
       (c-set-style "linux")
       (c-set-offset 'case-label 4)
       (setq c-basic-offset 4))))
 '(calendar-date-style 'iso)
 '(calendar-latitude 47.36667)
 '(calendar-longitude 8.55)
 '(calendar-week-start-day 1)
 '(case-fold-search t)
 '(column-number-mode t)
 '(csv-separators '("," ";"))
 '(current-language-environment "English")
 '(custom-safe-themes
   '("3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" default))
 '(default-major-mode 'text-mode t)
 '(delete-selection-mode t nil (delsel))
 '(desktop-save-mode nil)
 '(dired-auto-revert-buffer t)
 '(dired-dwim-target t)
 '(display-line-numbers-major-tick 10)
 '(display-line-numbers-minor-tick 0)
 '(display-line-numbers-width-start t)
 '(display-time-24hr-format t)
 '(display-time-day-and-date t)
 '(display-time-mode t nil (time))
 '(ediff-window-setup-function 'ediff-setup-windows-plain)
 '(eshell-before-prompt-hook '(eshell-begin-on-new-line))
 '(eshell-modifier-alist
   '((69 quote
         (lambda
           (lst)
           (mapcar
            #'(lambda
                (str)
                (eshell-stringify
                 (car
                  (eshell-parse-argument str))))
            lst)))
     (76 quote
         (lambda
           (lst)
           (mapcar 'downcase lst)))
     (85 quote
         (lambda
           (lst)
           (mapcar 'upcase lst)))
     (67 quote
         (lambda
           (lst)
           (mapcar 'capitalize lst)))
     (104 quote
          (lambda
            (lst)
            (mapcar 'file-name-directory lst)))
     (105 eshell-include-members)
     (120 eshell-include-members t)
     (114 quote
          (lambda
            (lst)
            (mapcar 'file-name-sans-extension lst)))
     (101 quote
          (lambda
            (lst)
            (mapcar 'file-name-extension lst)))
     (116 quote
          (lambda
            (lst)
            (mapcar 'file-name-nondirectory lst)))
     (113 quote
          (lambda
            (lst)
            (mapcar 'eshell-escape-arg lst)))
     (117 quote
          (lambda
            (lst)
            (eshell-uniqify-list lst)))
     (111 quote
          (lambda
            (lst)
            (sort lst 'string-lessp)))
     (79 quote
         (lambda
           (lst)
           (nreverse
            (sort lst 'string-lessp))))
     (106 eshell-join-members)
     (83 eshell-split-members)
     (82 quote reverse)
     (103 progn
          (forward-char)
          (if
              (eq
               (char-before)
               115)
              (eshell-pred-substitute t)
            (error "`g' modifier cannot be used alone")))
     (115 eshell-pred-substitute)
     (70 lambda
         (list)
         (eshell-flatten-list list))))
 '(eshell-modules-list
   '(eshell-alias eshell-banner eshell-basic eshell-cmpl eshell-dirs eshell-glob eshell-hist eshell-ls eshell-pred eshell-prompt eshell-rebind eshell-script eshell-smart eshell-term eshell-unix))
 '(fill-column 78)
 '(flymd-browser-open-function 'browse-url-firefox)
 '(global-font-lock-mode t nil (font-lock))
 '(global-git-gutter-mode t)
 '(global-paren-face-mode t)
 '(highlight-changes-face-list nil)
 '(highlight-parentheses-colors
   '("gold1" "orange1" "IndianRed2" "Purple2" "SteelBlue" "dark slate gray"))
 '(highlight-stages-highlight-real-quote nil)
 '(httpd-host "cl3834")
 '(httpd-port 80)
 '(imaxima-gs-program "gswin32c.exe")
 '(imaxima-image-type 'eps)
 '(indent-tabs-mode nil)
 '(inferior-lisp-program "sbcl.bat")
 '(inhibit-eol-conversion t)
 '(inverse-video t)
 '(isearch-allow-scroll t)
 '(ispell-program-name "/usr/bin/aspell")
 '(lpr-add-switches t)
 '(lpr-command "")
 '(lpr-printer-switch "/D:")
 '(markdown-command "pandoc")
 '(mouse-scroll-delay 0)
 '(mouse-wheel-follow-mouse t)
 '(mouse-wheel-mode t nil (mwheel))
 '(mwheel-follow-mouse t)
 '(org-agenda-files nil)
 '(org-export-backends '(ascii html icalendar latex md))
 '(org-export-latex-classes
   '(("article" "\\documentclass[11pt]{article}\12\\usepackage[utf8]{inputenc}\12\\usepackage[T1]{fontenc}\12\\usepackage{graphicx}\12\\usepackage{longtable}\12\\usepackage{float}\12\\usepackage{wrapfig}\12\\usepackage{soul}\12\\usepackage{amssymb}\12\\usepackage{hyperref}"
      ("\\section{%s}" . "\\section*{%s}")
      ("\\subsection{%s}" . "\\subsection*{%s}")
      ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
      ("\\paragraph{%s}" . "\\paragraph*{%s}")
      ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))
     ("report" "\\documentclass[11pt]{report}\12\\usepackage[utf8]{inputenc}\12\\usepackage[T1]{fontenc}\12\\usepackage{graphicx}\12\\usepackage{longtable}\12\\usepackage{float}\12\\usepackage{wrapfig}\12\\usepackage{soul}\12\\usepackage{amssymb}\12\\usepackage{hyperref}"
      ("\\part{%s}" . "\\part*{%s}")
      ("\\chapter{%s}" . "\\chapter*{%s}")
      ("\\section{%s}" . "\\section*{%s}")
      ("\\subsection{%s}" . "\\subsection*{%s}")
      ("\\subsubsection{%s}" . "\\subsubsection*{%s}"))
     ("book" "\\documentclass[11pt]{book}\12\\usepackage[utf8]{inputenc}\12\\usepackage[T1]{fontenc}\12\\usepackage{graphicx}\12\\usepackage{longtable}\12\\usepackage{float}\12\\usepackage{wrapfig}\12\\usepackage{soul}\12\\usepackage{amssymb}\12\\usepackage{hyperref}"
      ("\\part{%s}" . "\\part*{%s}")
      ("\\chapter{%s}" . "\\chapter*{%s}")
      ("\\section{%s}" . "\\section*{%s}")
      ("\\subsection{%s}" . "\\subsection*{%s}")
      ("\\subsubsection{%s}" . "\\subsubsection*{%s}"))
     ("UserGuide" "\\documentclass{solutionDescription}\12\\usepackage[utf8]{inputenc}\12\\usepackage[T1]{fontenc}\12\\usepackage{graphicx}\12\\usepackage{longtable}\12\\usepackage{float}\12\\usepackage{wrapfig}\12\\usepackage{soul}\12\\usepackage{amssymb}\12\\documenttype{User Guide}"
      ("\\chapter{%s}" . "\\chapter*{%s}")
      ("\\section{%s}" . "\\section*{%s}")
      ("\\subsection{%s}" . "\\subsection*{%s}")
      ("\\subsubsection{%s}" . "\\subsubsection*{%s}"))
     ("SLGeneral" "\\documentclass{solutionDescription}\12\\usepackage[utf8]{inputenc}\12\\usepackage[T1]{fontenc}\12\\usepackage{graphicx}\12\\usepackage{longtable}\12\\usepackage{float}\12\\usepackage{wrapfig}\12\\usepackage{soul}\12\\usepackage{amssymb}"
      ("\\chapter{%s}" . "\\chapter*{%s}")
      ("\\section{%s}" . "\\section*{%s}")
      ("\\subsection{%s}" . "\\subsection*{%s}")
      ("\\subsubsection{%s}" . "\\subsubsection*{%s}"))))
 '(org-hide-emphasis-markers t)
 '(org-hide-leading-stars t)
 '(org-table-use-standard-references ''from)
 '(package-check-signature nil)
 '(package-selected-packages nil)
 '(paradox-automatically-star nil)
 '(paradox-github-token t)
 '(pr-path-alist
   '((unix PATH)
     (cygwin PATH)
     (windows w32-gsview w32-ghostscript PATH)
     (w32-gsview "c:/Program Files/Ghostgum/gsview/")
     (w32-ghostscript "c:/Program Files/gs/gs8.60/bin/")))
 '(printer-name "HG2210-1 (LOCAL)")
 '(recentf-exclude '(".*/[.]recentf\\'"))
 '(recentf-mode t)
 '(recentf-save-file "~/.config/emacs/recentf")
 '(reftex-plug-into-AUCTeX t)
 '(reftex-toc-include-file-boundaries t)
 '(reftex-toc-include-index-entries t)
 '(safe-local-variable-values
   '((eval longlines-mode 1)
     (lexical-binding . t)
     (Package . CHUNGA)
     (syntax . ANSI-COMMON-LISP)
     (Package SERIES :use "COMMON-LISP" :colon-mode :external)
     (Package . FLEXI-STREAMS)
     (Package . RDNZL)
     (Package . CCL)
     (Syntax . ANSI-Common-Lisp)
     (Syntax . Common-Lisp)
     (Package . Maxima)
     (Package . ODBC)
     (Package ODBC)
     (Package . COMMON-LISP-USER)
     (Syntax . COMMON-LISP)
     (Package . CL-USER)
     (Base . 10)))
 '(show-paren-mode t nil (paren))
 '(show-paren-priority 0)
 '(show-paren-style 'expression)
 '(slime-autodoc-use-multiline-p t)
 '(slime-complete-symbol*-fancy t)
 '(slime-complete-symbol-function 'slime-fuzzy-complete-symbol)
 '(slime-lisp-implementations '((sbcl ("sbcl.bat" " --noinform"))))
 '(slime-repl-history-file "~/.slime/slime-history.eld")
 '(slime-repl-history-remove-duplicates t)
 '(slime-repl-history-trim-whitespaces t)
 '(sml/theme 'dark)
 '(tab-bar-show 1)
 '(text-mode-hook '(text-mode-hook-identify))
 '(tool-bar-mode nil nil (tool-bar))
 '(transient-mark-mode t)
 '(url-proxy-services
   '(("no_proxy" . "^\\\\(localhost\\\\|10\\\\..*\\\\|192\\\\.168\\\\..*\\\\)")
     ("http" . "localhost:8080")
     ("https" . "localhost:8080")))
 '(user-mail-address "Olivier.Amann@swisslife.ch")
 '(visible-bell t)
 '(warning-suppress-types '((undo discard-info))))

