                                        ;(global-flycheck-mode -1)
(global-hl-line-mode -1)
;; (fringe-mode '(0 . 8)) ;; Right fringe only

(when window-system
  (setq frame-title-format '(buffer-file-name "Emacs: %f" ("%b")))
  (set-face-attribute 'default nil :font "Inconsolata" :height 110))

(setq x-resource-class "emacs-snapshot") ;; => correct hi-res icon in gnome window switcher

;; (add-to-list 'safe-local-variable-values '(whitespace-line-column . 80))

;; Transparently open compressed files
(auto-compression-mode t)

;; Type less: y instead yes
(defalias 'yes-or-no-p 'y-or-n-p)

;;
;; Nice linum padding
;;
;; (setq linum-format
;;       (lambda (line)
;;         (propertize
;;          (format
;;           (let ((w (length (number-to-string (count-lines (point-min) (point-max))))))
;;             (concat " %" (number-to-string w) "d "))
;;           line)
;;          'face
;;          'linum)))
;; (global-linum-mode)

;;
;; Speedbar
;;
(setq speedbar-show-unknown-files t)
(setq speedbar-use-images nil)
(setq sr-speedbar-auto-refresh nil)

(prelude-require-package 'sr-speedbar)
(global-set-key (kbd "C-s") 'sr-speedbar-toggle)
(custom-set-variables '(sr-speedbar-right-side nil))

;;
;; Completion-UI(for automatically ctag support)
;;
;;(prelude-require-package 'completion-ui)
;;(auto-completion-mode nil)
;;(global-set-key (kbd "s-i") 'complete-etags)
;;(custom-set-faces
 ;;'(completion-highlight-face ((t (:background "grey" :foreground "white")))))

;;
;; El-Screen(for tabs)
;;
(prelude-require-package 'escreen)
(load "escreen")
(setq escreen-prefix-char "\C-i")
(global-set-key escreen-prefix-char 'escreen-prefix)

(elscreen-start)

;; F9 creates a new elscreen, shift-F9 kills it
(global-set-key (kbd "C-c c c") 'elscreen-create)
(global-set-key (kbd "C-c t a b d") 'elscreen-kill)

;; Windowskey+PgUP/PgDown switches between elscreens
(global-set-key (kbd "C-c c n") 'elscreen-previous)
;(global-set-key (kbd "C-n []") 'elscreen-next)


;; Theme Settings
;(load-theme 'monokai t)

(prelude-require-package 'solarized-theme)

;; make the fringe stand out from the background
(setq solarized-distinct-fringe-background t)

;; Don't change the font for some headings and titles
(setq solarized-use-variable-pitch nil)

;; make the modeline high contrast
(setq solarized-high-contrast-mode-line t)

;; Use less bolding
(setq solarized-use-less-bold t)

;; Use more italics
(setq solarized-use-more-italic t)

;; Use less colors for indicators such as git:gutter, flycheck and similar
(setq solarized-emphasize-indicators nil)

(load-theme 'solarized-dark t)
;; End of Theme Settings


;; Draw line feed ^L as line!
(prelude-require-package 'pp-c-l)
(require 'pp-c-l)
(pretty-control-l-mode 1)



;;
;; Underscore "_" is not a word character
;; https://bitbucket.org/lyro/evil/wiki/Home
(modify-syntax-entry ?_ "w")
(add-hook 'c-mode-common-hook #'(lambda () (modify-syntax-entry ?_ "w")))

;; Set line number
(global-linum-mode t)

;; Fancy diary entries
(setq view-diary-entries-initially t
    mark-diary-entries-in-calendar t
    number-of-diary-entries 7)
(add-hook 'diary-display-hook 'fancy-diary-display)
(add-hook 'today-visible-calendar-hook 'calendar-mark-today)

;; Fullscreen mode
(defun fullscreen (&optional f)
       (interactive)
       (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
               '(2 "_NET_WM_STATE_MAXIMIZED_VERT" 0))
       (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
               '(2 "_NET_WM_STATE_MAXIMIZED_HORZ" 0)))

(setq org-agenda-files (append '("~/Org" "~/.emacs.d/personal" "~/Org/jstor" "~/Org/frieze" "~/Org/camuni") (file-expand-wildcards "~/Org/*/")))

(setq 
 org-default-notes-file "~/Org/home.org"
 initial-buffer-choice  org-default-notes-file)

(fullscreen)
(provide 'shano.ui)
;;; shano.ui ends here
