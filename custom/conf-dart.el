;;; ~/.doom.d/custom/conf-dart.el -*- lexical-binding: t; -*-

(after! dart-mode
  (setq dart-debug t)
  ;; server program
  (setq dart-sdk-path (concat (getenv "HOME") "/Apps/flutter/bin/cache/dart-sdk/"))
  (setq lsp-dart-sdk-dir dart-sdk-path)
  (setq dart-analysis-server-bin (concat dart-sdk-path "bin/snapshots/analysis_server.dart.snapshot"))
  ;; project config
  (add-to-list 'projectile-project-root-files-bottom-up "pubspec.yaml")
  (add-to-list 'projectile-project-root-files-bottom-up "BUILD")
  ;; hooks. use flycheck instead of flymake
  (advice-add 'dart-mode :after #'flymake-mode-off)
  (advice-add 'dart-mode :after #'flycheck-mode-on-safe)
  (advice-add 'dart-mode :after #'lsp)
  )

(provide 'conf-dart)
