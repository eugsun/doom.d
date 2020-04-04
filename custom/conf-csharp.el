;;; ~/.doom.d/custom/conf-csharp.el -*- lexical-binding: t; -*-

(map! :localleader :mode csharp-mode "f" 'omnisharp-code-format-entire-file)

(provide 'conf-csharp)
