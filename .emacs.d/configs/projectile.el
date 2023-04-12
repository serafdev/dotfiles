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

(use-package counsel-projectile
  :config (counsel-projectile-mode))
