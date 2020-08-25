;; site/python.el

(use-package flycheck)

(use-package elpy
  :bind
  (:map elpy-mode-map
        ("C-M-n" . elpy-nav-forward-block)
        ("C-M-p" . elpy-nav-backward-block))
  :hook ((elpy-mode . flycheck-mode)
         (elpy-mode . (lambda ()
                        (set (make-local-variable 'company-backends)
                             '((elpy-company-backend :with company-yasnippet))))))
  :init
  (elpy-enable)
  :config
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (setq elpy-shell-echo-output nil)
  (setq elpy-rpc-python-command "python")
  (setq elpy-rpc-timeout 2))

(use-package company
  :diminish company-mode
  :init
  (global-company-mode)
  :config
  ;; set default `company-backends'
  (setq company-backends
        '((company-files          ; files & directory
           company-keywords       ; keywords
           company-capf)  ; completion-at-point-functions
          (company-abbrev company-dabbrev)
          ))

(use-package company-statistics
    :init
    (company-statistics-mode))

(use-package company-web)

(use-package company-try-hard
    :bind
    (("C-<tab>" . company-try-hard)
     :map company-active-map
     ("C-<tab>" . company-try-hard)))

(use-package company-quickhelp
    :config
    (company-quickhelp-mode)))

(use-package pyenv
    :straight (:host github :repo "aiguofer/pyenv.el")
    :config
    (setq pyenv-use-alias 't)
    (setq pyenv-modestring-postfix nil)
    (setq pyenv-set-path nil)

(global-pyenv-mode)
    (defun pyenv-update-on-buffer-switch (prev curr)
      (if (string-equal "Python" (format-mode-line mode-name nil nil curr))
          (pyenv-use-corresponding)))
    (add-hook 'switch-buffer-functions 'pyenv-update-on-buffer-switch))
