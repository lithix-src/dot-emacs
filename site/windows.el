;; https://github.com/termitereform/JunkPile/blob/master/emacs-on-windows.md
;; This sets up spellchecking with Aspell, and fixes Ghostscript so I can view PDFs, among other things

(when (eq system-type 'windows-nt)
  (setq w32-allow-system-shell t) ; enables cmd.exe as shell
  (setq save-interprogram-paste-before-kill 1 ; stop killing my clipboard, plz
        ; ghostscript on windows
        ; see https://www.emacswiki.org/emacs/docviewmode for details
        doc-view-ghostscript-program "~/Applications/msys2/mingw64/bin/gswin32c.exe"
        ; set curl location
        request-curl "~/Applications/msys2/mingw64/bin/curl.exe")
  (cond ((executable-find "aspell") ; spell-checking
         (setq ispell-program-name "aspell")
         (setq ispell-extra-args '("--sug-mode=ultra" "--lang=en_us")))))

;; The locate command is really great... if you're not on Windows. Since I use the ivy \ swiper \ counsel stack, I've added the following to my init to use the Windows search tool everything instead:
(with-eval-after-load 'counsel
  (when (eq system-type 'windows-nt)
    (defun counsel-locate-cmd-es (input)
      "Return a shell command based on INPUT."
      (counsel-require-program "es.exe")
      (format "es.exe -r %s"
              (counsel--elisp-to-pcre
               (ivy--regex input t))))))
