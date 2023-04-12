(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(use-package general
  :config
  (general-create-definer fb/leader-keys
    :keymaps '(normal insert visual emacs)
    :prefix "SPC"
  :global-prefix "C-SPC"))

(fb/leader-keys
   "z" '(:ignore t :which-key "واجهات")
   "zt" '(counsel-load-theme :which-key "الألوان")
   "zs" '(hydra-text-scale/body :which-key "تدرج"))
