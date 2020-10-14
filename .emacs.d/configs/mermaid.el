;; Need the mermaid-mode, doc at https://github.com/arnm/ob-mermaid/blob/master/README.org
(require 'ob-mermaid)
(setq ob-mermaid-cli-path "/Users/seraf/.npm-packages/bin/mmdc")
(org-babel-do-load-languages
 'org-babel-load-languages
 '((mermaid . t)))
