;;; ~/.doom.d/custom/conf-term.el -*- lexical-binding: t; -*-

(map! :leader :desc "Toggle terminal" "ee" '+term/toggle)
(map! :leader :mode term-mode "en" 'multi-term-next)
(map! :leader :mode term-mode "ep" 'multi-term-prev)
(map! :leader :mode term-mode "et" '+term/here)

(provide 'conf-term)
