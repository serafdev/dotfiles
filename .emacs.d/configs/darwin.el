(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")


;; Macos Keyboar settings
(setq mac-option-key-is-meta nil)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)

;; Improve performance on MACOS for magit
(setq magit-git-executable "/usr/bin/git")
