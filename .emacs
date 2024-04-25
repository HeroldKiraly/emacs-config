(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-visited-mode t)
 '(cua-mode t)
 '(custom-enabled-themes '(doom-tokyo-night))
 '(custom-safe-themes
   '("4594d6b9753691142f02e67b8eb0fda7d12f6cc9f1299a49b819312d6addad1d" default))
 '(display-line-numbers-type 'visual)
 '(display-time-mode t)
 '(fringe-mode 0 nil (fringe))
 '(package-selected-packages
   '(tree-sitter-langs tree-sitter js2-mode doom-themes minimap dashboard all-the-icons spacious-padding vertico-posframe vertico-multiform typescript-mode treemacs-tab-bar treemacs-persp treemacs-magit treemacs-icons-dired treemacs-projectile treemacs))
 '(tab-bar-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(fringe ((t :background "#000000")))
 '(header-line ((t :box (:line-width 4 :color "#212121" :style nil))))
 '(header-line-highlight ((t :box (:color "#ffffff"))))
 '(keycast-key ((t)))
 '(line-number ((t :background "#000000")))
 '(mode-line ((t :box (:line-width 6 :color "#323232" :style nil))))
 '(mode-line-active ((t :box (:line-width 6 :color "#323232" :style nil))))
 '(mode-line-highlight ((t :box (:color "#ffffff"))))
 '(mode-line-inactive ((t :box (:line-width 6 :color "#1e1e1e" :style nil))))
 '(tab-bar-tab ((t :box (:line-width 4 :color "#0e0e0e" :style nil))))
 '(tab-bar-tab-inactive ((t :box (:line-width 4 :color "#424242" :style nil))))
 '(tab-line-tab ((t)))
 '(tab-line-tab-active ((t)))
 '(tab-line-tab-inactive ((t)))
 '(vertical-border ((t :background "#000000" :foreground "#000000")))
 '(window-divider ((t (:background "#000000" :foreground "#000000"))))
 '(window-divider-first-pixel ((t (:background "#000000" :foreground "#000000"))))
 '(window-divider-last-pixel ((t (:background "#000000" :foreground "#000000")))))
 '(js2-object-property ((t (:inherit font-lock-variable-name-face))))

;; Programming Line Numbers
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(add-hook 'prog-mode-hook 'tree-sitter-hl-mode)

;; Doom Themes Config
(require 'doom-themes)

  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled

  ;; Load the theme (doom-one, doom-molokai, etc); keep in mind that each
  ;; theme may have their own settings.
  (load-theme 'doom-one t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)

;; use-package Init
(require 'package)
(add-to-list 'package-archives '("gnu"   . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-and-compile
  (setq use-package-always-ensure t
        use-package-expand-minimally t))

;; Treemacs Config and Init
(use-package treemacs
  :ensure t
  :bind ("<f5>" . treemacs)
  :custom
  (treemacs-is-never-other-window t)
  :hook
  (treemacs-mode . treemacs-project-follow-mode))

;; Minimap Config
(use-package minimap)

;; Solair Config
(use-package solaire-mode
  :ensure t
  :hook (after-init . solaire-global-mode)
  :config
  (push '(treemacs-window-background-face . solaire-default-face) solaire-mode-remap-alist)
  (push '(treemacs-hl-line-face . solaire-hl-line-face) solaire-mode-remap-alist))

;; Golden Ratio Config
(use-package golden-ratio
  :ensure t
  :hook (after-init . golden-ratio-mode)
  :custom
  (golden-ration-exclude-modes '(occur-mode)))

;; Vertico Config
(use-package vertico-multiform
  :ensure t
  :hook (after-init . vertico-multiform-mode)
  :init
  (setq vertico-multiform-commands
        '((consult-line (:not posframe))
          (gopar/consult-line (:not posframe))
          (consult-ag (:not posframe))
          (t posframe))))

(use-package vertico-posframe
  :ensure t
  :custom
  (vertico-posframe-parameters
   '((left-fringe . 8)
     (right-fringe . 8))))

;; Spacious Padding Config
(use-package spacious-padding
  :ensure t
  :hook (after-init . spacious-padding-mode)
  )

;; All The Icons Config
(use-package all-the-icons
  :ensure t
  :if (display-graphic-p))

;; Dashboard Config
(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook))

;; Removes Emacs from Beeping
(setq
 debug-on-error nil
 warning-minimum-level :emergency
 ring-bell-function 'ignore)

;; Text Highlighting
(setq font-lock-maximum-decoration t)
