(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("c9585af2af11b6fddbb5c3cc723b81033a99620c1e6f5b05915b65e10adbf0d0"
     "88f7ee5594021c60a4a6a1c275614103de8c1435d6d08cc58882f920e0cec65e"
     "a242356ae1aebe9f633974c0c29b10f3e00ec2bc96a61ff2cdad5ffa4264996d"
     "aec7b55f2a13307a55517fdf08438863d694550565dee23181d2ebd973ebd6b8"
     "aed3a896c4ea7cd7603f7a242fe2ab21f1539ab4934347e32b0070a83c9ece01"
     "34cf3305b35e3a8132a0b1bdf2c67623bc2cb05b125f8d7d26bd51fd16d547ec"
     default))
 '(package-selected-packages
   '(all-the-icons-completion all-the-icons-dired auctex corfu
                              dired-git-info dired-hide-dotfiles
                              dired-k dired-open dired-preview
                              dired-quick-sort dired-rainbow
                              dired-subtree display-line-numbersee
                              embark-consult eshell-git-prompt general
                              git-gutter-fringe git-modes
                              git-timemachine helpful
                              highlight-parentheses highlight-stages
                              iedit impatient-showdown ligature
                              lsp-treemacs lsp-ui magit-filenotify
                              marginalia multiple-cursors orderless
                              org-bullets org-download paredit
                              paren-face pdf-tools rg sly-asdf
                              sly-macrostep sly-named-readtables
                              sly-quicklisp swagg vertico
                              visual-fill-column which-key))
 '(safe-local-variable-values
   '((eval add-hook 'after-save-hook
           (lambda nil
             (when (y-or-n-p "Tangle?")
               (let ((org-confirm-babel-evaluate nil))
                 (org-babel-tangle))
               (when (y-or-n-p "Reload?") (load-file user-init-file))))
           nil t))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
