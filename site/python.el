;; site/python.el

(use-package flycheck)

(use-package lsp-mode
  :commands lsp)

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
    (company-quickhelp-mode))

(use-package pyenv
    :straight (:host github :repo "aiguofer/pyenv.el")
    :config
    (setq pyenv-installation-dir (getenv "PYENV"))    
    (setq pyenv-use-alias 't)
    (setq pyenv-modestring-postfix nil)
    (setq pyenv-set-path (getenv "PYENV_ROOT"))

(global-pyenv-mode)
    (defun pyenv-update-on-buffer-switch (prev curr)
      (if (string-equal "Python" (format-mode-line mode-name nil nil curr))
          (pyenv-use-corresponding)))
    (add-hook 'switch-buffer-functions 'pyenv-update-on-buffer-switch))

(setq 
 python-shell-interpreter "ipython"
 python-shell-interpreter-args "--colors=Linux --profile=default"
 python-shell-prompt-regexp "In \\[0-9]+\\]: "
 python-shell-prompt-output-regexp "Out \\[0-9]+\\]:")
