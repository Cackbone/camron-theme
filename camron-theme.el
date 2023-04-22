;;; camron-theme.el --- Camron Theme

;; Author: Cédric Legendre <contact@cackbone.fr>
;; Package-Version: 1.0

;;; Commentary:

;; A dark purple theme

;;; Code:
(defmacro camron-theme--deftheme (name palette)
  "Called by the theme with a NAME and PALETTE to set the faces."
  `(let* ((class '((class color) (min-colors 24)))
          ,@palette
          ;; common styles
          (diff-added `(:foreground ,green1))
          (diff-hunk-header `(:background ,base5))
          (diff-file-header `(:foreground ,base2 :height 1.1 :weight bold))
          (diff-removed `(:foreground ,red2))
          (directory `(:foreground ,pink3))
          (error `(:foreground ,red2))
          (link `(:weight normal :underline t :foreground ,pink3))
          (ol1 `(:weight bold :height 1.2 :foreground ,green1))
          (ol2 `(:weight bold :height 1.1 :foreground ,green1))
          (ol3 `(:weight bold :foreground ,pink3))
          (ol4 `(:weight bold :foreground ,base1))
          (ol5 `(:weight bold :foreground ,yellow1))
          (ol6 `(:weight bold :slant italic :foreground ,green1))
          (ol7 `(:weight bold :slant italic :foreground ,green1))
          (ol8 `(:weight bold :foreground ,pink3))
          (ol9 `(:weight bold :foreground ,base1))
          (paren-matched `(:background ,base2 :foreground ,base6))
          (paren-unmatched `(:background ,red2))
          )
     (custom-theme-set-faces
      ',name
      `(default ((,class (:background ,base6 :foreground ,base1))))
      `(bold ((,class (:weight bold))))

      `(font-lock-builtin-face ((,class (:foreground ,pink3 :weight bold))))
      `(font-lock-comment-face ((,class (:foreground ,base3))))
      `(font-lock-comment-delimiter-face ((,class (:foreground ,base3))))
      `(font-lock-constant-face ((,class (:foreground ,green1 :weight bold))))
      `(font-lock-function-name-face ((,class (:foreground ,pink2))))
      `(font-lock-keyword-face ((,class (:foreground ,purple1))))
      `(font-lock-negation-char-face ((,class (:foreground ,base2))))
      `(font-lock-preprocessor-face ((,class (:foreground ,blue1))))
      `(font-lock-regexp-grouping-construct ((,class (:foreground ,green1))))
      `(font-lock-regexp-grouping-backslash ((,class (:foreground ,green1))))
      `(font-lock-string-face ((,class (:foreground ,green1))))
      `(font-lock-type-face ((,class (:foreground ,base2))))
      `(font-lock-variable-name-face ((,class (:foreground ,pink1))))
      `(font-lock-warning-face ((,class (:foreground ,base2))))
      `(success ((,class (:foreground ,green1))))
      `(warning ((,class (:foreground ,yellow1))))
      `(error ((,class ,error)))
      `(header-line ((,class (:background ,base7 :foreground ,base2))))


      `(match ((,class (:background ,yellow1 :foreground ,base1))))
      `(isearch ((,class (:background ,yellow1 :foreground ,base1 :weight bold))))
      `(isearch-fail ((,class (:background ,red1 :foreground ,base1))))
      `(lazy-highlight ((,class (:background ,base5))))
      `(trailing-whitespace ((,class (:background ,base5))))

      `(evil-search-highlight-persist-highlight-face ((,class (:background ,yellow1 :foreground ,base7))))

      `(region ((,class (:background ,base5))))

      ;; ui chrome
      `(hi-line ((,class (:background ,base7))))
      `(highlight ((,class (:background ,base7))))
      `(cursor ((,class (:background ,purple3))))
      `(fringe ((,class (:background ,base6))))
      `(border ((,class (:background ,base6))))
      `(linum ((,class (:background "unspecified-bg" :foreground ,base3))))
      `(linum-highlight-face ((,class (:inverse-video nil :background ,base3))))
      `(vertical-border ((,class (:foreground ,base4))))
      `(minibuffer-prompt ((,class (:foreground ,pink3))))

      `(link ((,class ,link)))
      `(link-visited ((,class ,link)))

      ;; modeline and powerline
      `(mode-line ((,class (:background ,base7 :foreground ,base1))))
      `(powerline-active1 ((,class (:background ,base5 :foreground ,base2))))
      `(powerline-active2 ((,class (:background ,base5 :foreground ,base2))))

      `(mode-line-inactive ((,class (:inherit mode-line
                                              :foreground ,base2
                                              :background ,base5
                                              :box nil))))
      `(powerline-inactive1 ((,class (:background ,base4 :foreground ,base2))))
      `(powerline-inactive2 ((,class (:background ,base4 :foreground ,base2))))

      ;; term
      `(term-color-black ((,class (:foreground ,black))))
      `(term-color-red ((,class (:foreground ,red2))))
      `(term-color-green ((,class (:foreground ,green1))))
      `(term-color-yellow ((,class (:foreground ,yellow1))))
      `(term-color-blue ((,class (:foreground ,blue1))))
      `(term-color-purple ((,class (:foreground ,base2))))
      `(term-color-cyan ((,class (:foreground ,green1))))
      `(term-color-white ((,class (:foreground ,white))))

      ;; auto-complete
      `(ac-candidate-face ((,class (:background ,base5 :foreground ,base2))))
      `(ac-selection-face ((,class (:background ,base7 :foreground ,base1))))
      `(popup-tip-face ((,class (:background ,base5 :foreground ,base2))))
      ;; company mode
      `(company-tooltip ((,class (:background ,base5 :foreground ,base2))))
      `(company-tooltip-selection ((,class (:background ,base7 :foreground ,base1))))
      `(company-tooltip-annotation ((,class (:background ,base5 :foreground ,base2))))
      `(company-tooltip-annotation-selection ((,class (:background ,base7 :foreground ,base1))))
      `(company-tooltip-mouse ((,class (:background ,base4))))
      `(company-tooltip-common ((,class (:foreground ,pink3))))
      `(company-tooltip-common-selection ((,class (:foreground ,blue1))))
      `(company-scrollbar-fg ((,class (:background ,base3))))
      `(company-scrollbar-bg ((,class (:background ,base5))))
      `(company-preview ((,class (:background ,base5))))
      `(company-preview-common ((,class (:background ,base5 :foreground ,pink3))))

      ;; flycheck
      `(flycheck-error ((,class (:underline (:style wave :color ,red1)))))
      `(flycheck-warning ((,class (:underline (:style wave :color ,yellow1)))))
      `(flycheck-info ((,class (:underline (:style wave :color ,blue1)))))

      ;; lsp
      `(lsp-ui-doc-background ((,class (:background ,base5))))
      `(lsp-ui-doc-header ((,class (:background ,base7))))
      `(lsp-headerline-breadcrumb-path-face ((,class (:foreground ,base2))))
      `(lsp-headerline-breadcrumb-path-error-face ((,class (:underline (:style wave :color ,red1)))))
      `(lsp-headerline-breadcrumb-path-warning-face ((,class (:underline (:style wave :color ,yellow1)))))
      `(lsp-headerline-breadcrumb-path-info-face ((,class (:underline (:style wave :color ,blue1)))))
      `(lsp-headerline-breadcrumb-symbols-face ((,class (:foreground ,pink3))))
      `(lsp-headerline-breadcrumb-symbols-error-face ((,class (:underline (:style wave :color ,red1)))))
      `(lsp-headerline-breadcrumb-symbols-warning-face ((,class (:underline (:style wave :color ,yellow1)))))
      `(lsp-headerline-breadcrumb-symbols-info-face ((,class (:underline (:style wave :color ,blue1)))))


      ;; diff
      `(diff-added ((,class ,diff-added)))
      `(diff-changed ((,class (:foreground ,yellow1))))
      `(diff-context ((,class (:foreground ,base2))))
      `(diff-file-header ((,class ,diff-file-header)))
      `(diff-hunk-header ((,class ,diff-hunk-header)))
      `(diff-removed ((,class ,diff-removed)))

      ;; eshell
      `(eshell-prompt ((,class (:foreground ,red2 :weight bold))))

      ;; org-mode
      `(org-block ((,class (:background ,base5))))
      `(org-block-begin-line ((,class (:background ,base5 :foreground ,base3))))
      `(org-block-end-line ((,class (:background ,base5 :foreground ,base3))))
      `(org-date ((,class (:forefound ,green1))))
      `(org-footnote ((,class (:foreground ,green1 :slant italic :underline t))))
      `(org-hide ((,class (:foreground ,base5))))
      `(org-level-1 ((,class ,ol1)))
      `(org-level-2 ((,class ,ol2)))
      `(org-level-3 ((,class ,ol3)))
      `(org-level-4 ((,class ,ol4)))
      `(org-level-5 ((,class ,ol5)))
      `(org-level-6 ((,class ,ol6)))
      `(org-level-7 ((,class ,ol7)))
      `(org-level-8 ((,class ,ol8)))
      `(org-level-9 ((,class ,ol9)))
      `(org-link ((,class ,link)))
      `(org-list-dt ((,class (:weight bold :slant italic))))
      `(org-special-keyword ((,class (:foreground ,yellow1 :weight bold))))
      `(org-target ((,class (:foreground ,base2 :underline t :weight bold))))
      `(org-table ((,class (:foreground ,base2))))
      `(org-todo ((,class (:foreground ,red1 :weight bold))))
      `(outline-1 ((,class ,ol1)))
      `(outline-2 ((,class ,ol2)))
      `(outline-3 ((,class ,ol3)))
      `(outline-4 ((,class ,ol4)))
      `(outline-5 ((,class ,ol5)))
      `(outline-6 ((,class ,ol6)))
      `(outline-7 ((,class ,ol7)))
      `(outline-8 ((,class ,ol8)))

      ;; paren
      `(show-paren-match ((,class ,paren-matched)))
      `(show-paren-mismatch ((,class ,paren-unmatched)))
      `(paren-face-match ((,class ,paren-matched)))
      `(paren-face-mismatch ((,class ,paren-unmatched)))
      `(paren-face-no-match ((,class ,paren-unmatched)))
      )
     (custom-theme-set-variables
      ',name
      `(ansi-color-names-vector
        [,base6 ,red2 ,green1 ,yellow1 ,blue1 ,base2 ,green1 ,base1])
      `(when (or (not (boundp 'ansi-term-color-vector))
                 (not (facep (aref ansi-term-color-vector 0))))
         (ansi-term-color-vector
          [unspecified ,base6 ,red2 ,green1 ,yellow1 ,blue1 ,base2 ,base1]))
      )))


(deftheme camron "I get computers 'puting.")

(camron-theme--deftheme
 camron
  ((base1 "#ddcedc")
  (base2 "#b89eb6")
  (base3 "#473047")
  (base4 "#3B273B")
  (base5 "#302030")
  (base6 "#211621")
  (base7 "#030203")
  (black "#7A527A")
  (white "#211621")
  (purple1 "#a3598a")
  (purple2 "#b89eb6")
  (purple3 "#5f3a79")
  (pink1 "#e8a9b5")
  (pink2 "#de7e7e")
  (pink3 "#ab4192")
  (blue1 "#088afb")
  (red1 "#ff5c8f")
  (red2 "#DA5C8F")
  (green1 "#6ea36e")
  (yellow1 "#eea806")))

;;;###autoload
(when (and (boundp 'custom-theme-load-path)
           load-file-name)
  ;; add theme folder to `custom-theme-load-path' when installing over MELPA
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'camron)
;;; camron-theme.el ends here
