;;; ~/.doom.d/custom/init-csharp.el -*- lexical-binding: t; -*-

(map! :localleader :mode csharp-mode "f" 'omnisharp-code-format-entire-file)

(provide 'init-csharp)
