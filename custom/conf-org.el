;;; ~/.doom.d/custom/conf-org.el -*- lexical-binding: t; -*-

(setq org-directory "~/Dropbox/Private/org/")
(setq org-agenda-files
      (append
       (file-expand-wildcards (concat org-directory "agenda/*.org"))
       (file-expand-wildcards (concat org-directory "agenda/job/*.org"))
       (file-expand-wildcards (concat org-directory "agenda/mobile/*.org"))
      ))
(setq org-agenda-notes-file (concat org-directory "agenda/notes.org"))
(setq org-agenda-todos-file (concat org-directory "agenda/todos.org"))
(setq org-agenda-ideas-file (concat org-directory "agenda/ideas.org"))
(setq org-agenda-work-file (concat org-directory "agenda/work.org"))

(setq deft-directory org-directory)
(setq deft-recursive t)

;; Capture settings
(setq custom-org-capture-templates
      `(
        ("t" "Todo" entry (file+headline org-agenda-todos-file "Tasks")
         ,(concat "* TODO %?\n"
                  "DEADLINE: %(org-insert-time-stamp (org-read-date nil t \"+1d\"))"
                  " SCHEDULED: %t\n%i")
         :prepend t)
        ("n" "Note" entry (file+headline org-agenda-notes-file "Notes")
         "* %?\nEntered on %U\n%i" :prepend t)
        ("i" "Idea" entry (file+headline org-agenda-ideas-file "Ideas")
         "* %?\nEntered on %U\n%i" :prepend t)
        )
      )

(after! org
  (dolist (template custom-org-capture-templates)
    (add-to-list 'org-capture-templates template))
  (setq org-download-image-org-width 200)
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

(setq five-min-template
      "** 5-minute journal :5min:
*** I'm grateful for
*** What would make today great? [/]
1. [ ]
2. [ ]
3. [ ]
*** Daily affirmations. I am
*** Notable things that happened today
*** How could I have made today better
")

(defun five-minute-journal-entry ()
  (progn
    (org-journal-new-entry "5min")
    (beginning-of-line)
    (insert five-min-template)))
(map! :leader
      :desc "Add 5-min journal entry" "njf" '(lambda () (interactive) (five-minute-journal-entry)))

(defun org-journal-goto-today ()
  ;; (setq now (decode-time nil))
  ;; (setq time (encode-time now))
  ;; (setq entry-path (org-journal-get-entry-path time))

  (let* ((now (decode-time nil))
         (time (encode-time now))
         (entry-path (org-journal-get-entry-path time)))
    (funcall org-journal-find-file entry-path)
    )
  )
(map! :leader
      :desc "Go to today's entry" "njt" '(lambda () (interactive) (org-journal-goto-today)))

;; HTTP
(map! :map org-mode-map "C-c C-r" verb-command-map)

;; Keys
(map! :leader :desc "Agenda home" "oh"
      '(lambda () (interactive) (org-agenda nil "h")))
(map! :leader :desc "Open notes" "on"
      '(lambda () (interactive)(find-file org-agenda-notes-file)))
(map! :leader :desc "Open todos" "ot"
      '(lambda () (interactive)(find-file org-agenda-todos-file)))
(map! :leader :desc "Open ideas" "oi"
      '(lambda () (interactive)(find-file org-agenda-ideas-file)))
(map! :leader :desc "Open work" "ow"
      '(lambda () (interactive)(find-file org-agenda-work-file)))

;; Org-roam
(setq org-roam-db-location "~/Den/org-roam.db")
(setq org-roam-directory org-directory)

(provide 'conf-org)
