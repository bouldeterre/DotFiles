;;; package --- Summary
;;; Commentary:
;;; Emacs config
;;; Code:
;; ** MELPA **
(when (version<= "26.0.50" emacs-version )
  (global-display-line-numbers-mode))

(when (>= emacs-major-version 24)
  (require 'package)
  (setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                           ("melpa" . "https://melpa.org/packages/")))
  (package-initialize)
  ;; ** Helm config **
  (require 'helm-config)
  (helm-mode 1)

  (global-set-key (kbd "M-x") #'helm-M-x)
  (global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
  (global-set-key (kbd "C-x C-f") #'helm-find-files)

  (add-hook 'after-init-hook 'global-company-mode)
  (add-hook 'after-init-hook #'global-flycheck-mode)

  )



(column-number-mode t)
(show-paren-mode 1)
(require 'paren)
(set-face-background 'show-paren-match (face-background 'default))
(set-face-foreground 'show-paren-match "#ffffff")
(set-face-attribute 'show-paren-match nil :weight 'ultra-bold)


(setq truncate-partial-width-windows nil)

;; *** Mouse Mode ***
(require 'mouse)
(xterm-mouse-mode t)
(defun track-mouse (e))
(setq mouse-sel-mode t)

(setq ring-bell-function 'ignore)

;; ** Packages Init **


(defun my/python-mode-hook ()
  (add-to-list 'company-backends 'company-jedi))

(add-hook 'python-mode-hook 'my/python-mode-hook)


;; ** Personal key **
(global-set-key (kbd "<tab>") 'company-indent-or-complete-common)
(global-set-key (kbd "TAB") 'company-indent-or-complete-common)



;; *** SCROLLING ***
(defun scroll-up-10-lines ()
  "Scroll up 10 lines."
  (interactive)
  (scroll-up 10))

(defun scroll-down-10-lines ()
  "Scroll down 10 lines."
  (interactive)
  (scroll-down 10))

(global-set-key (kbd "<mouse-4>") 'scroll-down-10-lines) ;
(global-set-key (kbd "<mouse-5>") 'scroll-up-10-lines) ;


;; *** BACKUP DIRECTORY

(let ((my-auto-save-dir (locate-user-emacs-file "~/EmacsSaves")))
  (setq auto-save-file-name-transforms
	`((".*" ,"~/EmacsSaves/" t)))
  (unless (file-exists-p my-auto-save-dir)
    (make-directory my-auto-save-dir)))

(let ((my-backup-dir (locate-user-emacs-file "~/EmacsBackups")))
  (setq backup-directory-alist '(("." . "~/EmacsBackups")))
  (unless (file-exists-p my-backup-dir)
    (make-directory my-backup-dir)))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cursor-type (quote (bar . 3)))
 '(custom-enabled-themes (quote (misterioso)))
 '(global-auto-revert-mode t)
 '(grep-find-ignored-directories
   (quote
    ("SCCS" "RCS" "CVS" "MCVS" ".src" ".svn" ".git" ".hg" ".bzr" "_MTN" "_darcs" "{arch}" "venv" "ansible2.2" "")))
 '(package-selected-packages
   (quote
    (company-ansible company-jedi company-ebdb helm helm-ebdb markdown-mode flycheck dockerfile-mode yaml-mode company-terraform terraform-mode elpy auto-complete go-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cursor ((t (:background "snow")))))


;;; .emacs ends here
