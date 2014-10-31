;; Require helm-dash
;(prelude-require-package 'helm-dash)
(global-set-key (kbd "C-c v") 'helm-dash)

(prelude-require-package 'ag)
(global-set-key (kbd "C-h s") 'ag)

(provide 'shano.tweaks)
;;; shano.tweaks ends here
