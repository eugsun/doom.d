;;; ~/.doom.d/custom/conf-python.el -*- lexical-binding: t; -*-

(map! :localleader :mode python-mode "pv" 'poetry-venv-toggle)

;; (after! lsp-python-ms
;;   (set-lsp-priority! 'mspyls 1))

(provide 'conf-python)
