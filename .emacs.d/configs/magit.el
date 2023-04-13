(use-package magit)

(fb/leader-keys
  "g" '(:ignore t :which-key "magit")
  "gg" '(magit-status :which-key "status"))
