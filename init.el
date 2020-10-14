;; init.el

;; require latest built in macros and libraries
(require 'cl-lib)

(set-face-attribute 'default nil :height 120)
(setq-default truncate-lines t)
(setq-default large-file-warning-threshold 100000000)
(setq-default backup-inhibited t)

;; display time in mode-line
(setq display-time-string-forms
      '((propertize (format-time-string "%A %F %R" now) 'face 'bold)))
(display-time-mode t)

;; where we install packages
(setq site-dir "./site")

;; keep all the auto saves and shadow files in one place
(setq temporary-file-dir
      (concat
       "./"
       "auto-saves"))

;; keep all the auto saves and shadow files in one place
(setq temporary-file-dir
      (concat
       "./"
       "auto-saves"))

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))

(setq auto-save-file-name-transforms
`((".*" ,temporary-file-directory t)))

;; for posting to gists
(setenv "no_proxy" (concat "gist.github.com," (getenv "no_proxy")))

;;;; base configs
;; set the garbage collection threshold to
;; every 20mb allocations
(setq gc-cons-threshold 20000000)

;; enable native clipboard
(setq x-select-enabled-clipboard t)

;; file nav
(setq dired-dwim-target t)
(setq dired-garbage-files-regexp "\\(?:\\.\\(?:aux\\|bak\\|bbl\\|bcf\\|dvi\\|log\\|rej\\|toc\\)\\)\\'")

;; add a final new line to files before closing
(setq require-final-newline t)
;; enable site configs dir
(add-to-list 'load-path
	     (expand-file-name "site" "~/.emacs.d"))


;;;; misc configs
;; Changes all yes/no questions to y/n type
(fset 'yes-or-no-p 'y-or-n-p)

;; org mode

;; shell scripts
(setq-default sh-basic-offset 2)
(setq-default sh-indentation 2)

;; No need for ~ files when editing
(setq create-lockfiles nil)

;; straight.el package manager
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;;;; global configs
(add-hook 'after-init-hook
	  (load "global"))

;;;; package setup
(add-hook 'after-init-hook
	  (load "packages"))

;;;; navigation
(add-hook 'after-init-hook
          (load "nav"))

;;;; ui
(add-hook 'after-init-time
	  (load "ui"))

;;;; customizations
(add-hook 'after-init-hook
          (load "edit"))

;;;; coding
(add-hook 'after-init-hook
          (load "python"))

(add-hook 'after-init-hook
          (load "clojure"))
