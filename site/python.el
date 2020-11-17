;; site/python.el
(setq python-shell-interpreter "python3")

(use-package flycheck)

(use-package python-mode
  :bind (:map python-mode-map
              ("C-c C-l" . py-send-file)
              ("C-c C-#" . comment-or-uncomment-region)
              ("C-c C-r" . py-send-region-ipython)
              ("C-c C-s" . py-send-string)
              ("C-c C-z" . py-switch-to-shell)))

(setq flycheck-python-pycompile-executable "python3")
(setq doom-modeline-python-executable "python3")
(defvar doom-modeline-python-executable "python"
  "What executable of Python will be used (if nil nothing will be showed).")
(setq flycheck-python-pycompile-executable "python3"
      flycheck-python-pylint-executable "python3"
      flycheck-python-flake8-executable "python3")
(setq doom-modeline-major-mode-icon nil
      doom-modeline-persp-name t
      doom-modeline-github t
      doom-modeline-version t
      doom-modeline-minor-modes t)

(use-package lsp-mode
  :ensure t
  :config
  (use-package lsp-ui
    :config
    (setq lsp-ui-sideline-ignore-duplicate t)
    (add-hook 'lsp-mode-hook 'lsp-ui-mode))


  (use-package company-lsp
    :config
    (push 'company-lsp company-backends))


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

(setq
 python-shell-interpreter "ipython3"
 python-shell-interpreter-args "--colors=Linux --profile=default -i"
 python-shell-prompt-regexp "In \\[0-9]+\\]: "
 python-shell-prompt-output-regexp "Out \\[0-9]+\\]:")

(use-package company-jedi
  :ensure t
  :config
  :hook
  ((python-mode . jedi:setup))
  :init
  (setq jedi:complete-on-dot t)
  (setq jedi:use-shortcuts t)
  (add-hook 'python-mode-hook
            (lambda () (add-to-list 'company-backends 'company-jedi))))

(use-package pyenv
  :straight (:host github :repo "aiguofer/pyenv.el")
  :ensure t
  :config
  (global-pyenv-mode))

(use-package python
  :mode ("\\.py\\'" . python-mode)
        ("\\.wsgi$" . python-mode)
  :interpreter ("python" . python-mode)

  :init
  (setq-default indent-tabs-mode nil)

  :config
  (setq python-indent-offset 4)
  (add-hook 'python-mode-hook 'smartparens-mode)
  (add-hook 'python-mode-hook 'color-identifiers-mode))

(use-package jedi
  :ensure t
  :init
  (add-to-list 'company-backends 'company-jedi)
  :config
  (use-package company-jedi
    :ensure t
    :init
    (add-hook 'python-mode-hook (lambda () (add-to-list 'company-backends 'company-jedi)))
    (setq company-jedi-python-bin "python")))

(use-package elpy
  :ensure t
  :commands elpy-enable
  :init (with-eval-after-load 'python (elpy-enable))

  :config
  (electric-indent-local-mode -1)
  (delete 'elpy-module-highlight-indentation elpy-modules)
  (delete 'elpy-module-flymake elpy-modules)

  (defun ha/elpy-goto-definition ()
    (interactive)
    (condition-case err
        (elpy-goto-definition)
      ('error (xref-find-definitions (symbol-name (symbol-at-point))))))

  :bind (:map elpy-mode-map ([remap elpy-goto-definition] .
                             ha/elpy-goto-definition)))
