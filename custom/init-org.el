;;; ~/.doom.d/custom/org.el -*- lexical-binding: t; -*-

;; Capture settings
(setq custom-org-capture-templates
      `(
        ("t" "Todo" entry (file+headline org-default-todos-file "Tasks")
         ,(concat "* TODO %?\n"
                  "DEADLINE: %(org-insert-time-stamp (org-read-date nil t \"+1d\"))"
                  " SCHEDULED: %t\n%i")
         :prepend t)
        ("n" "Note" entry (file+headline org-default-notes-file "Notes")
         "* %?\nEntered on %U\n%i" :prepend t)
        ("i" "Idea" entry (file+headline org-default-ideas-file "Ideas")
         "* %?\nEntered on %U\n%i" :prepend t)
        )
      )

(after! org
  (dolist (template custom-org-capture-templates)
    (add-to-list 'org-capture-templates template))
  )

;; Agenda display
(setq org-agenda-custom-commands
      '(
        ("h" "Home View"
         (
          ;; (tags "PRIORITY=\"A\""
          ;;       ((org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done))
          ;;        (org-agenda-overriding-header "High-Priority Items:")))
          (tags "goal" ((org-agenda-overriding-header "Goals")))
          (agenda "")
          (alltodo '(:timestamp))
          )
         )
        ))

;; Journal
(after! org-journal
  (setq org-journal-file-type 'monthly)
  (setq org-journal-file-format "%Y%m.org")
  (setq org-journal-date-format "%A, %m/%d/%Y"))

;; HTTP
(map! :map org-mode-map "C-c C-r" verb-command-map)

(provide 'init-org)
