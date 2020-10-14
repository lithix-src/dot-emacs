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

(defun my-vsplit-last-buffer ()
  (interactive)
  (split-window-vertically)
  (other-window 1 nil)
  (switch-to-next-buffer))

(defun my-hsplit-last-buffer ()
  (interactive)
  (split-window-horizontally)
  (other-window 1 nil)
  (switch-to-next-buffer))

(bind-key "C-x 2" 'my-vsplit-last-buffer)
(bind-key "C-x 3" 'my-hsplit-last-buffer)

;; Turn off the menu bar at the top of each frame because it's distracting
(menu-bar-mode -1)

;; Show line numbers
;; (global-linum-mode -1)

;; No cursor blinking, it's distracting
(blink-cursor-mode 0)
