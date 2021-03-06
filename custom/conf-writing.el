;;; ~/.doom.d/custom/conf-writing.el -*- lexical-binding: t; -*-

(defun set-reader-view ()
  (+word-wrap-mode t)
  (setq line-spacing 8)
  (setq visual-fill-column-width 80)
  (setq text-scale-mode-amount 1.2)
  (text-scale-mode 1)
  )
(add-hook 'text-mode-hook #'set-reader-view)
(add-hook 'message-mode-hook #'set-reader-view)
(add-hook 'visual-line-mode-hook #'visual-fill-column-mode)

;; Spellcheck
(unless IS-WINDOWS
  (when (executable-find "hunspell")
    (setq ispell-program-name "hunspell")
    (setq ispell-local-dictionary "en_US")
    (setq ispell-local-dictionary-alist
          '(("en_US" "[[:alpha:]]" "[^[:alpha:]]" "[']" nil ("-d" "en_US") nil utf-8))))
  ;; (dolist (hook '(text-mode-hook))
  ;;   (add-hook hook (lambda () (flyspell-mode 1)))
  ;;   )
  ;; (dolist (hook '(change-log-mode-hook log-edit-mode-hook))
  ;;   (add-hook hook (lambda () (flyspell-mode -1))))
  )

(map! :mode text-mode :nv "j" 'evil-next-visual-line)
(map! :mode text-mode :nv "k" 'evil-previous-visual-line)

(add-hook! 'ink-mode-hook #'set-reader-view)

(provide 'conf-writing)
