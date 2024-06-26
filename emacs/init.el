;; Breddie's Emacs config
;; Discord - breddie_sucks
;; github - https://www.github.com/breddie-normie

;; no more crappy startup UI
(setq inhibit-startup-message t)

;; putting this upfront to resolve some issues between Emacs and Herbstluftwm
(setq frame-resize-pixelwise t)
(setq frame-inhibit-implied-resize t)


;; pulicha maava thooki veliya kadaasidungada
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(menu-bar-mode -1)

;; adding fancy numbers so you don't go insane
(global-display-line-numbers-mode 1)

;; text warp - you WILL need it
 (add-hook 'text-mode-hook 'visual-line-mode)

;; setting my favorite font coz why the hell not?
(set-face-attribute 'default nil :font "JetBrains Mono" :height 150)

;; prelim disabling package.el
(setq package-enable-at-startup nil)

;; who doesn't love some transparency every once in a while?
(set-frame-parameter (selected-frame) 'alpha '(85 85))
(add-to-list 'default-frame-alist '(alpha 85 85))

;; setting up straight.el so you can rest in piss
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; the following lines makes sure the package is installed and enable them recursively

;; e-VI-l mode - a Crazy Mohan joke but necessary for sanity
(straight-use-package 'evil)
(require 'evil)
(evil-mode 1)

;; which-key - juices the best out of Emacs' key bindings
(straight-use-package 'which-key)

(require 'which-key)
(which-key-mode)

;; lsp-mode - ain't gonna use it for the time being, but I would return to it soon }:)
;; (straight-use-package 'lsp-mode)
;; (straight-use-package 'lsp-ui)
;; (straight-use-package 'company-mode)

;;(setq lsp-keymap-prefix "s-l")
;;(require 'lsp-mode)
;;(add-hook 'prog-mode-hook #'lsp)

;; doom-themes - yeah, I want a less obnoxious color scheme
(straight-use-package 'doom-themes)

(require 'doom-themes)

(setq doom-themes-enable-bold t
      doom-themes-enable-italic t)

(load-theme 'doom-city-lights t)

;; spacious padding for more AESTHETIC
(straight-use-package 'spacious-padding)

(setq spacious-padding-widths
      '( :internal-border-width 15
         :header-line-width 4
         :mode-line-width 6
         :tab-width 4
         :right-divider-width 30
         :scroll-bar-width 8))

(spacious-padding-mode 1)

;; emacs-dashboard - pimp up your rig
(straight-use-package 'dashboard)

(require 'dashboard)
(dashboard-setup-startup-hook)

(setq dashboard-banner-logo-title "The Soft Parade has begun
Listen to the Engines Hum
People out here to have some fun
A cobra on my left
Leopard on my right, yeah")

(setq dashboard-center-content t)
(setq dashboard-vertically-center-content t)
(setq dashboard-show-shortcuts nil)
(setq dashboard-startup-banner "~/.config/emacs/elysium.jpg")
(setq dashboard-items '((recents   . 5)))

;; other package which I am planning to add
;; (straight-use-package 'vertico)
;; (straight-use-package 'consult)
;; (straight-use-package 'marginalia)
;; (straight-use-package 'magit)
