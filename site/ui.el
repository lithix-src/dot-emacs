;; site/ui.el
(setq inhibit-splash-screen t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(ido-mode t)
(winner-mode t)

(setq fill-column 80)
(setq indent-tabs-mode nil)
(setq tab-stop-list (number-sequence 4 120 4))

;; trun beep off
(setq visible-bell t)

;; full path in title bar
(setq-default frame-title-format "%b [ %f ]")

;; don't pop up front menu
(global-set-key (kbd "s-t") '(lambda () (interactive)))

(use-package doom-themes
  :config
  (load-theme 'doom-gruvbox t))
