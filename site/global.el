;; site/global.el

;;;; font
(set-face-attribute 'default nil :height 120)

;; getting help
(global-set-key (kbd "C-h a") 'apropos)

;;;; keybindings
;; file handling
(global-unset-key (kbd "C-x f"))
(global-set-key (kbd "C-x f") 'ido-find-file-other-window)
(global-unset-key (kbd "C-\\"))
(global-set-key (kbd "C-x C-d") 'dired-at-point)
(global-set-key (kbd "C-x F") 'find-file-other-frame)
(global-set-key [f7] 'find-file-in-repository)
(global-set-key (kbd "S-<f7>") 'find-file-in-project)
(global-set-key (kbd "C-x M-f") 'find-file-at-point)
(global-unset-key (kbd "s-,"))
(global-set-key (kbd "s-,") 'previous-buffer)
(global-set-key (kbd "s-.") 'next-buffer)
(global-set-key (kbd "C-c y") 'bury-buffer)
(global-set-key (kbd "C-c r")     'revert-buffer)

;;;; some default hooks
(add-hook 'text-mode-hook 'auto-fill-mode)
(add-hook 'fundamental-mode-hook 'auto-fill-mode)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-hook 'emacs-lisp-mode '(auto-complete-mode t))

;; Define he following variables to remove the compile-log warnings
;; when defining ido-ubiquitous
(defvar ido-cur-item nil)
(defvar ido-default-item nil)
(defvar ido-cur-list nil)
(defvar predicate nil)
(defvar inherit-input-method nil)
