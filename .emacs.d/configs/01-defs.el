(defun load-config (config)
  "Load ~/.emacs.d/configs/{config}.el"
  (load-library (concat "~/.emacs.d/configs/" config ".el")))

(defun toad! (list)
  "Load ~/.emacs.d/configs/{list[n]}.el"
  (while list
    (load-config (car list))
    (setq list (cdr list))))

;; Bootsrap straight installation
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))
