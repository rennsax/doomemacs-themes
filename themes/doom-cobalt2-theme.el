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

;;
;;; Theme definition

(def-doom-theme doom-cobalt2
  "A dark theme inspired by Atom One Dark."

  ;; name        default   256           16
  ((bg         '("#193549" "black"       "black"  ))
   (fg         '("#fff"    "#fff"        "#fff"  ))

   ;; TODO
   (bg-alt     '("#21242b" "black"       "black"        ))
   (fg-alt     '("#5B6268" "#2d2d2d"     "white"        ))

   ;; These should represent a spectrum from bg to fg, where base0 is a starker
   ;; bg and base8 is a starker fg. For example, if bg is light grey and fg is
   ;; dark grey, base0 should be white and base8 should be black.
   ;; TODO
   (base0      '("#1B2229" "black"       "black"        ))
   (base1      '("#1c1f24" "#1e1e1e"     "brightblack"  ))
   (base2      '("#202328" "#2e2e2e"     "brightblack"  ))
   (base3      '("#23272e" "#262626"     "brightblack"  ))
   (base4      '("#3f444a" "#3f3f3f"     "brightblack"  ))
   (base5      '("#5B6268" "#525252"     "brightblack"  ))
   (base6      '("#73797e" "#6b6b6b"     "brightblack"  ))
   (base7      '("#9ca0a4" "#979797"     "brightblack"  ))
   (base8      '("#DFDFDF" "#dfdfdf"     "white"        ))

   (grey       base4)
   (red         '("#ff628c" "#ff6677" "red"))
   (dark-red    '("#ff5630" nil nil))
   (orange      '("#ff9d00" "#ffaa00" "brightred"))
   (green       '("#a5ff90" "#aaff88" "green"))
   (dark-green  '("#3ad900" "#33dd00" "green"))
   (yellow      '("#ffc600" "#ffcc00" "yellow"))
   (blue        '("#0088ff" "#0088ff" "brightblue"))
   (dark-blue   '("#0050a4" "#0055aa" "blue"))
   (magenta     '("#fb94ff" "#ff99ff" "magenta"))
   (cyan        '("#80fcff" "#88ffff" "brightcyan"))

   ;; TODO
   (teal       '("#4db5bd" "#44b9b1" "brightgreen"  ))
   (violet     '("#a9a1e1" "#a9a1e1" "magenta"      ))
   (dark-cyan  '("#5699AF" "#5699AF" "cyan"         ))

   ;; These are the "universal syntax classes" that doom-themes establishes.
   ;; These *must* be included in every doom themes, or your theme will throw an
   ;; error, as they are used in the base theme defined in doom-themes-base.
   (highlight      magenta) ; e.g. org-mode hyperlink
   (vertical-bar   (doom-darken base1 0.1)) ; TODO
   (selection      dark-blue) ; TODO
   (builtin        orange) ; TODO
   (comments       blue)
   (doc-comments   blue)
   (constants      red)
   (functions      yellow)
   (keywords       orange)
   (methods        yellow)
   (operators      orange)
   (type           yellow)
   (strings        green)
   (variables      fg)
   (numbers        red) ; numbers are just constants
   (region         `(,(doom-lighten (car bg-alt) 0.15) ,@(doom-lighten (cdr base1) 0.35))) ; TODO
   (error          dark-red)
   (warning        yellow)
   (success        dark-green)
   (vc-modified    orange)
   (vc-added       dark-green)
   (vc-deleted     red)

   ;; TODO
   ;; These are extra color variables used only in this theme; i.e. they aren't
   ;; mandatory for derived themes.
   (modeline-fg              fg)
   (modeline-fg-alt          base5)
   (modeline-bg              (doom-darken blue 0.45))
   (modeline-bg-alt          (doom-darken blue 0.475))
   (modeline-bg-inactive     `(,(car bg-alt) ,@(cdr base1)))
   (modeline-bg-inactive-alt `(,(doom-darken (car bg-alt) 0.1) ,@(cdr bg))))

  ;;;; Base theme face overrides
  (((line-number &override) :foreground base4)
   ((line-number-current-line &override) :foreground fg)
   ((font-lock-comment-face &override)
    :background 'unspecified)
   (mode-line
    :background modeline-bg :foreground modeline-fg)
   (mode-line-inactive
    :background modeline-bg-inactive :foreground modeline-fg-alt)
   (mode-line-emphasis :foreground base8)

   ;;;; css-mode <built-in> / scss-mode
   (css-proprietary-property :foreground orange)
   (css-property             :foreground green)
   (css-selector             :foreground blue)
   ;;;; doom-modeline
   (doom-modeline-bar :background modeline-bg)
   (doom-modeline-buffer-file :inherit 'mode-line-buffer-id :weight 'bold)
   (doom-modeline-buffer-path :inherit 'mode-line-emphasis :weight 'bold)
   (doom-modeline-buffer-project-root :foreground green :weight 'bold)
   ;;;; elscreen
   (elscreen-tab-other-screen-face :background "#353a42" :foreground "#1e2022")
   ;;;; ivy
   (ivy-current-match :background dark-blue :distant-foreground base0 :weight 'normal)
   ;;;; LaTeX-mode
   (font-latex-math-face :foreground green)
   ;;;; markdown-mode
   (markdown-markup-face :foreground base5)
   (markdown-header-face :inherit 'bold :foreground red)
   ((markdown-code-face &override) :background (doom-lighten base3 0.05))
   ;;;; rjsx-mode
   (rjsx-tag :foreground red)
   (rjsx-attr :foreground orange)
   ;;;; solaire-mode
   (solaire-mode-line-face
    :inherit 'mode-line
    :background modeline-bg-alt)
   (solaire-mode-line-inactive-face
    :inherit 'mode-line-inactive
    :background modeline-bg-inactive-alt))

  ;;;; Base theme variable overrides-
  ())

;;; doom-cobalt2-theme.el ends here
