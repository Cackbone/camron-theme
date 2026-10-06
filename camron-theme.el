;;; camron-theme.el --- Camron Theme -*- lexical-binding: t; -*-

;; Author: Cédric Legendre <contact@cackbone.fr>
;; Package-Version: 2.0.0

;; Package-Requires: ((emacs "29.1") (autothemer "0.2"))

;;; Commentary:

;; A dark theme: a navy background, neon magenta and cyan, with ice, lime and yellow
;; accents.

;;; Code:
(require 'autothemer)

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

     (default                      (:background bg :foreground fg))
     (cursor                       (:background magenta))
     (fringe                       (:background bg :foreground faint))
     (hl-line                      (:background panel :extend t))
     (region                       (:background edge :extend t))
     (secondary-selection          (:background panel2 :extend t))
     (minibuffer-prompt            (:foreground cyan :weight 'bold))
     (border                       (:background bg))
     (vertical-border              (:foreground edge))
     (internal-border              (:foreground edge :background bg))
     (window-divider               (:foreground edge))
     (window-divider-first-pixel   (:foreground edge))
     (window-divider-last-pixel    (:foreground edge))
     (link                         (:underline t :foreground ice))
     (link-visited                 (:underline t :foreground violet))
     (shadow                       (:foreground dim))
     (header-line                  (:background panel :foreground fg-dim))
     (tooltip                      (:background panel :foreground fg))
     (help-key-binding             (:background panel :foreground ice :box (:line-width -1 :color edge)))
     (escape-glyph                 (:foreground magenta2))
     (homoglyph                    (:foreground magenta2))
     (trailing-whitespace          (:background red))


     ;;; Syntax

     (font-lock-builtin-face                 (:foreground violet))
     (font-lock-comment-face                 (:foreground dim :slant 'italic))
     (font-lock-comment-delimiter-face       (:foreground dim :slant 'italic))
     (font-lock-doc-face                     (:foreground dim))
     (font-lock-doc-markup-face              (:foreground ice))
     (font-lock-constant-face                (:foreground lime))
     (font-lock-number-face                  (:foreground lime))
     (font-lock-function-name-face           (:foreground cyan :weight 'bold))
     (font-lock-function-call-face           (:foreground cyan))
     (font-lock-keyword-face                 (:foreground magenta))
     (font-lock-negation-char-face           (:foreground red))
     (font-lock-operator-face                (:foreground magenta2))
     (font-lock-preprocessor-face            (:foreground blue))
     (font-lock-property-name-face           (:foreground ice))
     (font-lock-property-use-face            (:foreground ice))
     (font-lock-regexp-grouping-construct    (:foreground magenta2))
     (font-lock-regexp-grouping-backslash    (:foreground magenta2))
     (font-lock-escape-face                  (:foreground magenta2))
     (font-lock-string-face                  (:foreground yellow))
     (font-lock-type-face                    (:foreground ice))
     (font-lock-variable-name-face           (:foreground fg))
     (font-lock-variable-use-face            (:foreground fg))
     (font-lock-warning-face                 (:foreground yellow :weight 'bold))
     (font-lock-bracket-face                 (:foreground fg-dim))
     (font-lock-delimiter-face               (:foreground fg-dim))
     (font-lock-punctuation-face             (:foreground fg-dim))


     ;;; Basic highlights

     (success      (:foreground lime :weight 'bold))
     (warning      (:foreground yellow :weight 'bold))
     (error        (:foreground red :weight 'bold))
     (highlight    (:background panel2))
     (match        (:background purple :foreground fg))


     ;;; Whitespaces

     (whitespace-trailing    (:background red))
     (whitespace-tab         (:foreground edge))
     (whitespace-space       (:foreground edge))
     (whitespace-newline     (:foreground edge))


     ;;; Parens

     (show-paren-match              (:background purple :foreground fg :weight 'bold))
     (show-paren-mismatch           (:background red :foreground bg))
     (rainbow-delimiters-depth-1-face   (:foreground magenta))
     (rainbow-delimiters-depth-2-face   (:foreground cyan))
     (rainbow-delimiters-depth-3-face   (:foreground yellow))
     (rainbow-delimiters-depth-4-face   (:foreground lime))
     (rainbow-delimiters-depth-5-face   (:foreground violet))
     (rainbow-delimiters-depth-6-face   (:foreground ice))
     (rainbow-delimiters-depth-7-face   (:foreground magenta2))
     (rainbow-delimiters-depth-8-face   (:foreground blue))
     (rainbow-delimiters-depth-9-face   (:foreground fg-dim))
     (rainbow-delimiters-unmatched-face (:foreground red :weight 'bold))


     ;;; Line numbers (no background of their own: the buffer's)

     (line-number                    (:foreground faint))
     (line-number-current-line       (:foreground magenta :weight 'bold))


     ;;; Diff

     (diff-added          (:background "#1c3f45" :foreground lime2))
     (diff-removed        (:background "#45173f" :foreground red2))
     (diff-changed        (:background panel :foreground yellow))
     (diff-refine-added   (:background "#2e7a5a" :foreground fg))
     (diff-refine-removed (:background "#8a2a6a" :foreground fg))
     (diff-context        (:foreground fg-dim))
     (diff-file-header    (:foreground ice :weight 'bold))
     (diff-header         (:background panel :foreground fg-dim))
     (diff-hunk-header    (:background panel :foreground magenta))


     ;;; Mode line (built-in, doom-modeline, spaceline / powerline)

     (mode-line               (:background panel :foreground fg :box (:line-width 4 :color panel)))
     (mode-line-active        (:inherit 'mode-line))
     (mode-line-inactive      (:background deep :foreground dim :box (:line-width 4 :color deep)))
     (mode-line-buffer-id     (:foreground magenta :weight 'bold))
     (mode-line-emphasis      (:foreground ice :weight 'bold))
     (mode-line-highlight     (:foreground cyan :box (:line-width 1 :color cyan)))
     (doom-modeline-bar                  (:background magenta))
     (doom-modeline-bar-inactive         (:background deep))
     (doom-modeline-buffer-file          (:foreground fg :weight 'bold))
     (doom-modeline-buffer-modified      (:foreground magenta :weight 'bold))
     (doom-modeline-buffer-major-mode    (:foreground cyan :weight 'bold))
     (doom-modeline-buffer-path          (:foreground dim))
     (doom-modeline-project-dir          (:foreground ice :weight 'bold))
     (doom-modeline-info                 (:foreground lime))
     (doom-modeline-warning              (:foreground yellow))
     (doom-modeline-urgent               (:foreground red))
     (doom-modeline-lsp-success          (:foreground lime))
     (doom-modeline-evil-insert-state    (:foreground cyan))
     (powerline-active1       (:background panel2 :foreground fg))
     (powerline-active2       (:background panel :foreground fg))
     (powerline-inactive1     (:background deep :foreground dim))
     (powerline-inactive2     (:background deep :foreground dim))


     ;;; Search

     (isearch                (:background magenta :foreground bg :weight 'bold))
     (isearch-fail           (:background red :foreground bg))
     (lazy-highlight         (:background edge :foreground fg))


     ;;; Completion: built-in, vertico, orderless, marginalia, company

     (completions-common-part        (:foreground magenta :weight 'bold))
     (completions-first-difference   (:foreground ice))
     (completions-highlight          (:background panel2))
     (vertico-current                (:background panel2 :extend t))
     (vertico-group-title            (:foreground dim :slant 'italic))
     (vertico-group-separator        (:foreground edge :strike-through t))
     (orderless-match-face-0         (:foreground magenta :weight 'bold))
     (orderless-match-face-1         (:foreground cyan :weight 'bold))
     (orderless-match-face-2         (:foreground lime :weight 'bold))
     (orderless-match-face-3         (:foreground yellow :weight 'bold))
     (marginalia-documentation       (:foreground dim :slant 'italic))
     (company-tooltip                          (:background panel :foreground fg))
     (company-tooltip-selection                (:background edge :foreground fg))
     (company-tooltip-annotation               (:foreground dim))
     (company-tooltip-annotation-selection     (:foreground fg-dim))
     (company-tooltip-mouse                    (:background panel2))
     (company-tooltip-common                   (:foreground magenta :weight 'bold))
     (company-tooltip-common-selection         (:foreground magenta2 :weight 'bold))
     (company-tooltip-scrollbar-thumb          (:background purple))
     (company-tooltip-scrollbar-track          (:background panel))
     (company-preview                          (:foreground dim))
     (company-preview-common                   (:foreground magenta))


     ;;; which-key

     (which-key-key-face                   (:foreground magenta :weight 'bold))
     (which-key-separator-face             (:foreground edge))
     (which-key-command-description-face   (:foreground fg))
     (which-key-group-description-face     (:foreground cyan))
     (which-key-local-map-description-face (:foreground ice))


     ;;; Flycheck / flymake

     (flycheck-error                 (:underline (:style 'wave :color red)))
     (flycheck-warning               (:underline (:style 'wave :color yellow)))
     (flycheck-info                  (:underline (:style 'wave :color cyan)))
     (flycheck-fringe-error          (:foreground red))
     (flycheck-fringe-warning        (:foreground yellow))
     (flycheck-fringe-info           (:foreground cyan))
     (flycheck-error-list-error      (:foreground red))
     (flycheck-error-list-warning    (:foreground yellow))
     (flycheck-error-list-info       (:foreground cyan))
     (flymake-error                  (:underline (:style 'wave :color red)))
     (flymake-warning                (:underline (:style 'wave :color yellow)))
     (flymake-note                   (:underline (:style 'wave :color cyan)))


     ;;; lsp-ui

     (lsp-ui-doc-background                             (:background panel))
     (lsp-ui-doc-header                                 (:background edge :foreground fg))
     (lsp-ui-sideline-code-action                       (:foreground yellow))
     (lsp-headerline-breadcrumb-path-face               (:foreground fg-dim))
     (lsp-headerline-breadcrumb-separator-face          (:foreground edge))
     (lsp-headerline-breadcrumb-symbols-face            (:foreground cyan))
     (lsp-headerline-breadcrumb-path-error-face         (:underline (:style 'wave :color red)))
     (lsp-headerline-breadcrumb-path-warning-face       (:underline (:style 'wave :color yellow)))
     (lsp-headerline-breadcrumb-path-info-face          (:underline (:style 'wave :color cyan)))
     (lsp-headerline-breadcrumb-path-hint-face          (:underline (:style 'wave :color cyan)))
     (lsp-headerline-breadcrumb-symbols-error-face      (:underline (:style 'wave :color red)))
     (lsp-headerline-breadcrumb-symbols-warning-face    (:underline (:style 'wave :color yellow)))
     (lsp-headerline-breadcrumb-symbols-info-face       (:underline (:style 'wave :color cyan)))
     (lsp-headerline-breadcrumb-symbols-hint-face       (:underline (:style 'wave :color cyan)))


     ;;; Terminals (eat, term, vterm, shell, compilation): a matching 16-colour palette,
     ;;; so terminal programs inside Emacs (Claude Code…) get the theme's colours

     (ansi-color-black            (:foreground c0  :background c0))
     (ansi-color-red              (:foreground red :background red))
     (ansi-color-green            (:foreground lime :background lime))
     (ansi-color-yellow           (:foreground yellow :background yellow))
     (ansi-color-blue             (:foreground c4  :background c4))
     (ansi-color-magenta          (:foreground magenta :background magenta))
     (ansi-color-cyan             (:foreground cyan :background cyan))
     (ansi-color-white            (:foreground fg-dim :background fg-dim))
     (ansi-color-bright-black     (:foreground c8  :background c8))
     (ansi-color-bright-red       (:foreground red2 :background red2))
     (ansi-color-bright-green     (:foreground lime2 :background lime2))
     (ansi-color-bright-yellow    (:foreground yellow2 :background yellow2))
     (ansi-color-bright-blue      (:foreground blue :background blue))
     (ansi-color-bright-magenta   (:foreground magenta2 :background magenta2))
     (ansi-color-bright-cyan      (:foreground ice :background ice))
     (ansi-color-bright-white     (:foreground white :background white))
     (term-color-black            (:inherit 'ansi-color-black))
     (term-color-red              (:inherit 'ansi-color-red))
     (term-color-green            (:inherit 'ansi-color-green))
     (term-color-yellow           (:inherit 'ansi-color-yellow))
     (term-color-blue             (:inherit 'ansi-color-blue))
     (term-color-magenta          (:inherit 'ansi-color-magenta))
     (term-color-cyan             (:inherit 'ansi-color-cyan))
     (term-color-white            (:inherit 'ansi-color-white))
     (eshell-prompt               (:foreground magenta :weight 'bold))
     (compilation-info            (:foreground cyan))
     (compilation-warning         (:foreground yellow))
     (compilation-error           (:foreground red))


     ;;; Treemacs (file tree)

     (treemacs-window-background-face      (:background deep))
     (treemacs-hl-line-face                (:background panel :extend t))
     (treemacs-root-face                   (:foreground magenta :weight 'bold :height 1.1))
     (treemacs-root-unreadable-face        (:foreground red :strike-through t))
     (treemacs-directory-face              (:foreground cyan))
     (treemacs-directory-collapsed-face    (:foreground cyan))
     (treemacs-file-face                   (:foreground fg))
     (treemacs-term-node-face              (:foreground ice))
     (treemacs-tags-face                   (:foreground fg-dim))
     (treemacs-help-title-face             (:foreground magenta :weight 'bold))
     (treemacs-help-column-face            (:foreground cyan :weight 'bold))
     (treemacs-git-modified-face           (:foreground yellow))
     (treemacs-git-added-face              (:foreground lime))
     (treemacs-git-untracked-face          (:foreground ice))
     (treemacs-git-renamed-face            (:foreground violet))
     (treemacs-git-conflict-face           (:foreground red :weight 'bold))
     (treemacs-git-ignored-face            (:foreground faint))
     (treemacs-git-unmodified-face         (:foreground fg))
     (treemacs-git-commit-diff-face        (:foreground dim))
     (treemacs-marked-file-face            (:foreground yellow :weight 'bold))
     (treemacs-fringe-indicator-face       (:foreground magenta))
     (treemacs-on-success-pulse-face       (:background edge :foreground lime))
     (treemacs-on-failure-pulse-face       (:background edge :foreground red))
     (treemacs-nerd-icons-root-face        (:foreground magenta))
     (treemacs-nerd-icons-file-face        (:foreground dim))


     ;;; Dired

     (dired-directory      (:foreground cyan :weight 'bold))
     (dired-symlink        (:foreground ice :slant 'italic))
     (dired-header         (:foreground magenta :weight 'bold))
     (dired-marked         (:foreground yellow :weight 'bold))
     (dired-flagged        (:foreground red :weight 'bold))


     ;;; JS2 / Typescript

     (js2-warning                  (:underline (:color yellow :style 'wave)))
     (js2-error                    (:underline (:color red :style 'wave)))
     (js2-external-variable        (:underline (:color fg :style 'line)))
     (js2-function-param           (:foreground ice))
     (js2-function-call            (:foreground cyan))
     (js2-private-function-call    (:foreground cyan))
     (js2-instance-member          (:foreground fg))
     (js2-private-member           (:foreground fg))
     (js2-jsdoc-tag                (:foreground magenta))
     (js2-jsdoc-type               (:foreground ice))
     (js2-jsdoc-value              (:foreground fg-dim))
     (typescript-jsdoc-tag         (:foreground magenta))
     (typescript-jsdoc-type        (:foreground ice))
     (typescript-jsdoc-value       (:foreground fg-dim))


     ;;; Markdown

     (markdown-header-face-1       (:foreground magenta :weight 'bold :height 1.25))
     (markdown-header-face-2       (:foreground cyan :weight 'bold :height 1.15))
     (markdown-header-face-3       (:foreground ice :weight 'bold))
     (markdown-header-face-4       (:foreground yellow :weight 'bold))
     (markdown-code-face           (:background deep :extend t))
     (markdown-inline-code-face    (:foreground yellow :background deep))
     (markdown-link-face           (:foreground ice :underline t))
     (markdown-markup-face         (:foreground dim))


     ;;; Org mode

     (org-document-title           (:foreground magenta :weight 'bold :height 1.4))
     (org-document-info            (:foreground ice))
     (org-document-info-keyword    (:foreground dim))
     (org-level-1                  (:foreground magenta :weight 'bold :height 1.25))
     (org-level-2                  (:foreground cyan :weight 'bold :height 1.12))
     (org-level-3                  (:foreground ice :weight 'bold))
     (org-level-4                  (:foreground yellow :weight 'bold))
     (org-level-5                  (:foreground lime :weight 'bold))
     (org-level-6                  (:foreground violet :weight 'bold))
     (org-level-7                  (:foreground magenta2 :weight 'bold))
     (org-level-8                  (:foreground blue :weight 'bold))
     (org-block                    (:background deep :extend t))
     (org-block-begin-line         (:background deep :foreground dim :extend t))
     (org-block-end-line           (:background deep :foreground dim :extend t))
     (org-code                     (:foreground yellow))
     (org-verbatim                 (:foreground lime))
     (org-quote                    (:background deep :slant 'italic :extend t))
     (org-meta-line                (:foreground dim))
     (org-drawer                   (:foreground dim))
     (org-special-keyword          (:foreground dim))
     (org-property-value           (:foreground fg-dim))
     (org-date                     (:foreground cyan :underline t))
     (org-footnote                 (:foreground ice :slant 'italic :underline t))
     (org-link                     (:foreground ice :underline t))
     (org-list-dt                  (:foreground magenta :weight 'bold))
     (org-checkbox                 (:foreground magenta :weight 'bold))
     (org-tag                      (:foreground dim :weight 'normal))
     (org-target                   (:foreground fg-dim :underline t))
     (org-table                    (:foreground ice))
     (org-formula                  (:foreground yellow))
     (org-todo                     (:foreground red :weight 'bold))
     (org-done                     (:foreground lime :weight 'bold))
     (org-headline-done            (:foreground dim :strike-through t))
     (org-priority                 (:foreground yellow :weight 'bold))
     (org-hide                     (:foreground bg))
     (org-ellipsis                 (:foreground dim))
     (org-agenda-structure         (:foreground magenta :weight 'bold :height 1.15))
     (org-agenda-date              (:foreground cyan))
     (org-agenda-date-today        (:foreground magenta :weight 'bold))
     (org-agenda-date-weekend      (:foreground dim))
     (org-scheduled                (:foreground fg))
     (org-scheduled-today          (:foreground ice :weight 'bold))
     (org-upcoming-deadline        (:foreground yellow))
     (org-warning                  (:foreground red :weight 'bold)))
    ,@body))



(camron-deftheme
 camron
 "Navy night, neon magenta and cyan."
 ;; GUI frames and true-colour terminals; 256-colour terminals get the nearest colours
 ((((class color) (min-colors 88)))
  ;; backgrounds
  (deep     "#0d0c33")                   ; code blocks, inactive mode line
  (bg       "#131244")                   ; navy
  (panel    "#1a1a6e")                   ; current line, mode line, popups
  (panel2   "#23237f")
  (edge     "#3b2a78")                   ; selection, borders
  ;; text
  (fg       "#e8e6ff")
  (fg-dim   "#c8c6ef")
  (dim      "#8b8bc7")                   ; comments
  (faint    "#55559a")                   ; line numbers
  (white    "#ffffff")
  ;; neon
  (magenta  "#e040fb")
  (magenta2 "#f07cff")
  (purple   "#7b2cbf")
  (violet   "#b388ff")
  (blue     "#7b8cff")
  (cyan     "#00bcd4")
  (ice      "#76e6f2")
  (lime     "#69ff47")
  (lime2    "#9dff85")
  (red      "#ff4f79")
  (red2     "#ff7a9c")
  (yellow   "#ffd166")
  (yellow2  "#ffe29a")
  ;; the terminal palette, where it differs
  (c0       "#1a1a4e")
  (c4       "#4455bb")
  (c8       "#4a4a8a"))

 (custom-theme-set-variables 'camron
                             `(ansi-color-names-vector
                               [,c0 ,red ,lime ,yellow ,c4 ,magenta ,cyan ,fg-dim])))

(provide-theme 'camron)
;;; camron-theme.el ends here
