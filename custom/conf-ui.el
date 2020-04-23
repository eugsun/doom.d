;;; ~/.doom.d/custom/conf-ui.el -*- lexical-binding: t; -*-

;; TODO: Dimmer is a bit too slow whenever focus is changed.
;; (setq dimmer-fraction 0.3)
;; (dimmer-mode t)

;; Auto theme switch
;; -- Automatically switch between ligh and dark theme based on time of day
(setq theme-autoswitch t)
(setq theme-autoswitch/light-theme 'doom-one-light)
(setq theme-autoswitch/dark-theme 'doom-peacock)
(setq theme-autoswitch/day-start-hour 6)
(setq theme-autoswitch/day-end-hour 17)
(setq theme-autoswitch/sync-timer 300)
(if (and theme-autoswitch (display-graphic-p))
    (progn
      (defun sync-theme-with-time ()
        (setq theme-autoswitch/hour (string-to-number (substring (current-time-string) 11 13)))
        (if (member theme-autoswitch/hour (number-sequence theme-autoswitch/day-start-hour theme-autoswitch/day-end-hour))
            (setq theme-autoswitch/now theme-autoswitch/light-theme)
          (setq theme-autoswitch/now theme-autoswitch/dark-theme))
        (unless (and (boundp 'current-time) (eq theme-autoswitch/now current-theme))
          (progn
            (setq current-theme theme-autoswitch/now)
            (load-theme theme-autoswitch/now t))))
      (sync-theme-with-time)
      (run-with-timer 0 theme-autoswitch/sync-timer #'sync-theme-with-time))
  (load-theme theme-autoswitch/dark-theme t))

;; -- Chinese
(when (member "WenQuanYi Micro Hei" (font-family-list))
  (set-fontset-font t '(#x4e00 . #x9fff) "WenQuanYi Micro Hei" ))

(provide 'conf-ui)
