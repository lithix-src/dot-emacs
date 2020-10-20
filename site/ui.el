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

(use-package spacegray-theme :defer t)
(use-package doom-themes :defer t)
(load-theme 'doom-palenight t)

(set-face-attribute 'default nil :font "Fira Code Retina" :height 120)
;; Set the fixed pitch face
(set-face-attribute 'fixed-pitch nil :font "Fira Code Retina" :height 120)

;; Set the variable pitch face
(set-face-attribute 'variable-pitch nil :font "Cantarell" :height 125 :weight 'regular)

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

(defun dw/replace-unicode-font-mapping (block-name old-font new-font)
  (let* ((block-idx (cl-position-if
                         (lambda (i) (string-equal (car i) block-name))
                         unicode-fonts-block-font-mapping))
         (block-fonts (cadr (nth block-idx unicode-fonts-block-font-mapping)))
         (updated-block (cl-substitute new-font old-font block-fonts :test 'string-equal)))
    (setf (cdr (nth block-idx unicode-fonts-block-font-mapping))
          `(,updated-block))))


(use-package unicode-fonts
  :ensure t
  :custom
  (unicode-fonts-skip-font-groups '(low-quality-glyphs))
  :config
  ;; Fix the font mappings to use the right emoji font
  (mapcar
    (lambda (block-name)
      (dw/replace-unicode-font-mapping block-name "Apple Color Emoji" "Noto Color Emoji"))
    '("Dingbats"
      "Emoticons"
      "Miscellaneous Symbols and Pictographs"
      "Transport and Map Symbols"))
  (unicode-fonts-setup))

(use-package emojify
  :hook (erc-mode . emojify-mode)
  :commands emojify-mode)

(setq display-time-format "%l:%M %p %b %y"
      display-time-default-load-average nil)

;; hides pesky minor modes from the modelines
(use-package diminish)

(use-package smart-mode-line
  :ensure t
  :config
  (setq sml/no-confirm-load-theme t)
  (sml/setup)
  (sml/apply-theme 'respectful)  ; Respect the theme colors
  (setq sml/mode-width 'right
      sml/name-width 60)
  (setq rm-blacklist
        '(" Fill" " Ind" " MRev" " hl-p" " Guide" " OrgStruct" " ," " PCRE" " counsel" " OTSH" " dired-icon" " GitGutter" " WK" " FlyC-" " Ddl" " Diary"))
  (add-to-list 'sml/replacer-regexp-list '("^.*/.emacs.d" ":EMACS:") t)
  (add-to-list 'sml/replacer-regexp-list '("^.*/projects/" ":PRJ:") t)
  (add-to-list 'sml/replacer-regexp-list '("^.*/projects/compliance_science" ":TEP:") t)
  (add-to-list 'sml/replacer-regexp-list '("^.*/Journal/" ":JRNL:") t)
  (setq-default mode-line-format
  `("%e"
    mode-line-front-space
    mode-line-mule-info
    mode-line-client
    mode-line-modified
    mode-line-remote
    mode-line-frame-identification
    mode-line-buffer-identification
    sml/pos-id-separator
    (vc-mode vc-mode)
    " "
                                        ;mode-linae-position
    sml/pre-modes-separator
    mode-line-modes
    " "
    mode-line-misc-info))

  (setq rm-excluded-modes
    (mapconcat
      'identity
      ; These names must start with a space!
      '(" GitGutter" " MRev" " company"
      " Helm" " Undo-Tree" " Projectile.*" " Z" " Ind"
      " Org-Agenda.*" " ElDoc" " SP/s" " cider.*")
      "\\|"))
  (smart-mode-line-enable))

(use-package alert
  :commands alert
  :config
  (setq alert-default-style 'notifications))

(setq display-time-world-list
  '(("America/Los_Angeles" "Seattle")
    ("America/New_York" "New York")
    ("Europe/Athens" "Athens")
    ("Pacific/Auckland" "Auckland")
    ("Asia/Shanghai" "Shanghai")))

(setq display-time-world-time-format "%a, %d %b %I:%M %p %Z")

(use-package default-text-scale
  :defer 1
  :config
  (default-text-scale-mode))(use-package default-text-scale
  :defer 1
  :config
  (default-text-scale-mode))

(use-package ace-window
  :bind (("M-o" . ace-window))
  :config
  (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l)))
