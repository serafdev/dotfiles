(require 'package)
(add-to-list 'package-archives
        '("melpa-stable" . "https://stable.melpa.org/packages/"))
    
(add-to-list 'package-archives
        '("melpa" . "https://melpa.org/packages/"))

;; Load our defined functions
(load-library "~/.emacs.d/configs/01-defs.el")

;; "Unix"
(cond
 ((string-equal system-type "darwin")
  (load-config "darwin")))

;; These can be looped but currently testing
(toad!
 '(
   "keybindings"
   "interface"
   "hydra"
   "language-servers"
   "magit"
   "evil"
   "projectile"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("2dd4951e967990396142ec54d376cced3f135810b2b69920e77103e0bcedfba9" "6945dadc749ac5cbd47012cad836f92aea9ebec9f504d32fe89a956260773ca4" "7e377879cbd60c66b88e51fad480b3ab18d60847f31c435f15f5df18bdb18184" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" default))
 '(helm-minibuffer-history-key "M-p")
 '(package-selected-packages
   '(helm-projectile helm vterm treemacs-all-the-icons lsp-treemacs treemacs company-lsp flycheck go-mode typescript-mode evil-magit magit ivy-hydra counsel-projectile projectile hydra evil-collection evil general all-the-icons doom-themes helpful ivy-rich which-key rainbow-delimiters smart-mode-line doom-modeline counsel ivy command-log-mode exec-path-from-shell yasnippet lsp-ui company)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

