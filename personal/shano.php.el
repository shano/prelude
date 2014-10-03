;; Require codebug
(prelude-require-package 'codebug)
(global-set-key (kbd "C-c b") 'codebug)


;; Require flymake php packages
(prelude-require-package 'flymake-php)
(prelude-require-package 'flymake-phpcs)

(add-hook 'php-mode-hook 'flymake-php-load)
(add-hook 'php-mode-hook 'flymake-phpcs-load)
(custom-set-variables
   '(flymake-phpcs-standard "PSR2"))


(provide 'shano.php)
;;; shano.php ends here
