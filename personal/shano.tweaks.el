;; Require helm-dash
;(prelude-require-package 'helm-dash)
(global-set-key (kbd "C-c v") 'helm-dash)

(prelude-require-package 'ag)
(global-set-key (kbd "C-h s") 'ag)

(prelude-require-package 'helm-recoll)

;; Allow hash to be entered
(global-set-key (kbd "M-3") '(lambda () (interactive) (insert "#")))

; For enabling journal
(require 'simple-journal)
(global-set-key (kbd "C-c l") 'sj-new-entry)

; For vimtabs support
;;(global-evil-tabs-mode t)

; Disabling bell and showing visual notification
(setq visible-bell 1)

(provide 'shano.tweaks)
;;; shano.tweaks ends here
