(use-package projectile
  :diminish projectile-mode
  :config
  (projectile-mode)
  (fb/leader-keys
    "p" '(projectile-command-map :which-key "قذيفة"))
  :custom ((projectile-completion-system 'ivy))
  :init
  (when (file-directory-p "~/Code")
    (setq projectile-project-search-path '("~/Code")))
  (setq projectile-switch-project-action #'projectile-dired))
;;  :bind
;; ([remap projectile-find-file] . helm-projectile-find-file))

(use-package counsel-projectile
  :config (counsel-projectile-mode))

(use-package helm)
(use-package helm-projectile)
(helm-projectile-on)
