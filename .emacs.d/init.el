; From daviwil. Will experiment and tune using other sources in own time later.

;; The default is 800 kilobytes.  Measured in bytes.
(setq gc-cons-threshold (* 50 1000 1000))

(defun efs/display-startup-time ()
  (message "Emacs loaded in %s with %d garbage collections."
           (format "%.2f seconds"
                   (float-time
                     (time-subtract after-init-time before-init-time)))
           gcs-done))

(add-hook 'emacs-startup-hook #'efs/display-startup-time)

(scroll-bar-mode -1) ;;disable visible scrollbar
(tool-bar-mode -1) ;;and the toolbar
(tooltip-mode -1) ;;disable the tooltips, mouse is cringe.
(set-fringe-mode 10) ;;looks better
;(menu-bar-mode -1) ;;disable menu bar too
(setq visible-bell t) ;;silence is golden

(dolist (mode '(text-mode-hook
                prog-mode-hook
                conf-mode-hook))
  (add-hook mode (lambda() (display-line-numbers-mode 1))))

(dolist (mode '(org-mode-hook))
  (add-hook mode (lambda() (display-line-numbers-mode 0))))

(setq display-line-numbers-type 'relative)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/"))
(package-initialize)

;;; manually enter:
;;; (package-refresh-contents)
;;; (package-install 'use-package)
(require 'use-package)
(setq use-package-always-ensure t)

; M-x auto-package-update-now 
(use-package auto-package-update
  :custom
  (auto-package-update-interval 7)
  (auto-package-update-prompt-before-update t)
  (auto-package-update-hide-results t)
  :config
  (auto-package-update-maybe)
  (auto-package-update-at-time "16:00"))

(use-package fira-code-mode
  :custom (fira-code-mode-disabled-ligatures '("[]" "x")) ;ligatures you don't want
  :hook prog-mode) ;mode to enable fira-code-mode in
  ;(set-frame-font "FiraCode-14" nil t)
  (set-frame-font "Hack-14" nil t)

(electric-pair-mode 1) ;auto paren () stuff

  (global-set-key (kbd "C-M-j") 'counsel-switch-buffer)

(desktop-save-mode 1) ;save desktop

(use-package undo-tree
  :bind (("C-x u" . undo-tree-visualize)
         ("C-/" . undo-tree-undo)
         ("C-?" . undo-tree-redo))
  :config (global-undo-tree-mode))

(use-package paredit)

(use-package geiser-guile)

(use-package magit
  :commands (magit-status magit-get-current-branch))
(use-package forge
  :after magit)

(defun efs/org-mode-setup() ;taken from daviwil/emacs-from-scratch configs
  (org-indent-mode)
  ;(variable-pitch-mode 1)
  (visual-line-mode 1)
  (setq evil-auto-indent nil))

(use-package org
  :hook (org-mode . efs/org-mode-setup)
  :config
  (setq org-hide-leading-stars nil
        org-agenda-start-with-log-mode t
        org-log-done 'time
        org-log-into-drawer t
        org-hidden-keywords '(author title date subtitle)
        org-agenda-files '("~/todo.org")
        org-ellipsis " +"
        org-hide-emphasis-markers t
        org-startup-folded t)
  (set-face-attribute 'org-document-title (selected-frame) :height 2.0))

(use-package org-superstar
:after org
:hook (org-mode . org-superstar-mode)
:config
(setq org-superstar-leading-bullet ?\s)
:custom
    (org-superstar-headline-bullets-list '("◉" "○" "●" "○" "●" "○" "●")))

(defun efs/org-mode-visual-fill() ;taken from daviwil/emacs-from-scratch configs
    (setq visual-fill-column-width 80
        visual-fill-column-center-text t)
    (visual-fill-column-mode 1))

(use-package visual-fill-column
  :hook (org-mode . efs/org-mode-visual-fill))

(with-eval-after-load 'org
;; This is needed as of Org 9.2
(require 'org-tempo)

(add-to-list 'org-structure-template-alist '("sh" . "src shell"))
(add-to-list 'org-structure-template-alist '("scm" . "src scheme"))
(add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp"))
(add-to-list 'org-structure-template-alist '("py" . "src python")))

(use-package evil
  :init (setq evil-want-keybinding nil evil-emacs-state-modes nil)
  :config (evil-mode 1)
  (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state))

;(use-package org-evil)

(use-package evil-collection
  :after evil
  ;:ensure t
  :config
 (evil-collection-init)) ;if we start taking a performance hit, consider listing it out...

(use-package ivy
  ;; :diminish
  :init 
  (setq ivy-use-virtual-buffers t
        ivy-count-format "(%d/%d) ")
  :bind (:map ivy-minibuffer-map
         ("TAB" . ivy-alt-done)
         ("C-l" . ivy-alt-done)
         ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line))
  :config (ivy-mode 1)
          (setq ivy-display-style 'fancy
                ivy-initial-inputs-alist nil
                ivy-re-builders-alist '((t . ivy--regex-plus))))
                ;'((swiper . ivy--regex-plus)
                  ;(counsel-descbinds . ivy--regex-plus)
                  ;(counsel-rg . ivy--regex-plus)
                  ;(t . ivy--regex-fuzzy))))

(use-package counsel
  :config (counsel-mode 1))
;(use-package counsel-projectile
;  :config (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))

;(use-package flx)

(use-package evil-nerd-commenter
  :bind ("M-;" . evilnc-comment-or-uncomment-lines))

(use-package command-log-mode) ;so I can see what combos I'm doing
(global-command-log-mode)
;; to activate, use:
;; C-c o

(use-package which-key
  :defer 0
  :diminish which-key-mode
  :config
  (setq which-key-show-early-on-C-h t
        which-key-popup-type 'side-window
        which-key-side-window-location 'right
        which-key-show-prefix 'top
        which-key-side-window-max-width 60
        which-key-max-description-length 40
        which-key-idle-delay 1)
  (which-key-mode))

(use-package pdf-tools
   ;:pin manual ;; manually update
   :config
   (pdf-tools-install)
   (setq-default pdf-view-display-size 'fit-page) ;open pdfs fit to the page
   (setq pdf-annot-activate-created-annotations t) ;automatically annotate highlights
  )

(add-hook 'pdf-view-mode-hook (lambda() (linum-mode -1)))

(use-package telega :commands (telega) :defer t)

(use-package tron-legacy-theme
  :init
  (setq tron-legacy-theme-vivid-cursor t)
  :config
  (load-theme 'tron-legacy t))

(use-package powerline-evil
  :config (powerline-evil-center-color-theme))

(use-package eterm-256color
  :hook (term-mode . eterm-256color-mode))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode)
  :config ;add more vibrant colours
  (set-face-attribute 'rainbow-delimiters-depth-1-face  (selected-frame) :foreground "dark orange")
  (set-face-attribute 'rainbow-delimiters-depth-2-face  (selected-frame) :foreground "deep pink")
  (set-face-attribute 'rainbow-delimiters-depth-3-face  (selected-frame) :foreground "chartreuse")
  (set-face-attribute 'rainbow-delimiters-depth-4-face  (selected-frame) :foreground "deep sky blue")
  (set-face-attribute 'rainbow-delimiters-depth-5-face  (selected-frame) :foreground "yellow")
  (set-face-attribute 'rainbow-delimiters-depth-6-face  (selected-frame) :foreground "orchid")
  (set-face-attribute 'rainbow-delimiters-depth-7-face  (selected-frame) :foreground "spring green")
  (set-face-attribute 'rainbow-delimiters-depth-8-face  (selected-frame) :foreground "sienna1")
  (set-face-attribute 'rainbow-delimiters-unmatched-face  (selected-frame) :foreground "red"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(global-command-log-mode t)
 '(package-selected-packages
   '(visual-fill-column org-superstar org-superstar-mode org-bullets evil-collection evil-magit magit powerline which-key rainbow-delimiters counsel ivy command-log-mode exwm org-evil evil)))
  
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Make gc pauses faster by decreasing the threshold.
(setq gc-cons-threshold (* 2 1000 1000))
