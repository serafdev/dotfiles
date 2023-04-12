;; ================= OS Specifics ========================
;; Load MacOS specifics. I wish to change to
;; (user/load-config system-type) but gnu/linux has a slash in it.
;; Maybe use a string split using the slash and name the file gnu?
(cond
 ((string-equal system-type "darwin")
  (user/load-config "darwin")))

;; OS Specifics
;;;;;;;;;;;; Packages load
(defun user/load-config (config)
  (load-library (concat "~/.emacs.d/configs/" config ".el")))

;; These can be looped but currently testing
(user/load-config "interface")
(user/load-config "language-servers")
(user/load-config "magit")
(user/load-config "evil")
(user/load-config "hydra")
(user/load-config "keybindings")
(user/load-config "projectile")

;; Should be, when commenting it's disabled (got to restart emacsdaemon)
;; (modules
;;   "interface"
;;   "language-servers"
;;   "magit"
;;   ;; "evil"
;;   "hydra"
;;   "keybindings"
;;   "projectile"
;; )

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("7e377879cbd60c66b88e51fad480b3ab18d60847f31c435f15f5df18bdb18184" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" default))
 '(package-selected-packages
   '(company-lsp flycheck go-mode typescript-mode evil-magit magit ivy-hydra counsel-projectile projectile hydra evil-collection evil general all-the-icons doom-themes helpful ivy-rich which-key rainbow-delimiters smart-mode-line doom-modeline counsel ivy command-log-mode exec-path-from-shell yasnippet lsp-ui company)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

