;;; ~/.doom.d/custom/init-term.el -*- lexical-binding: t; -*-

(map! :leader :desc "Toggle terminal" "tt" '+term/toggle)
(map! :localleader :mode term-mode "n" 'multi-term-next)
(map! :localleader :mode term-mode "p" 'multi-term-prev)
(map! :localleader :mode term-mode "t" '+term/here)

(provide 'init-term)
