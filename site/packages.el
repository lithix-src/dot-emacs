
;; site/packages.el

;; enable straight as default manager
(setq straight-use-package-by-default t)

;; use-package macro for clean pkg install/config
(straight-use-package 'use-package)
(require `use-package)

;; paredit mode
(use-package paredit)

(use-package projectile
  :config
  (projectile-mode +1)
  (define-key projectile-mode-map (kbd "M-p") 'projectile-command-map)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))

;; enhances m-x allowing easier command exec
(straight-use-package 'smex)

(use-package tagedit)

(use-package magit
  :config
  (global-set-key (kbd "C-x m") 'magit-status))

(use-package better-defaults)

(use-package markdown-mode)

(use-package ivy
  :config
  (setq
   ivy-use-virtual-buffers t
   ivy-count-format "(%d/%d) "
   enable-recursive-minibuffers t
   ivy-initial-inputs-alist nil
   ivy-height 10
   ivy-re-builders-alist '((swiper . ivy--regex-plus)
                           (t . ivy--regex-fuzzy))))

(use-package counsel
  :config
  (global-set-key (kbd "M-x") 'counsel-M-x)
  (global-set-key (kbd "C-c y") 'counsel-yank-pop)
  (global-set-key (kbd "C-x C-f") 'counsel-find-file))

(use-package counsel-projectile)

(use-package helm
  :config
  (require 'helm-config)
  (helm-mode +1)
  (global-set-key (kbd "C-x SPC") 'helm-mini)
  (global-set-key (kbd "M-x") 'helm-M-x)
  (global-set-key (kbd "C-x b") 'helm-buffers-list))

(use-package auto-complete
  :config
  (ac-config-default)
  (global-auto-complete-mode)
  (setq
   ac-auto-start 2
   ac-override-local-map nil
   ac-use-menu-map t
   ac-ignore-case nil
   ac-candidate-limit 20)
  (add-to-list 'ac-modes 'web-mode)
  (add-to-list 'ac-modes 'elsip-mode)
  (add-to-list 'ac-modes 'python-mode)
  (add-to-list 'ac-modes 'cider-mode))

(use-package popup)

(use-package nyan-mode
  :ensure t ;; install package if not found OR: (setq use-package-always-ensure t)
  :init
  (setq nyan-bar-length 20)
  :config
  (nyan-mode t))

(use-package smart-mode-line
  :ensure t ;; install package if not found OR: (setq use-package-always-ensure t)
  :config
  (setq sml/no-confirm-load-theme t)
  (setq sml/theme 'respectful) ;; select theme: light, dark, respectful
  ;; hiding minor modes from mode line (don't forget the leading space)
  (setq rm-blacklist '(" Fill" " Ind" " MRev" " hl-p" " Guide" " OrgStruct" " ," " PCRE" " counsel" " OTSH" " dired-icon" " GitGutter" " WK" " FlyC-" " Ddl" " Diary"))
  ;; does not hide in Org-agenda:  "Diary " "Ddl " "Grid " "Habit " "FlyC " "WK "
  ;; replacing path names with abbrevations:
  (add-to-list 'sml/replacer-regexp-list '("^.*/.emacs.d" ":EMACS:") t)
  (add-to-list 'sml/replacer-regexp-list '("^.*/projects/" ":PRJ:") t)
  (add-to-list 'sml/replacer-regexp-list '("^.*/projects/compliance_science" ":TEP:") t)
  (smart-mode-line-enable))

;; icons in mode-line instead of text
(use-package mode-icons
  :config
  (mode-icons-mode))


;;(defalias 'list-buffers 'ibuffer)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(autoload 'ibuffer "ibuffer" "List buffers." t)

(setq ibuffer-saved-filter-groups
      (quote (("default"
               ("dired" (mode . dired-mode))
               ("python" (mode . python-mode))
               ("org" (or (mode . org-mode)
                          (mode . org-agenda-mode)
                          ))
               ("emacs" (or
                         (name . "^\\*scratch\\*$")
                         (name . "^\\*Messages\\*$")))))))

(add-hook 'ibuffer-mode-hook
          (lambda ()
            (ibuffer-switch-to-saved-filter-groups "default")))
