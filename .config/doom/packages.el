;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

;; To install a package:
;;
;;   1. Declare them here in a `package!' statement,
;;   2. Run 'doom sync' in the shell,
;;   3. Restart Emacs.
;;
;; Use 'C-h f package\!' to look up documentation for the `package!' macro.


;; To install SOME-PACKAGE from MELPA, ELPA or emacsmirror:
;; (package! some-package)

;; To install a package directly from a remote git repo, you must specify a
;; `:recipe'. You'll find documentation on what `:recipe' accepts here:
;; https://github.com/radian-software/straight.el#the-recipe-format
;; (package! another-package
;;   :recipe (:host github :repo "username/repo"))

;; If the package you are trying to install does not contain a PACKAGENAME.el
;; file, or is located in a subdirectory of the repo, you'll need to specify
;; `:files' in the `:recipe':
;; (package! this-package
;;   :recipe (:host github :repo "username/repo"
;;            :files ("some-file.el" "src/lisp/*.el")))

;; If you'd like to disable a package included with Doom, you can do so here
;; with the `:disable' property:
;; (package! builtin-package :disable t)

;; You can override the recipe of a built in package without having to specify
;; all the properties for `:recipe'. These will inherit the rest of its recipe
;; from Doom or MELPA/ELPA/Emacsmirror:
;; (package! builtin-package :recipe (:nonrecursive t))
;; (package! builtin-package-2 :recipe (:repo "myfork/package"))

;; Specify a `:branch' to install a package from a particular branch or tag.
;; This is required for some packages whose default branch isn't 'master' (which
;; our package manager can't deal with; see radian-software/straight.el#279)
;; (package! builtin-package :recipe (:branch "develop"))

;; Use `:pin' to specify a particular commit to install.
;; (package! builtin-package :pin "1a2b3c4d5e")


;; Doom's packages are pinned to a specific commit and updated from release to
;; release. The `unpin!' macro allows you to unpin single packages...
;; (unpin! pinned-package)
;; ...or multiple packages
;; (unpin! pinned-package another-pinned-package)
;; ...Or *all* packages (NOT RECOMMENDED; will likely break things)
;; (unpin! t)

;; ============================================
;; Custom Packages
;; ============================================

;; Icons for Dired, Neotree, and more
;; NOTE: Doom now uses nerd-icons by default, all-the-icons is redundant
;; (package! all-the-icons)

;; Modern, beautiful org-mode UI
(package! org-modern)

;; Rainbow delimiters for better code readability
(package! rainbow-delimiters)



;; Devdocs - Access developer documentation from within Emacs
;; Supports docs for many languages and frameworks
(package! devdocs)

;; Nov.el - EPUB reader for Emacs
;; Read ebooks directly in Emacs with nice formatting
(package! nov)

;; ============================================
;; Themes and Visual Enhancements
;; ============================================

;; Catppuccin - Beautiful pastel color theme
(package! catppuccin-theme)

;; Focus mode - Dim surrounding text to focus on current section
;; (package! focus)

;; Centered cursor - Keep cursor in center of screen while scrolling
;; (package! centered-cursor-mode)

;; Beacon - Flash cursor on scroll to never lose it
(package! beacon)

;; Dimmer - Dim inactive buffers for focus
(package! dimmer)

;; Pulsar - Pulse line on navigation
(package! pulsar)

;; Kind-icon - Icons in completion menu
(package! kind-icon)

;; Nerd-icons for corfu completion
(package! nerd-icons-corfu)

;; Goggles - Enhanced visual feedback on editing operations
;; NOTE: evil-goggles is already in Doom, this package conflicts
;; (package! goggles)

;; ============================================
;; Productivity and Navigation
;; ============================================

;; Git time machine - Step through git history of a file
(package! git-timemachine)

;; Avy - Jump to any visible text using a char-based decision tree
;; NOTE: Already included in Doom
;; (package! avy)

;; Ace-window - Better window switching with numbers
(package! ace-window)

;; Drag-stuff - Move lines/regions up/down with M-j/k
(package! drag-stuff)

;; Consult-dir - Quick directory navigation
;; (package! consult-dir)

;; Wgrep - Writable grep buffer for mass edits
(package! wgrep)

;; ============================================
;; Writing and Notes
;; ============================================

;; Olivetti - Distraction-free writing mode
(package! olivetti)

;; Org-appear - Toggle visibility of hidden org elements
(package! org-appear)

;; ============================================
;; Web Development (Angular & TypeScript)
;; ============================================

;; Angular support (templates, highlighting)
(package! ng2-mode)

;; TypeScript support for Org-mode code blocks
(package! ob-typescript)

;; Vue.js support
(package! vue-mode)

;; Svelte support
(package! svelte-mode)

;; Add node_modules/.bin to PATH (useful for project-local CLIs)
(package! add-node-modules-path)

;; ============================================
;; Code Intelligence
;; ============================================

;; Symbol-overlay - Highlight and navigate symbols
;; (package! symbol-overlay)

;; Dumb-jump - Jump to definition without LSP
;; (package! dumb-jump)

;; Aggressive-indent - Keep code properly indented at all times
(package! aggressive-indent)

;; ============================================
;; Quality of Life
;; ============================================

;; Helpful - Better *help* buffer
;; NOTE: Already included in Doom
;; (package! helpful)

;; Which-key-posframe - Show which-key in a floating frame
(package! which-key-posframe)

;; ============================================
;; Environment / PATH
;; ============================================

;; Inherit shell PATH into Emacs (required for macOS GUI Emacs)
(package! exec-path-from-shell)

;; ============================================
;; Live Preview Packages
;; ============================================

;; DjVu Support (djvu3)
(package! djvu3 :recipe (:host github :repo "dalanicolai/djvu3"))





;; ============================================
;; Debugging
;; ============================================

;; Posframe for DAP tooltips (hover variable values)
(package! posframe)

;; ============================================
;; AI / Claude Code
;; ============================================

;; inheritenv - required for claude-code to inherit shell env
(package! inheritenv)

;; eat - terminal emulator backend for claude-code
(package! eat)

;; Claude Code - Chat with Claude from Emacs
(package! claude-code
  :recipe (:host github :repo "stevemolitor/claude-code.el"
           :files ("*.el")))

;; Mermaid mode with preview support
(package! mermaid-mode)

;; D2 diagram language mode
(package! d2-mode)
