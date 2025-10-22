;; Configuração básica do Emacs.

(add-hook 'after-init-hook #'global-flycheck-mode)
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/") t) ;; Opcional, geralmente já
(with-eval-after-load 'rust-mode
      (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))
(package-initialize)

(setq inhibit-startup-message t) ; Remove tela inicial feia

(electric-pair-mode 1)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tooltip-mode -1)

(elcord-mode t)
(global-display-line-numbers-mode t)
(column-number-mode t)
(global-hl-line-mode t)

;; Alertas visuais
(setq visible-bell t)

(set-fringe-mode 10)
(delete-selection-mode t)

(setq mouse-wheel-scroll-amount '(2 ((shift) . 1))
      mouse-wheel-progressive-speed nil
      mouse-wheel-follow-mouse 't
      scroll-step 1)

(global-visual-line-mode t)

(setq backup-directory-alist `(("." . "~/.emacs-saves")))

(load-theme 'xresources t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("edf5e3ea8b3bbb4602feef2dfac8a6d5dae316fb78e84f360d55dfda0d37fa09"
     "e5b6491e99e98d0586766aaf9eb32b1dad3bc3c0c7a1921849d65d3f6d8621a6"
     "7524429b9671ca0ad0e281dc865717f44f358e417c7b587b57772430fcbe552f"
     "004f174754c688f358fa2afc4f8699b5db647fbfaa0d6b55ff39f63e05bfbbf5"
     "2a1d0e4e6bd665fb532cb07cdf466e3bba1e4f2e5e6e01eee1fa913edabe8759"
     "5a548c9d5a6ca78d13283ed709bddf3307b65a7695e1b2e2b7e0a9dde45e8599"
     "ad7d874d137291e09fe2963babc33d381d087fa14928cb9d34350b67b6556b6d"
     default))
 '(package-selected-packages
   '(badwolf-theme cargo cargo-mode company-box cpp-auto-include
		   cppinsights cpputils-cmake elcord eldoc ewal
		   ewal-doom-themes ewal-evil-cursors
		   ewal-spacemacs-themes flycheck
		   flycheck-google-cpplint flycheck-rust lsp-mode
		   rust-mode typescript-mode xresources-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;; GPT:
(use-package lsp-mode
  :hook (
	 (python-mode . lsp)
	 (rust-mode . lsp)
	 (js-mode . lsp))
  ;;...
  
  :commands lsp
  :config
  (setq lsp-completion-provider :capf)) ; important for completion-at-point

(use-package company
  :hook (after-init . global-company-mode)
  :config
  (setq company-minimum-prefix-length 1
        company-idle-delay 0.3))

(use-package company-box
  :hook (company-mode . company-box-mode))
