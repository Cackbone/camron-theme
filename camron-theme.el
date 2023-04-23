;;; camron-theme.el --- Camron Theme

;; Author: Cédric Legendre <contact@cackbone.fr>
;; Package-Version: 1.0

;; Package-Requires: ((autothemer "0.2"))

;;; Commentary:

;; A dark purple theme

;;; Code:
(require 'autothemer)

(unless (>= emacs-major-version 24)
  (error "Requires Emacs 24 or later"))

;;;###autoload
(and load-file-name
     (boundp 'custom-theme-load-path)
     (add-to-list 'custom-theme-load-path
                  (file-name-as-directory
                   (file-name-directory load-file-name))))


(defmacro camron-deftheme (name description palette &rest body)
  "Called by the theme with a NAME, DESCRIPTION, PALETTE and BODY to set the faces."
  `(autothemer-deftheme
    ,name
    ,description
    ,palette
    (
     ;;; Basic UI
     (default              (:background base6 :foreground base1))
     (cursor               (:background purple3))
     (fringe               (:background base6))
     (hl-line              (:background base7))
     (region               (:background base5))
     (minibuffer-prompt    (:foreground pink3))
     (border               (:background base6))
     (vertical-border      (:foreground base4))
     (internal-border      (:foreground base4))
     (window-divider       (:foreground base4))
     (link                 (:weight 'normal :underline t :foreground pink3))
     (link-visited         (:weight 'normal :underline t :foreground pink3))
     (shadow               (:foreground base3))
     (header-line          (:background base7 :foreground base2))


     ;;; Syntax

     (font-lock-builtin-face                 (:foreground pink3 :weight 'bold))
     (font-lock-comment-face                 (:foreground base3))
     (font-lock-comment-delimiter-face       (:foreground base3))
     (font-lock-constant-face                (:foreground green1 :weight 'bold))
     (font-lock-function-name-face           (:foreground pink2))
     (font-lock-keyword-face                 (:foreground purple1))
     (font-lock-negation-char-face           (:foreground base2))
     (font-lock-preprocessor-face            (:foreground blue1))
     (font-lock-regexp-grouping-construct    (:foreground green1))
     (font-lock-regexp-grouping-backslash    (:foreground green1))
     (font-lock-string-face                  (:foreground green1))
     (font-lock-type-face                    (:foreground base2))
     (font-lock-variable-name-face           (:foreground pink1))
     (font-lock-warning-face                 (:foreground base2))

     ;;; Basic highlights

     (success      (:foreground green1))
     (warning      (:foreground yellow1))
     (error        (:foreground red2 :bold t))
     (highlight    (:background base7))
     (match        (:background pink3 :foreground base1))


     ;;; Whitespaces

     ; TODO
     (tailing-whitespace    (:background red2))


     ;;; paren
     (show-paren-match       (:background base2 :foreground base6))
     (show-paren-mismatch    (:background red2))
     (paren-face-match       (:background base2 :foreground base6))
     (paren-face-mismatch    (:background red2))
     (paren-face-no-match    (:background red2))


     ;;; Line numbers

     ; TODO
     (linum                   (:background "unspecified-bg" :foreground base3))
     (linum-highlight-face    (:inverse-video nil :background base3))


     ;;; Diff

     (diff-added          (:foreground green1))
     (diff-changed        (:foreground yellow1))
     (diff-context        (:foreground base2))
     (diff-file-header    (:foreground base2 :height 1.1 :weight 'bold))
     (diff-hunk-header    (:foreground red2))
     (diff-removed        (:foreground pink3))


     ;;; Popup

     ; TODO
     (popup-tip-face (:background base5 :foreground base2))


     ;;; Powerline
     (mode-line              (:background base7 :foreground base1))
     (mode-line-inactive     (:foreground base2 :background base5 :box nil))
     (powerline-active1      (:background base5 :foreground base2))
     (powerline-active2      (:background base5 :foreground base2))
     (powerline-inactive1    (:background base4 :foreground base2))
     (powerline-inactive2    (:background base4 :foreground base2))


     ;;; isearch
     (isearch                (:background yellow1 :foreground base1 :weight 'bold))
     (isearch-fail           (:background red1 :foreground base1))
     (lazy-highlight         (:background base5))
     (trailing-whitespace    (:background base5))


     ;;; Auto complete
     (ac-candidate-face    (:background base5 :foreground base2))
     (ac-selection-face    (:background base7 :foreground base1))

     ;;; Company

     (company-tooltip                          (:background base5 :foreground base2))
     (company-tooltip-selection                (:background base7 :foreground base1))
     (company-tooltip-annotation               (:background base5 :foreground base2))
     (company-tooltip-annotation-selection     (:background base7 :foreground base1))
     (company-tooltip-mouse                    (:background base4))
     (company-tooltip-common                   (:foreground pink3))
     (company-tooltip-common-selection         (:foreground blue1))
     (company-scrollbar-fg                     (:background base3))
     (company-scrollbar-bg                     (:background base5))
     (company-preview                          (:background base5))
     (company-preview-common                   (:background base5 :foreground pink3))

     ;;; Flycheck
     (flycheck-error      (:underline (:style 'wave :color red1)))
     (flycheck-warning    (:underline (:style 'wave :color yellow1)))
     (flycheck-info       (:underline (:style 'wave :color blue1)))


     ;;; lsp-ui
     (lsp-ui-doc-background                             (:background base5))
     (lsp-ui-doc-header                                 (:background base7))
     (lsp-headerline-breadcrumb-path-face               (:foreground base2))
     (lsp-headerline-breadcrumb-path-error-face         (:underline (:style 'wave :color red1)))
     (lsp-headerline-breadcrumb-path-warning-face       (:underline (:style 'wave :color yellow1)))
     (lsp-headerline-breadcrumb-path-info-face          (:underline (:style 'wave :color blue1)))
     (lsp-headerline-breadcrumb-symbols-face            (:foreground pink3))
     (lsp-headerline-breadcrumb-symbols-error-face      (:underline (:style 'wave :color red1)))
     (lsp-headerline-breadcrumb-symbols-warning-face    (:underline (:style 'wave :color yellow1)))
     (lsp-headerline-breadcrumb-symbols-info-face       (:underline (:style 'wave :color blue1)))


     ;;; Term
     (term-color-black     (:foreground black))
     (term-color-red       (:foreground red2))
     (term-color-green     (:foreground green1))
     (term-color-yellow    (:foreground yellow1))
     (term-color-blue      (:foreground blue1))
     (term-color-purple    (:foreground base2))
     (term-color-cyan      (:foreground green1))
     (term-color-white     (:foreground white))


     ;; eshell
     (eshell-prompt    (:foreground red2 :weight 'bold))


     ;;; Org mode
     (org-block               (:background base5))
     (org-block-begin-line    (:background base5 :foreground base3))
     (org-block-end-line      (:background base5 :foreground base3))
     (org-date                (:foreground green1 :underline t))
     (org-footnote            (:foreground green1 :slant 'italic :underline t))
     (org-hide                (:foreground base5))
     (org-level-1             (:weight 'bold :height 1.2 :foreground green1))
     (org-level-2             (:weight 'bold :height 1.1 :foreground green1))
     (org-level-3             (:weight 'bold :foreground pink3))
     (org-level-4             (:weight 'bold :foreground base1))
     (org-level-5             (:weight 'bold :foreground yellow1))
     (org-level-6             (:weight 'bold :slant 'italic :foreground green1))
     (org-level-7             (:weight 'bold :slant 'italic :foreground green1))
     (org-level-8             (:weight 'bold :foreground pink3))
     (org-level-9             (:weight 'bold :foreground base1))
     (org-link                (:weight 'normal :underline t :foreground pink3))
     (org-list-dt             (:weight 'bold :slant 'italic))
     (org-special-keyword     (:foreground yellow1 :weight 'bold))
     (org-target              (:foreground base2 :underline t :weight 'bold))
     (org-table               (:foreground base2))
     (org-todo                (:foreground red1 :weight 'bold)))

     ,@body))



(camron-deftheme
 camron
 "I get computers 'puting."
 ; TODO: Xterm colors
 ((((class color) (min-colors 24))) ; 24bit GUI color
  (base1 "#ddcedc")
  (base2 "#b89eb6")
  (base3 "#473047")
  (base4 "#3b273b")
  (base5 "#302030")
  (base6 "#211621")
  (base7 "#030203")
  (black "#7a527a")
  (white "#211621")
  (purple1 "#a3598a")
  (purple2 "#b89eb6")
  (purple3 "#5f3a79")
  (pink1 "#e8a9b5")
  (pink2 "#de7e7e")
  (pink3 "#ab4192")
  (blue1 "#088afb")
  (red1 "#ff5c8f")
  (red2 "#da5c8f")
  (green1 "#6ea36e")
  (yellow1 "#eea806"))

 (custom-theme-set-variables 'camron
                             `(ansi-color-names-vector
                               [,base6
                                ,red2
                                ,green1
                                ,yellow1
                                ,blue1
                                ,base2
                                ,green1
                                ,base1])))

(provide-theme 'camron)
;;; camron-theme.el ends here
