(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :init
  (setq lsp-keymap-prefix "C-c l")
  :config
  (lsp-enable-which-key-integration t)
  (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]\\.vendor\\'")
  (setq lsp-file-watch-threshold 200)
  )

(use-package typescript-mode
  :mode "\\.ts\\'"
  :hook (typescript-mode . lsp-deferred)
  :config
  (setq typescript-indent-level 4))

(use-package yasnippet)

(use-package flycheck)

(use-package go-mode
  :hook ((go-mode . lsp-deferred)
	 (before-save . lsp-format-buffer)
	 (before-save . lsp-organize-imports)))

(use-package copilot
  :straight (:host github :repo "copilot-emacs/copilot.el" :files ("*.el"))
  :ensure t)

(use-package lsp-treemacs)
(lsp-treemacs-sync-mode 1)
