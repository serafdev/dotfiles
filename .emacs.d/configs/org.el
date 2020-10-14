(use-package org-projectile
  :bind (("C-c n p" . org-projectile-project-todo-completing-read)
         ("C-c c" . org-capture))
  :config
  (progn
    (setq org-projectile-projects-file (expand-file-name "~/.notes"))
    (setq org-agenda-files (append org-agenda-files (org-projectile-todo-files)))
    (push (org-projectile-project-todo-entry) org-capture-templates))
  :ensure t)

(defun my-org-confirm-babel-evaluate (lang body)
  (not (string= lang "mermaid")))
(setq org-confirm-babel-evaluate #'my-org-confirm-babel-evaluate)
