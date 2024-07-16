;;; doom-cobalt2-theme.el --- ported from VSCode Cobalt2 theme -*- lexical-binding: t; no-byte-compile: t; -*-
;;
;;; Commentary:
;;
;;; Code:

(require 'doom-themes)


;;
;;; Variables

(defgroup doom-cobalt2-theme nil
  "Options for the `doom-cobalt2' theme."
  :group 'doom-themes)

(defcustom doom-cobalt2-unified-font-size nil
  "If non-nil, all faces use the basic font size, especially for titles in `org-mode'."
  :group 'doom-cobalt2-theme)

(defcustom doom-cobalt2-org-no-special-weekend nil
  "If non-nil, `org-agenda-date-weekend' has no special face."
  :group 'doom-cobalt2-theme)

;;
;;; Theme definition

(def-doom-theme doom-cobalt2
  "A blue theme ported from VSCode Cobalt2."

  ;; name        default   256           16
  ((bg         '("#193549" "#005f87"       "black"  ))
   (fg         '("#fff"    "#fff"        "#fff"  ))

   ;; These are off-color variants of bg/fg, used primarily for `solaire-mode',
   ;; but can also be useful as a basis for subtle highlights (e.g. for hl-line
   ;; or region), especially when paired with the `doom-darken', `doom-lighten',
   ;; and `doom-blend' helper functions.

   ;;;; `bg-alt' is used by `hl-mode'
   (bg-alt     '("#1f4662" "#005f5f"       "black"        ))
   (fg-alt     '("#ccc" "#ccc"     "white"        ))

   ;; These should represent a spectrum from bg to fg, where base0 is a starker
   ;; bg and base8 is a starker fg. For example, if bg is light grey and fg is
   ;; dark grey, base0 should be white and base8 should be black.
   ;; (The colors are generated from https://colors.eva.design/)
   (base0      '("#040F23" "#000000"       "black"        ))
   (base1      '("#07162A" "#000000"     "black"  ))
   (base2      '("#0C1F34" "#000000"     "brightblack"  ))
   (base3      '("#12293E" "#00005f"     "brightblack"  ))
   (base4      '("#193549" "#00005f"     "brightblack"  ))
   (base5      '("#497791" "#5f8787"     "brightblack"  ))
   (base6      '("#79B0C8" "#87afd7"     "brightblack"  ))
   (base7      '("#AEDDEC" "#afd7ff"     "brightblack"  ))
   (base8      '("#D5EFF5" "#d7ffff"     "white"        ))

   (grey        base4)
   (red         '("#ff628c" "#ff5f87" "red"))
   (dark-red    '("#ff5630" "#ff5f5f" "red"))
   (orange      '("#ff9d00" "#ffaf00" "brightred"))
   (light-green '("#80ffbb" "#87ffaf" "green"))
   (green       '("#a5ff90" "#afff87" "green"))
   (dark-green  '("#3ad900" "#5fd700" "green"))
   (yellow      '("#ffc600" "#ffd700" "yellow"))
   (blue        '("#0088ff" "#0087ff" "brightblue"))
   (dark-blue   '("#0050a4" "#005faf" "blue"))
   (dark-dark-blue '("#15232d" "#000000" "black"))
   (magenta     '("#fb94ff" "#ff87ff" "magenta"))
   (cyan        '("#80fcff" "#87ffff" "brightcyan"))

   ;; TODO the following three colors are not taken from VSCode Cobalt2
   (dark-cyan  '("#5390d9" "#5f87d7" "cyan"         ))
   (teal       '("#a3b18a" "#afaf87" "brightgreen"  ))
   (violet     '("#c8b6ff" "#d7afff" "magenta"      ))

   ;; These are the "universal syntax classes" that doom-themes establishes.
   ;; These *must* be included in every doom themes, or your theme will throw an
   ;; error, as they are used in the base theme defined in doom-themes-base.
   (highlight      yellow) ; e.g. org-mode hyperlink, search results
   (vertical-bar   (doom-darken blue 0.4))
   (selection      dark-blue) ; TODO
   (builtin        orange) ; TODO
   (comments       blue)
   (doc-comments   comments)
   (constants      red)
   (functions      yellow) ; FIXME: use different color
   (keywords       orange)
   (methods        yellow)
   (operators      orange)
   (type           yellow)
   (strings        green)
   (variables      fg)
   (numbers        red) ; numbers are just constants
   ;; `region' => evil-visual-state selected text
   ;; ivy selected item
   (region         dark-blue)
   (error          dark-red)
   (warning        yellow)
   (success        dark-green)
   (vc-modified    orange)
   (vc-added       dark-green)
   (vc-deleted     red)

   ;; TODO
   ;; These are extra color variables used only in this theme; i.e. they aren't
   ;; mandatory for derived themes.

   ;; org/markdown code
   (code-bg                  base3)

   (modeline-fg              fg)
   (modeline-fg-alt          base5)
   (modeline-bg              dark-dark-blue)
   (modeline-bg-alt          (doom-darken blue 0.475))

   (modeline-bg-inactive     `(,(car bg-alt) ,@(cdr base1)))
   (modeline-bg-inactive-alt `(,(doom-darken (car bg-alt) 0.1) ,@(cdr bg)))

   (rainbow--delimiters-1 (doom-lighten yellow 0.3))
   (rainbow--delimiters-2 (doom-darken magenta 0.1))
   (rainbow--delimiters-3 (doom-lighten blue 0.2))
   )

  ;;;; Base theme face overrides
  (((font-lock-comment-face &override) :background 'unspecified)

   ;;;; org-mode tweaks
   ;;;; also check the var `org-emphasis-alist'

   ;; Do not use `yellow' for outline-x because it's the color of any hyperlink.
   (org-document-title :foreground red :weight 'bold
                       :height (if doom-cobalt2-unified-font-size 1.0 1.6))
   (outline-1 :foreground (doom-lighten red 0.2) :weight 'bold
              :height (if doom-cobalt2-unified-font-size 1.0 1.4))
   (outline-2 :foreground (doom-lighten violet 0.2) :weight 'bold
              :height (if doom-cobalt2-unified-font-size 1.0 1.2))
   (outline-3 :foreground (doom-lighten teal 0.2) :weight 'bold :height 1.0)
   (outline-4 :foreground (doom-lighten magenta 0.2) :height 1.0)
   (outline-5 :foreground (doom-darken red 0.2) :weight 'bold :height 1.0)
   (outline-6 :foreground (doom-darken violet 0.2) :weight 'bold :height 1.0)
   (outline-7 :foreground (doom-darken teal 0.2) :weight 'bold :height 1.0)
   (outline-8 :foreground (doom-darken magenta 0.2) :height 1.0)
   ;; inherited by `org-imminent-deadline'
   (org-warning :foreground error :weight 'bold)
   (org-agenda-date :foreground violet)

   ;; TODO: use `doom-cobalt2-org-no-special-weekend'
   (org-agenda-date-weekend :inherit 'org-agenda-date)
   ;; (org-agenda-date-weekend :italic t :foreground (doom-darken violet 0.3))

   (org-agenda-date-today :foreground dark-green :weight 'ultra-bold)
   (org-scheduled :foreground cyan)
   (org-scheduled-today :foreground (doom-lighten cyan 0.2))
   (org-scheduled-previously :foreground (doom-darken cyan 0.2))
   (org-upcoming-deadline :foreground (doom-lighten warning 0.2) :weight 'bold)
   (org-upcoming-distant-deadline :foreground (doom-lighten warning 0.1))
   (org-drawer :foreground (doom-darken comments 0.2) :italic t)
   (org-special-keyword :inherit 'org-drawer)
   (org-date :foreground cyan)

   (org-code :foreground orange :background code-bg)

   ;; (org-block-begin-line :background (doom-darken bg 0.1) :extend t :foreground dark-blue)
   ;; ((org-block-begin-line &extend) :underline base2)
   ;; (org-block-end-line :inherit 'org-block-begin-line)

   ;;;; mode-line
   (mode-line :background modeline-bg :foreground modeline-fg)
   (mode-line-inactive :background modeline-bg-inactive :foreground modeline-fg-alt)
   (mode-line-emphasis :foreground base8)

   ;;;; doom-modeline
   (doom-modeline-bar :background modeline-bg)
   (doom-modeline-buffer-file :inherit 'mode-line-buffer-id :weight 'bold)
   (doom-modeline-buffer-path :inherit 'mode-line-emphasis :weight 'bold)
   ;; FIXME: in doom-one, the option is legacy
   (doom-modeline-project-dir :foreground green :weight 'bold)
   ;;;; ivy
   (ivy-current-match :background 'unspecified :distant-foreground yellow :weight 'normal)
   ;;;; LaTeX-mode
   (font-latex-math-face :foreground green)
   ;;;; markdown-mode
   (markdown-markup-face :foreground base5)
   (markdown-header-face :inherit 'bold :foreground red)
   ((markdown-code-face &override) :foreground fg :background code-bg :italic nil)
   ;;;; makefile-mode
   (makefile-targets :foreground yellow)

   (show-paren-match :box '(:line-width (-1 . -1)) :weight 'ultra-bold)

   ;;;; rainbow-delimiters
   (rainbow-delimiters-depth-1-face :foreground rainbow--delimiters-1)
   (rainbow-delimiters-depth-2-face :foreground rainbow--delimiters-2)
   (rainbow-delimiters-depth-3-face :foreground rainbow--delimiters-3)
   (rainbow-delimiters-depth-4-face :foreground rainbow--delimiters-1)
   (rainbow-delimiters-depth-5-face :foreground rainbow--delimiters-2)
   (rainbow-delimiters-depth-6-face :foreground rainbow--delimiters-3)

   )

  ;;;; Base theme variable overrides-
  ())

;;; doom-cobalt2-theme.el ends here
