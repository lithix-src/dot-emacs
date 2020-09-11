;; site/clojure.el

;; Clojure stuff
(use-package clojure-mode)
(use-package clojure-mode-extra-font-locking)
(use-package cider)

;; Lisp-friendly hippie expand
(setq hippie-expand-try-functions-list
      '(try-expand-dabbrev
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill
        try-complete-lisp-symbol-partially
        try-complete-lisp-symbol))
