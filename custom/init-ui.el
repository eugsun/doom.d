;;; ~/.doom.d/custom/init-ui.el -*- lexical-binding: t; -*-

(setq dimmer-fraction 0.3)
(dimmer-mode t)


;; Auto theme switch
;; -- Automatically switch between ligh and dark theme based on time of day
(setq theme-autoswitch t)
(setq theme-autoswitch/light-theme 'doom-solarized-light)
(setq theme-autoswitch/dark-theme 'doom-peacock)
(setq theme-autoswitch/day-start-hour 6)
(setq theme-autoswitch/day-end-hour 17)
(setq theme-autoswitch/sync-timer 300)
(if (and theme-autoswitch (display-graphic-p))
    (progn
      (setq current-theme theme-autoswitch/dark-theme)
      (defun sync-theme-with-time ()
        (setq theme-autoswitch/hour (string-to-number (substring (current-time-string) 11 13)))
        (if (member theme-autoswitch/hour (number-sequence theme-autoswitch/day-start-hour theme-autoswitch/day-end-hour))
            (setq theme-autoswitch/now theme-autoswitch/light-theme)
          (setq theme-autoswitch/now theme-autoswitch/dark-theme))
        (if (or (not (boundp 'current-theme)) (eq theme-autoswitch/now current-theme))
            nil
          (setq current-theme theme-autoswitch/now))
        (load-theme theme-autoswitch/now t)
        )
      (run-with-timer 0 theme-autoswitch/sync-timer #'sync-theme-with-time)
      )
  (load-theme theme-autoswitch/dark-theme t)
  )

;; Fonts
;; -- Default
(when (member "Source Code Pro" (font-family-list))
  (setq doom-font (font-spec :font "Source Code Pro")))
(when (member "DejaVu Sans Mono" (font-family-list))
  (setq doom-font (font-spec :font "DejaVu Sans Mono")))
(when (member "Inconsolata" (font-family-list))
  (setq doom-font (font-spec :font "Inconsolata")))
(when (member "Consolas" (font-family-list))
  (setq doom-font (font-spec :font "Consolas")))
(when (member "MesloLGS NF" (font-family-list))
  (setq doom-font (font-spec :font "MesloLGS NF")))
;; -- Unicode
(when (member "Symbola" (font-family-list))
  (set-fontset-font t 'unicode "Symbola" nil 'prepend))
(when (member "Segoe UI Emoji" (font-family-list))
  (set-fontset-font t 'unicode "Segoe UI Emoji" nil 'prepend))
;; -- Chinese
(when (member "WenQuanYi Micro Hei" (font-family-list))
  (set-fontset-font t '(#x4e00 . #x9fff) "WenQuanYi Micro Hei" ))

(provide 'init-ui)
