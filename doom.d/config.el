;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Honza Pokorny"
      user-mail-address "me@honza.ca")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "Monoid" :size 14))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-solarized-dark)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Dropbox/org/")
(setq org-roam-directory "~/Dropbox/org/")
(setq org-journal-dir "~/Dropbox/org/")
(setq org-journal-date-prefix "#+TITLE: ")
(setq org-journal-file-format "%Y%m%d.org")
(setq org-journal-date-format "%Y-%m-%d")

(setq org-refile-targets
  '(("~/Dropbox/org/gtd.org" :maxlevel . 3)
    ("~/Dropbox/org/someday.org" :level . 1)
    ("~/Dropbox/org/tickler.org" :maxlevel . 2)))

(setq org-agenda-files '("~/Dropbox/org/inbox.org"
                          "~/Dropbox/org/gtd.org"
                          "~/Dropbox/org/tickler.org"))
;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

(setq elfeed-feeds
      '("https://www.challies.com/feed/"
        "https://honza.ca/atom.xml"
        "https://jktauber.com/feed/all/atom/"
        "https://wyatt.pokorny.ca/feed/"
        "https://drewdevault.com/feed.xml"
        "https://www.patheos.com/blogs/chorusinthechaos/feed/"
        "https://virus.pokorny.ca/atom.xml"))

(define-key evil-normal-state-map (kbd ";") 'evil-ex)

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.

(use-package! nov
  :mode ("\\.epub\\'" . nov-mode))

;; Add modes to this list if you want to disable automatic formatting
;; Note the negation
(setq +format-on-save-enabled-modes
      '(not
        emacs-lisp-mode  ; elisp's mechanisms are good enough
        sql-mode         ; sqlformat is currently broken
        tex-mode         ; latexindent is broken
        latex-mode

        scss-mode
        yaml-mode
        gfm
        markdown))
