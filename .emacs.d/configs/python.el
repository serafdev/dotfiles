(require 'lsp-python-ms)
(add-hook 'python-mode-hook #'lsp)

(use-package lsp-python-ms
  :ensure t
  :demand
  :hook (python-mode . (lambda ()
                          (require 'lsp-python-ms)
                          (lsp)))) 
