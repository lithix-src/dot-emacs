
;; site/packages.el

;; enable straight as default manager
(setq straight-use-package-by-default t)

;; use-package macro for clean pkg install/config
(straight-use-package 'use-package)
(require `use-package)

(use-package tabbar
  :ensure t
  :config
  (global-set-key (kbd "M-`") tab-next)
  (global-set-key (kbd "M-~") tab-bar-switch-to-prev-tab))

;; global mode
(use-package paredit
  :config
  (add-hook 'auto-mode-alist '("\\*edn$\\'" . paredit-mode))
  (add-hook 'auto-mode-alist '("\\*.el$\\'" . paredit-mode)))

(use-package projectile
  :config
  (projectile-mode +1)
  (setq projetctil-auto-discover t)
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
               ("yaml" (mode . yaml-mode))
               (("ansible") (mode . ansible-mode))
               (("bash") (mode . shell-script-mode))
               (("cmd") (mode . bat-mode))
               (("hcl") (mode . hcl-mode))
               ("org" (or (mode . org-mode)
                          (mode . org-agenda-mode)
                          ))
               ("emacs" (or
                         (name . "^\\*scratch\\*$")
                         (name . "^\\*Messages\\*$")))))))

(add-hook 'ibuffer-mode-hook
          (lambda ()
            (ibuffer-switch-to-saved-filter-groups "default")))

(use-package yaml-mode
  :config
  (add-to-list
   'auto-mode-alist '("\\.yml\\'" . yaml-mode)))

(use-package ansible
  :config
  (add-hook 'yaml-mode-hook '(lambda () (ansible 1)))
  :bind
  (
   ("C-, b" . 'ansible-decrypt-buffer)
   ("C-, b" . 'ansible-encrypt-buffer)))

(use-package hcl-mode
  :config
  (add-to-list
   'auto-mode-alist
   '("\\.tf\\'" . hcl-mode)
   '(("\\.nomad\\'" hcl-mode))))

(use-package expand-region
  :bind (("M-[" . er/expand-region)
         ("C-(" . er/mark-outside-pairs)))
