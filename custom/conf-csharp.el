;;; ~/.doom.d/custom/conf-csharp.el -*- lexical-binding: t; -*-

(map! :localleader :mode csharp-mode "f" 'omnisharp-code-format-entire-file)
(map! :localleader :mode csharp-mode "a" 'omnisharp-run-code-action-refactoring)

(provide 'conf-csharp)
