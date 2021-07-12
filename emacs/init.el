(scroll-bar-mode -1) ;;disable visible scrollbar
(tool-bar-mode -1) ;;and the toolbar
(tooltip-mode -1) ;;disable the tooltips, mouse is cringe.
(set-fringe-mode 10) ;;looks better
(menu-bar-mode -1) ;;disable menu bar too

(setq visible-bell t) ;;silence is golden

;(global-display-line-numbers-mode)

(dolist (mode '(text-mode-hook
		prog-mode-hook
		conf-mode-hook))
  (add-hook mode (lambda() (display-line-numbers-mode 1))))

(dolist (mode '(org-mode-hook))
  (add-hook mode (lambda() (display-line-numbers-mode 0))))

(setq-default display-line-numbers 'relative)
(setq display-line-numbers 'relative)

(set-frame-font "Hack-14" nil t)

(global-set-key (kbd "C-M-j") 'counsel-switch-buffer)

;(load-theme 'deeper-blue)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/"))
(package-initialize)

;;; (package-refresh-contents)
;;; (package-install 'use-package)
(require 'use-package)
(setq use-package-always-ensure t)


;;; GIT AND GITHUB INTEGRATION:
(use-package magit
  :commands (magit-status magit-get-current-branch))

;(use-package forge)


;;; ORG MODE CONFIGS:

(defun efs/org-mode-setup() ;taken from daviwil/emacs-from-scratch configs
  (org-indent-mode)
  ;(variable-pitch-mode 1)
  (visual-line-mode 1)
  (setq evil-auto-indent nil))

(use-package org
  :hook (org-mode . efs/org-mode-setup)
  :config
  (setq org-hide-leading-stars nil)

  (setq org-agenda-start-with-log-mode t)
  (setq org-log-done 'time)
  (setq org-log-into-drawer t)
  (setq org-agenda-files '("~/test.org"))

  (setq org-ellipsis " +"
	org-hide-emphasis-markers t))

(use-package org-superstar
  :after org
  :hook (org-mode . org-superstar-mode)
  :config
  (setq org-superstar-leading-bullet ?\s)
  :custom
    (org-superstar-headline-bullets-list '("◉" "○" "●" "○" "●" "○" "●")))

(defun efs/org-mode-visual-fill() ;taken from daviwil/emacs-from-scratch configs
  (setq visual-fill-column-width 30
	visual-fill-column-center-text t)
  (visual-fill-column-mode 1))

(use-package visual-fill-column
  :hook (org-mode . efs/org-mode-visual-fill))

;;; EVIL KEYBINDINGS:
(use-package evil
  :init (setq evil-want-keybinding nil)
  :config(evil-mode 1)
  (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state))

(use-package org-evil)
;; org-evil needs separate stuff??
(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init 'ivy)
  (evil-collection-init 'calendar)
  (evil-collection-init 'magit))


;;; IVY:
(use-package ivy
  ;; :diminish
  :init
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "(%d/%d) ")
  :bind (:map ivy-minibuffer-map
	 ("TAB" . ivy-alt-done)
         ("C-l" . ivy-alt-done)
	 ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line))
  :config (ivy-mode 1))

(use-package counsel
  :config (counsel-mode 1))


;;; WINDOW MANAGER
;;; XXX configure these later
; (use-package exwm
;   :config
;   (setq exwm-workspace-number 3)
;   (setq exwm-input-prefix-keys ;;keys that pass through to emacs
; 	'(?\C-x
; 	  ;?\C-u
; 	  ?\C-h
; 	  ?\M-x
; 	  ;?\M-`
; 	  ;?\M-&
; 	  ?\M-:
; 	  ?\C-\M-j ;;buffer list
; 	  ))
;   (define-key exwm-mode-map [?\C-q] 'exwm-input-send-next-key)
;   (setq exwm-input-global-keys
; 	'(
; 	  ;; Reset to line mode
; 	  ([?\s-r] . exwm-reset)
; 
; 	  ;; Window movement
; 	  ([?\s-h] . windmove-left)
; 	  ([?\s-l] . windmove-right)
; 	  ([?\s-j] . windmove-down)
; 	  ([?\s-k] . windmove-up)
; 	  ([?\s-w] . exwm-workspace-switch)
; 
; 	  ;; workspace s-num bindings?
; 	  )
; 
; 
; 	)
; 
; 
; 	  
;   (exwm-enable))
; ;(require 'exwm-config)
;(exwm-config-default)

;; XXX configure these later


;(use-package command-log-mode) ;so I can see what combos I'm doing
;(global-command-log-mode)
;; to activate, use:
;; C-c o

;(use-package which-key
;  :init ;(which-key-setup-side-window-right)
;  (setq which-key-idle-delay 4))
;  :diminish which-key-mode
;  :config
  ;(setq which-key-popup-type 'side-window)
  ;(setq which-key-side-window-location 'right)
  ;(setq which-key-side-window-max-width nil)
  ;(setq which-key-max-description-length 4)
;  (which-key-mode)

;;; AESTHETICS:

(use-package tron-legacy-theme
  :init
  (setq tron-legacy-theme-vivid-cursor t)
  :config
  (load-theme 'tron-legacy t))

;(use-package powerline
;  :config (powerline-center-evil-theme))

(use-package powerline-evil
  :config (powerline-evil-center-color-theme))
;; XXX what about time & battery level??


(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))
; XXX customise good colours here

;;; EXTRA:

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
