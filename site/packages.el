
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
  (add-to-list 'ac-modes 'cider-mode)
  )

(use-package popup)
