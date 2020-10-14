;; site/edit.el
;; allow for loading current directory configs
;; and ensure file references
(add-to-list 'load-path
             (expand-file-name "./"))

(add-to-list 'auto-mode-alist
             '("\\.\\(org\\|org_archive\\|txt\\)$" . org-mode))

(require org-mode)


;; key bindings
(global-set-key "\C-cl" 'org-)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key (kbd "<f12>") 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

;; tasks and environment context
(setq org-agenda-files (quote ("../"
                               "../tep")))
( org-todo-keywords
      (quote ((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)")
              (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)" "PHONE" "MEETING"))))

(setq org-todo-state-tags-triggers
      (quote (("CANCELLED" ("CANCELLED" . t))
              ("WAITING" ("WAITING" . t))
              ("HOLD" ("WAITING") ("HOLD" . t))
              (done ("WAITING") ("HOLD"))
              ("TODO" ("WAITING") ("CANCELLED") ("HOLD"))
              ("NEXT" ("WAITING") ("CANCELLED") ("HOLD"))
              ("DONE" ("WAITING") ("CANCELLED") ("HOLD")))))

;; http://www.emacswiki.org/emacs/HippieExpand
(global-set-key (kbd "M-/") 'hippie-expand)

;; highlight matching parans
(show-paren-mode t)

;; letter casing
(global-set-key [M-l] 'downcase-word)
(global-set-key [M-u] 'upcase-word)
(global-set-key [M-c] 'capitalize-word)

;; hold shift to move through windows
(windmove-default-keybindings)
(global-set-key (kbd "M-s-<left>")  'windmove-left)
(global-set-key (kbd "M-s-<right>") 'windmove-right)
(global-set-key (kbd "s-<left>")    'windmove-left)
(global-set-key (kbd "s-<right>")   'windmove-right)
(global-set-key (kbd "s-<down>")    'windmove-down)
(global-set-key (kbd "s-<up>")      'windmove-up)

;; spelling
(global-set-key (kbd "C-c j") 'flyspell-check-previous-highlighted-word)
(global-set-key (kbd "s-s") 'ispell-word)

;; Highlight current line
(global-hl-line-mode 1)

;; goto line
(global-set-key (kbd "M-g") 'goto-line)

(global-set-key (kbd "<C-return>") 'newline-and-indent)

;; Don't use hard tabs
(setq-default indent-tabs-mode nil)

;; comments
(defun toggle-comment-on-line ()
  "comment or uncomment current line"
  (interactive)
  (comment-or-uncomment-region (line-beginning-position) (line-end-position)))
(global-set-key (kbd "C-;") 'comment-line)

;; use 2 spaces for tabs
(defun die-tabs ()
  (interactive)
  (set-variable 'tab-width 2)
  (mark-whole-buffer)
  (untabify (region-beginning) (region-end))
  (keyboard-quit))

(setq electric-indent-mode nil)

;; Turn on recent file mode so that you can more easily switch to
;; recently edited files when you first start emacs
(setq recentf-save-file (concat user-emacs-directory ".recentf"))
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 40)

;; Automatically load paredit when editing a lisp file
;; More at http://www.emacswiki.org/emacs/ParEdit
(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
(add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook           #'enable-paredit-mode)

;; eldoc-mode shows documentation in the minibuffer when writing code
;; http://www.emacswiki.org/emacs/ElDoc
(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
(add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)

(when
    (member "Hack" (font-family-list))
  (set-face-attribute 'default nil :font "Hack")
  (set-frame-font "Hack" nil t))
