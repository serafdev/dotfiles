;; Package management
(setq package-check-signature nil)
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

(package-install 'use-package)
(package-install 'exec-path-from-shell)

(require 'use-package)
(package-initialize)
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))
;; Disable the splash buffer
(setq inhibit-startup-screen t)
(setq initial-scratch-message "")

;;;;;;;;;;;; Packages load
(defun user/load-config (config)
  (load-library (concat "~/.emacs.d/configs/" config ".el")))


;; ================= OS Specifics ========================
;; Load MacOS specifics. I wish to change to
;; (user/load-config system-type) but gnu/linux has a slash in it.
;; Maybe use a string split using the slash and name the file gnu?
(cond
 ((string-equal system-type "darwin")
  (user/load-config "darwin")))


;; ================= Generic Languages Setup  =============

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)

(use-package company
  :ensure t
  :config
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 1))

(use-package company-lsp
  :ensure t
  :commands company-lsp)
;; Optional - provides snippet support.
(use-package yasnippet
  :ensure t
  :commands yas-minor-mode
  :hook (go-mode . yas-minor-mode))

(require 'lsp-mode)

;; ================ IDE Packages, and such ===============
(require 'use-package)
(use-package all-the-icons)

;; Set layers here, for now they are just the file names in configs/
(setq layers
      '(
	"proxy"
	"go"
	"magit"
	"neotree"
        "org"
	"themes"
	"python"
	"js"
	))

;; Runs load-config on the layers
(while layers
  (user/load-config (car layers))
  (setq layers (cdr layers)))

;;============= Tweaking ==================
;; Buffer Reload with no confirmation; source: misc-cmds.el
(global-auto-revert-mode)

;; Add line numbers
(global-display-line-numbers-mode)
(linum-relative-global-mode)

;; Copy paste using simpleclip
(require 'simpleclip)
(simpleclip-mode 1)

;;=========================================

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote

    (linum-relative simpleclip lsp-python-ms magit neotree doom-themes exec-path-from-shell flycheck use-package go-mode yasnippet company-lsp company lsp-ui lsp-mode))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
