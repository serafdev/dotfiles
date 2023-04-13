(defun load-config (config)
  "Load ~/.emacs.d/configs/{config}.el"
  (load-library (concat "~/.emacs.d/configs/" config ".el")))

(defun toad! (list)
  "Load ~/.emacs.d/configs/{list[n]}.el"
  (while list
    (load-config (car list))
    (setq list (cdr list))))
