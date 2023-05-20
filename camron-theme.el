;;; camron-theme.el --- Camron Theme

;; Author: Cédric Legendre <contact@cackbone.fr>
;; Package-Version: 1.0.1

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

     (default              (:background base7 :foreground base1))
     (cursor               (:background purple3))
     (fringe               (:background base7))
     (hl-line              (:background base8))
     (region               (:background base6))
     (minibuffer-prompt    (:foreground pink3))
     (border               (:background base7))
     (vertical-border      (:foreground base5))
     (internal-border      (:foreground base5))
     (window-divider       (:foreground base5))
     (link                 (:weight 'normal :underline t :foreground pink3))
     (link-visited         (:weight 'normal :underline t :foreground pink3))
     (shadow               (:foreground base4))
     (header-line          (:background base8 :foreground base2))


     ;;; Syntax

     (font-lock-builtin-face                 (:foreground pink3 :weight 'bold))
     (font-lock-comment-face                 (:foreground base3))
     (font-lock-comment-delimiter-face       (:foreground base3))
     (font-lock-doc-face                     (:foreground base3))
     (font-lock-doc-delimiter-face           (:foreground base3))
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
     (highlight    (:background base8))
     (match        (:background purple3 :foreground base1))


     ;;; Whitespaces
     (trailing-whitespace    (:background red2))
     (whitespace-trailing    (:background red2))
     (whitespace-tab         (:foreground base6))
     (whitespace-space       (:foreground base6))
     (whitespace-newline     (:foreground base6))


     ;;; paren
     (show-paren-match       (:background base2 :foreground base7))
     (show-paren-mismatch    (:background red2))
     (paren-face-match       (:background base2 :foreground base7))
     (paren-face-mismatch    (:background red2))
     (paren-face-no-match    (:background red2))


     ;;; Line numbers
     (line-number                    (:background "unspecified-bg" :foreground base4))
     (line-number-current-line       (:background "unspecified-bg" :foreground base2))
     (linum                          (:background "unspecified-bg" :foreground base4))
     (linum-highlight-face           (:inverse-video nil :background base2))
     (linum-relative-current-face    (:background "unspecified-bg" :foreground base2))


     ;;; Diff

     (diff-added          (:foreground green1))
     (diff-changed        (:foreground yellow1))
     (diff-context        (:foreground base2))
     (diff-file-header    (:foreground base2 :height 1.1 :weight 'bold))
     (diff-hunk-header    (:foreground red2))
     (diff-removed        (:foreground pink3))


     ;;; Popup

     ; TODO
     (popup-tip-face (:background base6 :foreground base2))


     ;;; Powerline
     (mode-line              (:background base8 :foreground base1))
     (mode-line-inactive     (:foreground base2 :background base6 :box nil))
     (powerline-active1      (:background base6 :foreground base2))
     (powerline-active2      (:background base6 :foreground base2))
     (powerline-inactive1    (:background base5 :foreground base2))
     (powerline-inactive2    (:background base5 :foreground base2))


     ;;; isearch
     (isearch                (:background purple3 :foreground base1 :weight 'bold))
     (isearch-fail           (:background red1 :foreground base1))
     (lazy-highlight         (:background base6))

     ;;; Auto complete
     (ac-candidate-face    (:background base6 :foreground base2))
     (ac-selection-face    (:background base8 :foreground base1))

     ;;; Company

     (company-tooltip                          (:background base6 :foreground base2))
     (company-tooltip-selection                (:background base8 :foreground base1))
     (company-tooltip-annotation               (:background base6 :foreground base2))
     (company-tooltip-annotation-selection     (:background base8 :foreground base1))
     (company-tooltip-mouse                    (:background base5))
     (company-tooltip-common                   (:foreground pink3))
     (company-tooltip-common-selection         (:foreground blue1))
     (company-scrollbar-fg                     (:background base4))
     (company-scrollbar-bg                     (:background base6))
     (company-preview                          (:background base6))
     (company-preview-common                   (:background base6 :foreground pink3))

     ;;; Flycheck
     (flycheck-error                 (:underline (:style 'wave :color red1)))
     (flycheck-warning               (:underline (:style 'wave :color yellow1)))
     (flycheck-info                  (:underline (:style 'wave :color blue1)))
     (flycheck-fringe-error          (:foreground red1))
     (flycheck-fringe-warning        (:foreground yellow1))
     (flycheck-fringe-info           (:foreground blue1))
     (flycheck-error-list-error      (:foreground red1))
     (flycheck-error-list-warning    (:foreground yellow1))
     (flycheck-error-list-info       (:foreground blue1))


     ;;; lsp-ui
     (lsp-ui-doc-background                             (:background base6))
     (lsp-ui-doc-header                                 (:background base8))
     (lsp-headerline-breadcrumb-path-face               (:foreground base2))
     (lsp-headerline-breadcrumb-path-error-face         (:underline (:style 'wave :color red1)))
     (lsp-headerline-breadcrumb-path-warning-face       (:underline (:style 'wave :color yellow1)))
     (lsp-headerline-breadcrumb-path-info-face          (:underline (:style 'wave :color blue1)))
     (lsp-headerline-breadcrumb-path-hint-face          (:underline (:style 'wave :color blue1)))
     (lsp-headerline-breadcrumb-symbols-face            (:foreground pink3))
     (lsp-headerline-breadcrumb-symbols-error-face      (:underline (:style 'wave :color red1)))
     (lsp-headerline-breadcrumb-symbols-warning-face    (:underline (:style 'wave :color yellow1)))
     (lsp-headerline-breadcrumb-symbols-info-face       (:underline (:style 'wave :color blue1)))
     (lsp-headerline-breadcrumb-symbols-hint-face       (:underline (:style 'wave :color blue1)))


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

     ;;; JS2
     ;; messages
     (js2-warning                  (:underline (:color yellow1 :style 'wave)))
     (js2-error                    (:underline (:color red2 :style 'wave)))
     (js2-external-variable        (:underline (:color base1 :style 'line)))
     ;; language
     (js2-function-param           (:background nil :foreground pink1))
     (js2-function-call            (:background nil :foreground pink2))
     (js2-private-function-call    (:background nil :foreground pink2))
     (js2-instance-member          (:background nil :foreground base1))
     (js2-private-member           (:background nil :foreground base1))
     ;; jsdoc
     (js2-jsdoc-tag                (:background nil :foreground purple1))
     (js2-jsdoc-type               (:background nil :foreground base2))
     (js2-jsdoc-value              (:background nil :foreground pink1))


     ;;; Typescript
     (typescript-jsdoc-tag      (:background nil :foreground purple1))
     (typescript-jsdoc-type     (:background nil :foreground base2))
     (typescript-jsdoc-value    (:background nil :foreground pink1))

     ;;; Org mode
     (org-block                    (:background base8))
     (org-block-begin-line         (:background base5 :foreground base2))
     (org-block-end-line           (:background base5 :foreground base2))
     (org-date                     (:foreground green1 :underline t))
     (org-footnote                 (:foreground green1 :slant 'italic :underline t))
     (org-hide                     (:foreground base6))
     (org-level-1                  (:weight 'bold :height 1.2 :foreground green1 :underline t))
     (org-level-2                  (:weight 'bold :height 1.1 :foreground green1))
     (org-level-3                  (:weight 'bold :foreground pink3))
     (org-level-4                  (:weight 'bold :foreground base1))
     (org-level-5                  (:weight 'bold :foreground yellow1))
     (org-level-6                  (:weight 'bold :slant 'italic :foreground green1))
     (org-level-7                  (:weight 'bold :slant 'italic :foreground green1))
     (org-level-8                  (:weight 'bold :foreground pink3))
     (org-level-9                  (:weight 'bold :foreground base1))
     (org-link                     (:weight 'normal :underline t :foreground pink3))
     (org-list-dt                  (:weight 'bold :slant 'italic))
     (org-special-keyword          (:foreground yellow1 :weight 'bold))
     (org-target                   (:foreground base2 :underline t :weight 'bold))
     (org-table                    (:foreground base2))
     (org-todo                     (:foreground red1 :weight 'bold))
     (org-document-title           (:foreground base1 :weight 'bold :underline t))
     (org-document-info-keyword    (:foreground base3)))
    ,@body))



(camron-deftheme
 camron
 "I get computers 'puting."
 ; TODO: Xterm colors
 ((((class color) (min-colors 24))) ; 24bit GUI color
  (base1 "#ddcedc")
  (base2 "#b89eb6")
  (base3 "#80677F")
  (base4 "#473047")
  (base5 "#3b273b")
  (base6 "#302030")
  (base7 "#211621")
  (base8 "#030203")
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
                               [,base7
                                ,red2
                                ,green1
                                ,yellow1
                                ,blue1
                                ,base2
                                ,green1
                                ,base1])))

(provide-theme 'camron)
;;; camron-theme.el ends here
