;;; mon-doc-help-utils.el --- documentation enabling and generation extensions
;; -*- mode: EMACS-LISP; -*-

;;; ================================================================
;; Copyright © 2009, 2010 MON KEY. All rights reserved.
;;; ================================================================

;; FILENAME: mon-doc-help-utils.el
;; AUTHOR: MON KEY
;; MAINTAINER: MON KEY
;; CREATED: 2009-06-17T11:29:15-05:00Z
;; VERSION: 1.0.0
;; COMPATIBILITY: Emacs23.*
;; KEYWORDS: docs, matching, lisp

;;; ================================================================

;;; COMMENTARY: 

;; ================================================================
;; DESCRIPTION:
;; mon-doc-help-utils consolidates functions that offer documentation and or
;; enable generation of documentation. Generally these are for assistance
;; generating Elisp as opposed to programmatic use in Elisp functions and
;; programs.
;;
;; Additional utilities are provided to help with modification of Aaron
;; Hawley's Reference card page on the EmacsWiki.
;; :SEE (URL `http://www.emacswiki.org/emacs/Reference_Sheet_by_Aaron_Hawley')
;; :SEE (URL `http://www.emacswiki.org/emacs/Reference_Sheet_by_Aaron_Hawley_source')
;;
;; :MOTIVATIONS :FROM :FILE /etc/TODO:
;; ,----
;; | ** Have a command suggestion help system that recognizes patterns
;; |    of commands which could be replaced with a simpler common command.
;; |    It should not make more than one suggestion per 10 minutes.
;; `----
;;
;; FUNCTIONS:►►►
;; `mon-help-insert-documentation', `mon-insert-doc-help-tail',
;; `mon-insert-doc-help-cookie', `mon-help-function-spit-doc',
;; `mon-help-function-args', `mon-help-xref-symbol-value',
;; `mon-help-function-arity', `mon-help-parse-interactive-spec',
;; `mon-help-view-file', `mon-help-temp-docstring-display',
;; `mon-help-get-mon-help-buffer', `mon-help-overlay-result',
;; `mon-help-find-result-for-overlay', `mon-help-overlay-on-region',
;; `mon-help-propertize-tags', `mon-help-propertize-tags-TEST',
;; `mon-help-mon-tags', `mon-help-insert-tags', `mon-tags-apropos',
;; `mon-tags-naf-apropos', `mon-help-regexp-syntax', `mon-help-syntax-class',
;; `mon-help-search-functions', `mon-help-type-predicates',
;; `mon-help-plist-functions', `mon-help-plist-properties',
;; `mon-help-text-property-functions', `mon-help-text-property-stickyness',
;; `mon-help-text-property-functions-ext', `mon-help-text-property-properties',
;; `mon-help-frame-functions', `mon-help-window-functions', 
;; `mon-help-easy-menu', `mon-help-widgets', `mon-help-buffer-functions',
;; `mon-help-faces-basic', `mon-help-faces-themes', `mon-help-faces',
;; `mon-help-faces-font-lock', `mon-help-font-lock',
;; `mon-help-font-lock-functions',
;; `mon-help-file-dir-functions-usage', `mon-help-read-functions',
;; `mon-help-print-functions', `mon-help-process-functions', `mon-help-server-functions',
;; `mon-help-xml-functions', `mon-help-color-functions', `mon-help-color-chart',
;; `mon-help-char-representation', `mon-help-char-iso-8859-1',
;; `mon-help-char-ascii', `mon-help-char-ecma-35',
;; `mon-help-char-ecma-48', `mon-help-format-width',
;; `mon-help-package-keywords', `mon-index-elisp-symbol', `mon-help-mon-help',
;; `mon-help-emacs-introspect', `mon-help-crontab', `mon-help-permissions',
;; `mon-help-ipv4-header', `mon-help-unix-commands', `mon-help-w32-env',
;; `mon-help-eieio-defclass', `mon-help-eieio-functions',
;; `mon-help-eieio-methods', `mon-help-nclose-functions', `mon-help-iso-8601',
;; `mon-help-info-incantation', `mon-help-install-info-incantation',
;; `mon-help-tar-incantation', `mon-help-rename-incantation',
;; `mon-help-du-incantation' ,`mon-help-hg-archive', `mon-help-diacritics',
;; `mon-help-keys-wikify', `mon-help-escape-for-ewiki',
;; `mon-help-unescape-for-ewiki', `mon-help-overlay-functions',
;; `mon-help-regexp-symbol-defs-TEST',
;; `mon-help-propertize-regexp-symbol-defs-TEST',
;; `mon-help-overlay-for-example', `mon-help-delimited-region',
;; `mon-help-syntax-functions',
;; `mon-help-utils-loadtime', `mon-help-char-functions',
;; `mon-help-key-functions', `mon-help-custom-keywords',
;; `mon-help-sequence-functions',
;; `mon-help-keys-wikify-anchors', `mon-help-keys-wikify-heading',
;; `mon-help-keys-wikify-TEST', `mon-get-next-face-property-change',
;; `mon-get-next-face-property-change-if', `mon-get-all-face-property-change',
;; `mon-get-text-properties-print', `mon-get-text-properties-read-temp',
;; `mon-get-text-properties-region', `mon-get-text-properties-elisp-string',
;; `mon-get-text-properties-elisp-string-pp',
;; `mon-get-text-properties-parse-prop-val-type-chk',
;; `mon-get-text-properties-parse-buffer', `mon-get-text-properties-parse-sym',
;; `mon-get-text-properties-parse-buffer-or-sym',
;; `mon-get-text-properties-map-ranges',
;; `mon-update-tags-tables', `mon-help-load-functions', `mon-help-w32-functions',
;; `mon-help-make-network-process',
;; `mon-help-binary-representation', `mon-help-char-raw-bytes',
;; FUNCTIONS:◄◄◄
;;
;; MACROS:
;; `mon-help-swap-var-doc-const-val', `mon-help-put-var-doc-val->func',
;; 
;; METHODS:
;;
;; CLASSES:
;;
;; FACES:
;; `mon-help-KEY-tag', `mon-help-DYNATAB-tag', `mon-help-META-tag',
;; `mon-help-PNTR-tag', `mon-help-INNER-KEY-tag', `mon-help-COMMENT-tag',
;; `mon-help-URL-wrap-tag', `mon-help-BUILTIN-tag', `mon-help-OLAY-RESULT',
;; `mon-help-OLAY-RESULT-string-show', `mon-help-OLAY-RESULT-match-show',
;;
;; CONSTANTS:
;;
;; VARIABLES:
;; `*mon-help-mon-tags-alist*', `*regexp-mon-doc-help-docstring-tags-DYNAMIC*',
;; `*regexp-mon-doc-help-docstring-tags-TABLES*',
;; `*regexp-mon-doc-help-docstring-tags*', `*regexp-mon-doc-help-meta-tags*',
;; `*regexp-mon-doc-help-comment-tags*', `*regexp-mon-doc-help-pointer-tags*',
;; `*regexp-mon-doc-help-docstring-tags-URL*', `*regexp-symbol-defs*'
;; `*mon-help-interactive-spec-alist*', `*doc-cookie*',
;; `*mon-help-docstring-help-bffr*', `*regexp-clean-du-flags*',
;; `*mon-help-reference-keys*', `*w32-env-variables-alist',
;; `*regexp-mon-doc-help-builtin-dynamic-tags*',
;; `*mon-help-custom-faces-builtins-tags*',
;; `*regexp-mon-doc-help-builtin-static-tags*', `*mon-help-reference-keywords*',
;; `*mon-tags-table-list*'
;;
;; ALIASED/ADVISED/SUBST'D:
;; `mon-insert-documentation'                -> `mon-help-insert-documentation'
;; `mon-help-reference-sheet'                -> `mon-help-mon-help'
;; `*mon-help-keys-reference*'               -> `*mon-help-reference-keys*'
;; `mon-help-dir-file-function-usage'        -> `mon-help-file-dir-functions-usage'
;; `mon-line-strings-region-delimited'       -> `mon-help-delimited-region'
;; `mon-line-strings-get-delimited-region'   -> `mon-help-delimited-region'
;; `mon-help-face-next-property-change'      -> `mon-get-next-face-property-change'
;; `mon-help-directory-file-functions-usage' -> `mon-help-file-dir-functions-usage'
;; `mon-help-finder-keywords'                -> `mon-help-package-keywords'
;; `mon-help-ecma-48-chars-cntl->hex'        -> `mon-help-char-ecma-48'
;; `mon-help-ecma-48-chars-cntl->hex'        -> `mon-help-char-ecma-48'
;; `mon-help-ascii-chars'                    -> `mon-help-char-ascii' 
;; `mon-help-iso-8859-1-chars'               -> `mon-help-char-iso-8859-1'
;;
;; RENAMED:
;; `*emacs-reference-sheet-A-HAWLEY*'        -> `*mon-help-reference-keys*'
;; `emacs-wiki-fy-reference-sheet'           -> `mon-help-keys-wikify'
;; `emacs-wiki-escape-lisp-string-region'    -> `mon-help-escape-for-ewiki'
;; `emacs-wiki-unescape-lisp-string-region'  -> `mon-help-unescape-for-ewiki'
;; `mon-help-make-faces'                     -> `mon-help-faces'
;; `mon-help-basic-faces'                    -> `mon-help-faces-basic'
;; `mon-help-file-dir-functions'             -> `mon-help-file-dir-functions-usage'
;; `mon-help-ASCII-chars'                    -> `mon-help-char-ascii'
;; `mon-help-ISO-8859-1-chars'               -> `mon-help-char-iso-8859-1'
;; `mon-help-cntl->hex->ecma-48'             -> `mon-help-char-ecma-48'
;; `mon-help-cntl->hex->ecma-35'             -> `mon-help-char-ecma-35' 
;; `mon-help-print'                          -> `mon-help-print-functions'
;;
;; MOVED:
;; `mon-help-CL-time', `mon-help-CL-loop', `mon-help-slime-keys' -> mon-doc-help-CL.el
;;
;; `mon-index-elisp-symbol'                  <- mon-utils.el
;;
;; `mon-help-pacman-Q', `mon-help-pacman-S' `mon-help-pacman-commands',
;; `*regexp-clean-pacman-Q*'`*regexp-clean-pacman-S*' -> mon-doc-help-pacman.el
;;
;; `*mon-tags-table-list*'                   <- mon-default-start-loads.el
;; `mon-update-tags-tables'                  <- mon-default-start-loads.el
;; 
;; Following moved from `mon-insertion-utils.el' and :RENAMED *insert* -> *help*
;; `mon-insert-file-dir-functions'           -> `mon-help-file-dir-functions-usage'
;; `mon-insert-install-info-incantation'     -> `mon-help-install-info-incantation'
;; `mon-insert-rename-incantation'           -> `mon-help-rename-incantation'
;; `mon-insert-tar-incantation'              -> `mon-help-tar-incantation'
;; `mon-insert-info-incantation'             -> `mon-help-info-incantation'
;; `mon-insert-diacritics'                   -> `mon-help-diacritics'
;;
;; REQUIRES:
;; cl.el `intersection' in `mon-help-function-spit-doc'
;;
;; :FILE boxquote.el 
;;       | ->`mon-help-regexp-symbol-defs-TEST'
;;  
;; mon-doc-help-pacman.el (Loaded only if it exists in load-path)
;; :SEE (URL `http://www.emacswiki.org/emacs/mon-doc-help-pacman.el')
;;
;; mon-doc-help-proprietary.el (Loaded only if it exists in load-path)
;; :NOTE This packages provides documentation functions which can't possibly be
;; GPL/GFDL e.g MS-C0RP API etc. Contact MON if you wish to have this package
;; made avaiable to you.
;;
;; mon-doc-help-utils-supplemental.el
;; :SEE (URL `http://www.emacswiki.org/emacs/mon-doc-help-utils-supplemental.el')
;; This package is required and should be present in Emacs load-path when using
;; mon-doc-help-utils. It provides the specific subfeatures required to
;; bootstrap mon-doc-help-utils.  In order to load and byte-compile
;; mon-doc-help-utils a few subfeatures need to be present. If you do not wish
;; to load the full feauture set of the following packages
;; mon-doc-help-utils-supplemental.el is careful to load only the neccesary
;; functions and variables listed below:
;;
;; :FILE mon-testme-utils.el
;;       | -> `mon-insert-lisp-testme'
;; :FILE mon-insertion-utils.el 
;;       | -> `comment-divider'
;; :SEE (URL `http://www.emacswiki.org/emacs/mon-insertion-utils.el')
;;
;; :FILE mon-regexp-symbols.el 
;;       | -> `*regexp-symbol-defs*'          
;; :SEE (URL `http://www.emacswiki.org/emacs/mon-regexp-symbols.el')
;;
;; :FILE mon-utils.el
;;       | -> `mon-string-index'      
;;       | -> `mon-string-upto-index' 
;;       | -> `mon-string-after-index'
;;       | -> `mon-string-justify-left'
;; :SEE (URL `http://www.emacswiki.org/emacs/mon-utils.el')
;;
;; :NOTE While mon-doc-help-utils-supplemental.el will provide the necessary
;; features in order to get mon-doc-help-utils bootstrapped wherever possible
;; MON encourages you to also use the above required packages in addition to the
;; supplemental. As such, where those packages are present the supplemental
;; will not shadow any additional functionality extensions which they provide.
;; 
;; TODO:
;; Hopefully sometime in the near future the Emacs-devels will begin using the
;; bzr and Launchpad features of distributed version control to build a better
;; Emacs Lisp 'packaging' tool that can aid in some of this minor dependency
;; issues and this type of stuff won't be quite as big a problem (and instead
;; we'll all move to grokking DAGs with recursive dependency cycles). In the
;; interim MON is still using Mercurial. Contact MON for access to a stripped
;; hg archive of all MON's current Elisp source.
;;
;; NOTES:
;; 
;; :NOTE MON doesn't like the new 23.0 style UPCASE args in *Help*.
;;
;; (setq help-downcase-arguments t)
;;
;; Where clarity is the concern it is nicer to font-lock arguments in
;; `help-mode' with a face that readily stands out from the surrounding
;; docstring. Following are the face customizations for `button' and
;; `help-argument-name' which MON finds help make help-mode more helpful.
;;  These are provided as quoted forms straight from MON's custom file:
;;
;; '(button 
;;   ((((supports :underline t)) (:background "gray5" 
;;                                :foreground "LightSkyBlue" 
;;                                :underline "Aquamarine" 
;;                                :weight normal))))
;;
;; '(help-argument-name 
;;   ((((supports :slant italic)) (:inherit italic 
;;                                 :foreground "SteelBlue" 
;;                                 :weight normal))))
;;
;; :NOTE MON doesn't like not getting back a reasonably long list and when
;; evaluating `:EXAMPLE's in help-mode *Help* buffers. Following hook ensures
;; that these types of evaluations return a nice long list:
;
;; (add-hook 'help-mode-hook 
;;          #'(lambda () (set (make-local-variable 'print-length) nil)))
;;
;;
;; KEYBINDINGS:
;; Assigning a keybinding for `mod-doc-help-insert-cookie'
;; and make inserting the `*doc-cookie*' variable easier esp. when
;; the doc-cookie is not default and/or you have trouble remembering
;; the ucs char-code for inserting '►►►' \(ucs-insert \"25BA\"\) ;=> ►
;;
;; Assigning a keybinding for `mon-insert-lisp-testme'
;; will make insertion of ';;;test-me;(.*)' strings at end of function defuns
;; easier. This utility trys to DWIM.
;;
;; Alternatively, assigning a keybinding for `mon-insert-doc-help-tail'
;; will give most of the functionality of `mon-insert-lisp-testme'
;; by helping in generation of introspecting function bodies which utilize the
;; tools included herein.
;;
;; :COURTESY Pascal Bourguignon :WAS `space-doc'
;; :SUBJECT Re: How to see that a variable holds t :DATE 2010-01-04
;; :SEE (URL `http://lists.gnu.org/archive/html/help-gnu-emacs/2010-01/msg00060.html')
;; "You could even bind space to automatically find the doc for you:
;;      (global-set-key (kbd "SPC") 'space-doc)
;;  Or, use local-set-key in mode hooks where you write emacs lisp code
;;  such as emacs-lisp-mode-hook."
;; (defun mon-space-doc ()
;;   (interactive)
;;   (save-excursion
;;     (backward-sexp) (backward-char)
;;     (when (looking-at "(")
;;       (forward-char)
;;       (when (thing-at-point 'symbol)
;;         (let* ((start (point))
;;                (end (progn (forward-sexp) (point)))
;;                (symname (buffer-substring start end)))
;;           (ignore-errors (describe-function (intern symname)))))))
;;   (insert " "))
;;
;; SNIPPETS:
;; (while (search-forward-regexp "\\(mon-help-function-spit-doc '\\(.*\\) nil nil t\\)")
;;   (replace-match "mon-help-function-spit-doc '\\2 :insertp t"))
;; :COMPILE-COMMAND 
;; "emacs -batch -L . -eval '(byte-compile-file \"mon-doc-help-utils.el\")' 
;;  rm -v mon-doc-help-utils.elc"
;;
;; THIRD-PARTY-CODE:
;; Portions herein from Aaron Hawley :HIS Reference Sheet By Aaron Hawley:
;; :SEE (URL `http://www.emacswiki.org/emacs/Reference_Sheet_by_Aaron_Hawley_source')
;;
;; I think I remember lifting the `mon-help-escape-for-ewiki'
;; from Pascal Bourguignon but I can no longer find the reference
;; to the source... I have it elsewhere as `escape-lisp-string-region'.
;;
;; URL: http://www.emacswiki.org/emacs/mon-doc-help-utils.el
;; FILE-PUBLISHED: <Timestamp: #{2009-08-15} - by MON KEY>
;;
;; PUBLIC-LINK (URL `http://www.emacswiki.org/emacs/MonDocHelpUtilsDictionary')
;; FIRST-PUBLISHED <Timestamp: #{2010-01-09T01:03:52-05:00Z}#{10016} - by MON>
;;
;; PUBLIC-LINK: 
;; (URL `http://www.emacswiki.org/emacs/mon-doc-help-utils-supplemental.el')
;; FIRST-PUBLISHED: <Timestamp: #{2009-12-21T21:20:06-05:00Z}#{09522} - by MON>
;;
;; FILE-CREATED:
;; <Timestamp: Wednesday June 17, 2009 @ 11:29.15 AM - by MON KEY>
;;
;; ================================================================

;;; LICENSE:

;; ================================================================
;; This file is not part of GNU Emacs.

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 3, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth
;; Floor, Boston, MA 02110-1301, USA.
;; ================================================================
;; Permission is granted to copy, distribute and/or modify this
;; document under the terms of the GNU Free Documentation License,
;; Version 1.3 or any later version published by the Free Software
;; Foundation; with no Invariant Sections, no Front-Cover Texts,
;; and no Back-Cover Texts. A copy of the license is included in
;; the section entitled "GNU Free Documentation License".
;; A copy of the license is also available from the Free Software
;; Foundation Web site at:
;; (URL `http://www.gnu.org/licenses/fdl-1.3.txt').
;;; ================================================================
;; Copyright © 2009, 2010 MON KEY 
;;; ==============================

;;; CODE:

;;; ==============================
;;; `defun*' `intersection' in `mon-help-function-spit-doc'
(eval-when-compile (require 'cl))

;;; :NOTE `mon-help-parse-interactive-spec' has failover in mon-doc-help-utils-supplemental.el
;;; :NOTE `mon-help-function-spit-doc' has failover inlined but defaults to `intersection'
;;; :REQUIRED-BY `mon-help-function-spit-doc', `mon-help-parse-interactive-spec'
(eval-when-compile (require 'mon-cl-compat nil t))

;;; ==============================
;; :EMACS-WIKI - So we don't require more than you want/need.
;;
(unless (featurep 'mon-regexp-symbols)
  (if (locate-library "mon-regexp-symbols")
      (require 'mon-regexp-symbols)))
;;
(unless (featurep 'mon-regexp-symbols)
  (if (locate-library "mon-insertion-utils")
      (require 'mon-insertion-utils)))
;;
;; When not load the full packages above load :FILE mon-doc-help-utils-supplemental.el
(unless (and (featurep 'mon-insertion-utils)
             (featurep 'mon-regexp-symbols)
             ;; :NOTE Following from :FILE mon-utils.el Can't do a
             ;; featurep/require test on it though because that requires this
             ;; and fails with recursive load.
             (and (fboundp 'mon-string-index) 
                  (fboundp 'mon-string-upto-index)
                  (fboundp 'mon-string-after-index)
                  (fboundp 'mon-string-justify-left)))
  (require 'mon-doc-help-utils-supplemental))
;;

;;; ==============================
;;; :CREATED <Timestamp: Friday July 03, 2009 @ 01:11.47 PM - by MON KEY>
(defvar *doc-cookie* nil
  "*Default 'documentation cookie' \"►►►\".
A Documentation cookie delimter for use with `mon-help-function-spit-doc'.\n
Used to delimit which portion of docstring should be commented out when
inserting into buffer. Default is \"\u25BA\u25BA\u25BA\"\n
EXAMPLE:\n
\(momentary-string-display 
 \(let \(cooky\)
   \(dotimes \(i 3 (concat \" The `*doc-cookie*' -> \" cooky \)\)
     \(setq cooky \(concat \(char-to-string ?\\u25BA\) cooky\)\)\)\)
 \(point\)\)\n
:SEE-ALSO `mon-insert-doc-help-cookie', `mon-insert-doc-help-tail'
`mon-insert-ebay-field-trigger-l', `mon-insert-ebay-field-trigger-r',
`mon-insert-ebay-field-trigger-l-and-r'.\n►►►")
;;
(when (not (bound-and-true-p *doc-cookie*))
  (setq *doc-cookie* "►►►"))

;;; ==============================
;;; :CREATED <Timestamp: #{2009-12-20T17:42:27-05:00Z}#{09517} - by MON KEY>
(defvar *mon-help-docstring-help-bffr* "*MON-HELP*"
  "*A buffer name in which to check `mon-help-*' related docstrings.
Default is *MON-HELP*\n
:SEE-ALSO `mon-help-view-file', `mon-help-temp-docstring-display'.\n►►►")
;;
;;; :TEST-ME *mon-help-docstring-help-bffr*
;;
;;;(progn (makunbound *mon-help-docstring-help-bffr*)
;;;       (unintern *mon-help-docstring-help-bffr*) )

;;; ==============================
;;; :CREATED <Timestamp: #{2010-02-19T20:27:23-05:00Z}#{10076} - by MON KEY>
(defvar *mon-help-custom-faces-builtins-tags*
  '(":action" ":args" ":background" ":box" ":button-face" ":button-prefix"
   ":button-suffix" ":color" ":doc" ":family" ":fontset" ":foreground" ":format"
   ":foundry" ":get" ":group" ":height" ":help-echo" ":inherit" ":initialize"
   ":inline" ":inverse-video" ":line-width" ":link" ":load" ":match"
   ":match-alternatives" ":options" ":overline" ":package-version" ":prefix"
   ":require" ":risky" ":save" ":set" ":set-after" ":slant" ":stipple"
   ":strike-through" ":style" ":style" ":tag" ":type" ":underline" ":validate"
   ":value" ":version" ":weight" ":width")
  "*List of keyword styled strings used with defcustom and defface forms.\n 
:SEE-ALSO `mon-help-BUILTIN-tag', `*regexp-mon-doc-help-builtin-dynamic-tags*',
`*regexp-mon-doc-help-builtin-static-tags*'.\n►►►")
;;
;;; :TEST-ME *mon-help-custom-faces-builtins-tags*
;;
;;;(progn (makunbound '*mon-help-custom-faces-builtins-tags*)
;;;       (unintern '*mon-help-custom-faces-builtins-tags*) )

;;; ==============================
;;; :TODO These and their occurences in MON files should be replaced by:
;;;   [FUNCTION], [VARIABLE], [SOME-THING], etc.
;;; This should alter the standard tags in `meta-tags' key from:
;;;   <TAG> -> [TAG] For congruence with CLTL2, document-temp
;;;  Which is more inline with other Lisp2 documentation styles :)
;;; Ideally the elts of key 'meta-tags and 'meta-tags-keybindings
;;; would use "MATHEMATICAL LEFT/RIGHT ANGLE BRACKET" e.g.:
;;;   ?\u27e8 "⟨" and ?\u27e9 "⟩"
;;; But, That code-point doesn't have glyph with our pref. font on current w32.
;;; :MODIFICATIONS <Timestamp: #{2010-02-26T14:52:42-05:00Z}#{10085} - by MON KEY>
;;; :CREATED <Timestamp: #{2009-11-20T17:41:52-05:00Z}#{09475} - by MON>
(defvar *mon-help-mon-tags-alist* nil
  "*An alist of commonly used MON tags.\n
The `comment-tags' key associates tags appearing in source comments.
The `docstr-tags' key associates tags appearing in docstrings.
The `meta-tags' key associates tags appearing in both soure comments and 
docstrings to indicated metasyntactic or idiomatic forms and types.\n
:EXAMPLE\n\(assoc 'comment-tags *mon-help-mon-tags-alist*\)
\(assoc 'docstr-tags *mon-help-mon-tags-alist*\)
\(assoc 'meta-tags *mon-help-mon-tags-alist*\)
\(assoce 'meta-tags-keybindings *mon-help-mon-tags-alist*\)\n
:SEE-ALSO `*regexp-mon-doc-help-docstring-tags-DYNAMIC*',
`*regexp-mon-doc-help-docstring-tags-TABLES*',
`*regexp-mon-doc-help-docstring-tags*',`*regexp-mon-doc-help-comment-tags*',
`*regexp-mon-doc-help-meta-tags*', `mon-help-insert-tags', `mon-help-mon-tags',
`*mon-help-reference-keywords*', `*mon-help-custom-faces-builtins-tags*'.►►►")
;;
(unless (bound-and-true-p *mon-help-mon-tags-alist*)
  (setq *mon-help-mon-tags-alist*
        '(;; :NOTE When adding face props in emacs-lisp-mode make sure to 
          ;;  set ``font-lock-face'' property to SOME-FACE prop-val
          ;;  setting just a ``face'' property won't light up.
          ;;  With `set-text-properties' & `add-text-properties' add the quoted
          ;;  plist with prop propval pairs e.g:
          ;; '(face font-lock-constant-face font-lock-face font-lock-constant-face))
          ;;  With `put-text-property' add the quoted prop with prop-val e.g.:
          ;; (put-text-property START END 'font-lock-face font-lock-constant-face)
          ;; (put-text-property START END 'face font-lock-constant-face)
          (comment-tags ;; `*regexp-mon-doc-help-comment-tags*'
           (":AFTER" ":AS-OF" ":BEFORE" ":ADDED" 
            ":CHANGED" ":CLEANUP" ":CLOSE" ":COMMENTED" ":COURTESY" ":CREATED"  
            ":DATE" 
            ":EMACS-WIKI" ":EVAL-BELOW-TO-TEST" 
            ":FIXES" ":FIXME" ":FIX-ME" ":FROM" ;; :NOTE also has ":FILE"
            ":HIS" ":IF-NOT-FEATURE-P"
            ":LOAD-SPECIFIC-PROCEDURES" 
            ":MODIFICATIONS" 
            ":RENAMED" ":REQUIRES" ":REQUIRED-BY"
            ":SEE-BELOW" ":SUBJECT"
            ":TAGS-COMMON" ":TEST-ME" ":TESTING" ":TODO"  ":TO"
            ":UNCOMMENT-BELOW-TO-TEST" ":UNCOMMENT-TO-TEST"
            ":VERSION"
            ;; :NOTE ":WANTING" is used w/ ":TEST-ME" for expected return value. 
            ;;  Has same length e.g. (eq (length ":TEST-ME") (length ":WANTING"))
            ":WANTING"
            ":WAS"))
          (docstr-tags ;; `*regexp-mon-doc-help-docstring-tags*'
           ("►►►" ":ALIASED-BY" 
            ":CALLED-BY" 
            ":EXAMPLE"
            ":FACE-DEFINED-IN" ":FACE-DOCUMENTED-IN" 
            ":FACE-INHERITED-BY" ":FACE-INHERITS-FROM" 
            ":FACE-FONT-LOCKING-WITH"
            ;; ":INHERITED-BY" ":FACE-INHERITS-FROM "
            ":FILE" 
            ":IDIOM"
            ":KEYWORD-REGEXPS-IN" ":KEYWORD-LISTS-IN" 
            ":NOTE"
            ":REGEXPS-IN" 
            ":SEE" ":SEE-ALSO" ":SOURCE" 
            ":USED-BY" ":USED-IN"))
          (meta-tags-keybindings ;; 
           ("<BEGINNING>" "<BUFFER>" "<CLASS>" "<COMMAND>" "<CONSTANT>"
            "<DEPRECATED>" "<DIRECTORY>" "<EXPRESSION>" "<FACE>" "<FILE>" "<FILES>"
            "<FUNCTION>" "<INTEGER>" "<KEY>" "<LIBRARY>" "<MACRO>" "<MARKER>"
            "<MATCH>" "<METHOD>" "<NAME>" "<NEW>" "<OLD>" "<PATH>" "<PATTERN>"
            "<PRINTER>" "<PROPERTY>" "<REGEXP>" "<STRING>" "<SYMBOL>" "<TERM>"
            "<TERMS>" "<TITLE>" "<VARIABLE>"))
          ;; :NOTE Push/append onto the cdr of this keys list to add new values.
          ;; This lets us partition `meta-tags-keybindings' from `meta-tags'
          ;; where the `meta-tags' key is the superset.
          (meta-tags ;; `*regexp-mon-doc-help-meta-tags*'
           ("<BOOLEAN>")
           )))
  (setf (cdr (assoc 'meta-tags *mon-help-mon-tags-alist*))
        `(,(append
            (cadr (assoc 'meta-tags *mon-help-mon-tags-alist*))
            (cadr (assoc 'meta-tags-keybindings *mon-help-mon-tags-alist*)))))
  ) ;; :CLOSE unless
;;
;;; :TEST-ME (assoc 'comment-tags *mon-help-mon-tags-alist*)
;;; :TEST-ME (assoc 'docstr-tags *mon-help-mon-tags-alist*)
;;; :TEST-ME (assoc 'meta-tags *mon-help-mon-tags-alist*)
;;
;;;(progn (makunbound '*mon-help-mon-tags-alist*) 
;;;       (unintern '*mon-help-mon-tags-alist*) )

;;; ==============================
;;; :CREATED <Timestamp: #{2010-02-26T18:01:23-05:00Z}#{10085} - by MON KEY>
(defvar *mon-help-reference-keywords* nil
  "*A list of keywords appearing in mon-help-.* functions.\n
Includes the upper-cased colon prefixed keywords appearing at BOL and after `;; '.\n
Each key maps the keywords present in the docstrings function or /variable.`n
 KEY                     IN-DOCSTRING    CALLING-FUNCTION/VARIABLE
 mon-help-keys-keywords `mon-help-keys' `*mon-help-reference-keys*'\n
:SEE-ALSO `*mon-help-mon-tags-alist*'.\n►►►")
;;
(unless (bound-and-true-p *mon-help-reference-keywords*)
  (setq *mon-help-reference-keywords* 
        '((mon-help-keys-keywords
           (:ABBREV-KEY-BINDINGS :ALIGN-KEY-BINDINGS :ANIMATION-KEY-BINDINGS
            :AUTOINSERT-KEY-BINDINGS :BROWSE-URL-KEY-BINDINGS :BUFFER-KEY-BINDINGS
            :BUFFER-MENU-KEY-BINDINGS :C-KEY-BINDINGS :CALC-KEY-BINDINGS
            :CALENDAR-KEY-BINDINGS :CANCEL-KEY-BINDINGS :CAPITALIZATION-KEY-BINDINGS
            :CHANGELOG-KEY-BINDINGS :CHAR-KEY-BINDINGS :CHAR-KEY-BINDINGS
            :COLUMN-KEY-BINDINGS :COMMAND-KEY-BINDINGS :COMMENT-KEY-BINDINGS
            :COMPILE-KEY-BINDINGS :COMPLETION-KEY-BINDINGS :COMPOSITION-KEY-BINDINGS
            :CUSTOMIZE-KEY-BINDINGS :DABBREV-KEY-BINDINGS :DELETE-KEY-BINDINGS
            :DELIMITED-TEXT-KEY-BINDINGS :DIARY-KEY-BINDINGS :DIFF-KEY-BINDINGS
            :DIRECTORY-FOLDER-KEY-BINDINGS :DIRECTORY-KEY-BINDINGS :EDIFF-KEY-BINDINGS
            :ELISP-DEBUG-KEY-BINDINGS :ELISP-INTERACTION-KEY-BINDINGS
            :EMACS-LISP-KEY-BINDINGS :EMAIL-KEY-BINDINGS :EMERGE-KEY-BINDINGS
            :ETAGS-KEY-BINDINGS :EXIT-KEY-BINDINGS :FILE-KEY-BINDINGS :FILE-KEY-BINDINGS
            :FINDER-KEY-BINDINGS :FRAME-REGISTER-KEY-BINDINGS :GAMES-KEY-BINDINGS
            :GDB-KEY-BINDINGS :GREP-KEY-BINDINGS :HELP-KEY-BINDINGS :HTML-KEY-BINDINGS
            :INDENT-KEY-BINDINGS :INFO-HELP-KEY-BINDINGS :ITERATIVE-COMMAND-KEY-BINDINGS
            :KEYS-KEY-BINDINGS :KILL-CUT-KEY-BINDINGS :KILL-CUT-KEY-BINDINGS
            :LINE-KEY-BINDINGS :LINE-KEY-BINDINGS :LISP-KEY-BINDINGS :LOCATE-KEY-BINDINGS
            :MACRO-KEY-BINDINGS :MARK-KEY-BINDINGS :MENU-KEY-BINDINGS
            :MERGE-CONFLICT-KEY-BINDINGS :MINIBUFFER-KEY-BINDINGS :MODE-KEY-BINDINGS
            :NEWLINE-KEY-BINDINGS :NON-INTERACTIVE-SEARCH-KEY-BINDINGS
            :NON-ITERATIVE-COMMAND-KEY-BINDINGS :NUMBER-REGISTER-KEY-BINDINGS
            :OCCUR-KEY-BINDINGS :OPEN-KEY-BINDINGS :OUTLINE-KEY-BINDINGS
            :PAGE-KEY-BINDINGS :PARAGRAPH-KEY-BINDINGS :POINT-REGISTER-KEY-BINDINGS
            :POSITION-REGISTER-KEY-BINDINGS :READ-ONLY-KEY-BINDINGS
            :RECTANGLE-KEY-BINDINGS :RECURSIVE-EDIT-KEY-BINDINGS
            :RECURSIVE-EDIT-KEY-BINDINGS :REDISPLAY-KEY-BINDINGS :REGION-KEY-BINDINGS
            :REGULAR-EXPRESSION-KEY-BINDINGS :REPLACE-KEY-BINDINGS :SEARCH-KEY-BINDINGS
            :SENTENCE-KEY-BINDINGS :SEXP-AND-PAREN-KEY-BINDINGS :SHELL-KEY-BINDINGS
            :SHELL-SCRIPT-KEY-BINDINGS :SORT-KEY-BINDINGS
            :SOURCE-LEVEL-DEBUGGER-KEY-BINDINGS :SPELL-CHECK-KEY-BINDINGS
            :SQL-KEY-BINDINGS :TABLE-KEY-BINDINGS :TEXT-REGISTER-KEY-BINDINGS
            :TIMECLOCK-KEY-BINDINGS :TRAMP-KEY-BINDINGS :TRANSPOSE-KEY-BINDINGS
            :UNDO-KEY-BINDINGS :VC-VERSION-CONTROL-KEY-BINDINGS ;; :W3-KEY-BINDINGS
            :WHITESPACE-KEY-BINDINGS :WINDOW-KEY-BINDINGS :WINDOW-REGISTER-KEY-BINDINGS
            :WORD-KEY-BINDINGS :YANK-PASTE-KEY-BINDINGS)))))
;;
;;; :TEST-ME *mon-help-reference-keywords*
;;
;;;(progn (makunbound '*mon-help-reference-keywords*) 
;;;       (unintern '*mon-help-reference-keywords*) )

;;; ==============================
;;; :NOTE Consider adding `→' and/or building separate facility to match/replace
;;; :CREATED <Timestamp: #{2009-11-21T15:07:32-05:00Z}#{09476} - by MON>
(defvar *regexp-mon-doc-help-pointer-tags*
  "\\([;\\[:space:]]?\\)\\(\\(<-\\{1,2\\}\\)\\|\\(-\\{1,2\\}>\\)\\|\\(=\\{1,2\\}>\\)\\)"
  "*Regexp for font-locking 'pointers' in docstrings and comments.\n
For `help-mode' views of MON functions, in particular those from 
:FILE `mon-doc-help-utils.el'.\n
:EXAMPLE\n\(save-excursion
  \(dotimes \(i 22\)
    \(mon-help-find-result-for-overlay *regexp-mon-doc-help-pointer-tags* 0 0 78\)\)\)\n
Matches the following:
 ->   ;->  ; -> \n =>   ;=>  ; => \n -->  ;-->  ; --> --->
 <--  <--  ; <--  <---\n <--  ;<-- ; <--  <--- \n ==>  ;==> ; ==>  ===>\n
:EXAMPLE\n \(progn 
   \(search-forward-regexp *regexp-mon-doc-help-pointer-tags*\)
   \(match-string-no-properties 2\)\)\n
:SEE-ALSO `*regexp-mon-doc-help-docstring-tags-DYNAMIC*',
`*regexp-mon-doc-help-docstring-tags-TABLES*',
`*regexp-mon-doc-help-docstring-tags*',`*regexp-mon-doc-help-comment-tags*'
`*regexp-mon-doc-help-meta-tags*'`mon-help-insert-tags', `mon-help-mon-tags',
`*mon-help-mon-tags-alist*'.\n►►►")
;;
;;;
;;; :TEST-ME (progn (search-forward-regexp *regexp-mon-doc-help-pointer-tags*)
;;;                 (match-string-no-properties 2))
;;;
;;; ,---- :UNCOMMENT-BELOW-TO-TEST
;;; | ->   ;->  ; ->
;;; | =>   ;=>  ; =>    
;;; | -->  ;-->  ; --> --->
;;; | <--  <--  ; <--  <---
;;; | <--  ;<-- ; <--  <--- 
;;; | ==>  ;==> ; ==>  ===> 
;;; `----
;;
;;; (progn (makunbound '*mon-help-mon-tags-alist*)
;;;        (unintern '*mon-help-mon-tags-alist*) ) 

;;; ==============================
;;; :CREATED <Timestamp: #{2010-02-15T20:38:17-05:00Z}#{10072} - by MON KEY>
(defvar *regexp-mon-doc-help-docstring-tags-URL*
  "^\\(:SEE \\)?\\((URL `\\)\\(.*\\)\\(')\\)" 
  ;;^^1^^^^^^^^^^^2^^^^^^^^^^^3^^^^^^^4^^^^
  ;;"\\(^:SEE ?\\|[A-z] ?\\)\\((URL `\\)\\(.*\\)\\(')\\)"
  ;; grp2 -> (URL `
  ;; grp4 -> ')
  "*Regexp for matching the \"(URL `\" prefix and \"')\" suffix in docstrings.\n
For `help-mode' views of MON functions, in particular those from:
:FILE `mon-doc-help-utils.el'.\n
:MATCH-GROUP 1 -> ``:SEE''\n:MATCH-GROUP 2 -> ``(URL \x60''
:MATCH-GROUP 3 -> ``{... lotsa URL ...}''\n:MATCH-GROUP 4 -> ``\'\)''\n
:EXAMPLE\n
\(save-excursion  
  \(let \(\(ebnds \(1+ \(cdadr \(nth 1 \(mon-help-delimited-region t\)\)\)\)\)\)
    \(dolist \(i '\(1 2 3 4\)\) 
      \(message \"Next match group is %d\" i\)\(sit-for 1.25\)
      \(search-forward-regexp *regexp-mon-doc-help-docstring-tags-URL* ebnds t\)
      \(mon-help-overlay-result \(match-beginning i\) \(match-end i\)
                               78 \(match-string-no-properties i\)\)\)\)\)\n
►\n:SEE (URL `http://www.IWasArpanet.com/i-am-really-gopher.html'\)
:SEE (URL `http://www.ThisIsNotMilnet.com/not-for-u.html'\)
\(URL `http://www.IamTheInterWeb.com/wow-i-can-blah.htm'\)
\(URL `http://www.IamTheInterTubes.com/now-blah-is-blahging.htm'\)\n◄\n
:SEE-ALSO `*regexp-mon-doc-help-docstring-tags-DYNAMIC*',
`*regexp-mon-doc-help-docstring-tags-TABLES*',
`*regexp-mon-doc-help-docstring-tags*', `*regexp-mon-doc-help-comment-tags*'
`*regexp-mon-doc-help-meta-tags*', `mon-help-insert-tags', `mon-help-mon-tags',
`*mon-help-mon-tags-alist*'.\n►►►")
;;
;;; (progn (makunbound '*regexp-mon-doc-help-docstring-tags-URL*)
;;;        (unintern '*regexp-mon-doc-help-docstring-tags-URL*) ) 

;;; ==============================
;;; :TODO Adjust regexp to match multiple `:' prefixed tags per line.
;;; :CREATED <Timestamp: #{2009-11-21T14:24:06-05:00Z}#{09476} - by MON>
(defvar *regexp-mon-doc-help-docstring-tags-DYNAMIC* "^\\(;; :[A-Z0-8-]+$\\)"
  "*Regexp for font-locking docstring keyword symbol tags.\n
For `help-mode' views of MON functions, in particular those from:
:FILE `mon-doc-help-utils.el'.\n
Matches colon prefixed symbols if preceded by two semicolons and a space at BOL.\n
:EXAMPLE\n (search-forward-regexp *regexp-mon-doc-help-docstring-tags-DYNAMIC*)\n
;; :FINDS-ME\n
:SEE-ALSO `*regexp-mon-doc-help-docstring-tags-TABLES*'
`*regexp-mon-doc-help-docstring-tags*',`*regexp-mon-doc-help-comment-tags*'
`*regexp-mon-doc-help-pointer-tags*',`*regexp-mon-doc-help-meta-tags*'
`mon-help-insert-tags', `mon-help-mon-tags', `*mon-help-mon-tags-alist*'.\n►►►")
;;
;;; :TEST-ME (search-forward-regexp *regexp-mon-doc-help-docstring-tags-DYNAMIC*)
;; :BUBBA
;;;
;;; (progn (makunbound '*regexp-mon-doc-help-docstring-tags-DYNAMIC*)
;;;        (unintern '*regexp-mon-doc-help-docstring-tags-DYNAMIC*) ) 

;;; ==============================
;;; :CREATED <Timestamp: #{2009-11-21T14:24:02-05:00Z}#{09476} - by MON>
(defvar *regexp-mon-doc-help-docstring-tags-TABLES*
  ;;"\\([[:space:]]|[[:space:]]+\\(:[A-Z-]+\\)[[:space:]]+|\\)"
  "\\([\\[:space:]]|[\\[:space:]]+\\(:[A-Z-]+\\)[\\[:space:]]+|\\)"
  "*Regexp for font-locking docstring keyword symbol tags in TABLES.\n
For `help-mode' views of MON functions, in particular those from:
:FILE `mon-doc-help-utils.el'.\n
:EXAMPLE\n \(progn
   \(search-forward-regexp *regexp-mon-doc-help-docstring-tags-TABLES*\)
   \(match-string-no-properties 2\)\)\n
 | :SOME-SECTIONA | :SOME-SECTIONB | :SOME-SECTIONC |\n
:SEE-ALSO `*regexp-mon-doc-help-docstring-tags-DYNAMIC*'
`*regexp-mon-doc-help-docstring-tags*',`*regexp-mon-doc-help-comment-tags*'
`*regexp-mon-doc-help-pointer-tags*',`*regexp-mon-doc-help-meta-tags*'
`mon-help-insert-tags', `mon-help-mon-tags', `*mon-help-mon-tags-alist*'.\n►►►")
;;
;;; :TEST-ME (progn (search-forward-regexp *regexp-mon-doc-help-docstring-tags-TABLES*)
;;;           (match-string-no-properties 2))
;;;
;;; | :SOME-SECTIONA | :SOME-SECTIONB | :SOME-SECTIONC |
;;
;;; (progn (makunbound '*regexp-mon-doc-help-docstring-tags-TABLES*)
;;;        (unintern '*regexp-mon-doc-help-docstring-tags-TABLES*) )

;;; ==============================
;;; :CREATED <Timestamp: #{2009-11-21T14:19:24-05:00Z}#{09476} - by MON>
(defvar *regexp-mon-doc-help-docstring-tags*
  (regexp-opt (cadr (assoc 'docstr-tags  *mon-help-mon-tags-alist*)))
  "*Regexp for locating \"meta-syntactic\" type tags.
For `help-mode' views of MON functions, in particular those from 
:FILE `mon-doc-help-utils.el'.\n
:KEYWORD-LISTS-IN `*mon-help-mon-tags-alist*'
Regexp generated from `docstr-tags' key:
 \(cadr \(assoc 'docstr-tags  *mon-help-mon-tags-alist*\)\)\n
:SEE-ALSO `*regexp-mon-doc-help-docstring-tags-DYNAMIC*',
`*regexp-mon-doc-help-docstring-tags-TABLES*', `*regexp-mon-doc-help-comment-tags*',
`*regexp-mon-doc-help-pointer-tags*', `*regexp-mon-doc-help-meta-tags*',
`mon-help-insert-tags', `mon-help-mon-tags', `*mon-help-mon-tags-alist*'.\n►►►")
;;
;;; :TEST-ME (search-backward-regexp *regexp-mon-doc-help-docstring-tags*)
;;  
;;; (progn (makunbound '*regexp-mon-doc-help-docstring-tags*)
;;;        (unintern '*regexp-mon-doc-help-docstring-tags*) )

;;; ==============================
;;; :TODO Build face and parsing routine for these. 
;;;       Should recognize "^;; " and "^;;; " by syntax _then_ regexp.
;;; :CREATED <Timestamp: #{2009-11-21T13:51:13-05:00Z}#{09476} - by MON>
(defvar *regexp-mon-doc-help-comment-tags*
  (regexp-opt (cadr (assoc 'comment-tags  *mon-help-mon-tags-alist*)) t)
  "*Regexp for locating \"meta-syntactic\" type tags.\n
For `help-mode' views of MON functions, in particular those from:
:FILE `mon-doc-help-utils.el'.\n
:KEYWORD-LISTS-IN `*mon-help-mon-tags-alist*'
Regexp generated from `comment-tags' key:
 \(cadr \(assoc 'docstr-tags  *mon-help-mon-tags-alist*\)\)\n
:NOTE These should be fontlocked in `emacs-lisp-mode'.\n
:SEE-ALSO `mon-help-insert-tags', `mon-help-mon-tags',
`*regexp-mon-doc-help-docstring-tags-DYNAMIC*',
`*regexp-mon-doc-help-docstring-tags-TABLES*',
`*regexp-mon-doc-help-docstring-tags*', `*regexp-mon-doc-help-pointer-tags*',
`*regexp-mon-doc-help-meta-tags*', `*mon-help-mon-tags-alist*',
`*regexp-clean-mon-file-keywords*'.\n►►►")
;;
;;; :TEST-ME (search-backward-regexp *regexp-mon-doc-help-comment-tags*)
;;
;;; (progn (makunbound '*regexp-mon-doc-help-comment-tags*)
;;;        (unintern '*regexp-mon-doc-help-comment-tags*) )

;;; ==============================
;;; :CREATED <Timestamp: #{2009-11-21T13:51:15-05:00Z}#{09476} - by MON>
(defvar *regexp-mon-doc-help-meta-tags*
  (regexp-opt (cadr (assoc 'meta-tags *mon-help-mon-tags-alist*)) t)
  "*Regexp for locating \"meta-syntactic\" type tags.\n
For `help-mode' views of MON functions, in particular those from:
:FILE mon-doc-help-utils.el.\n
:KEYWORD-LISTS-IN `*mon-help-mon-tags-alist*'
Regexp generated from `meta-tags' key:
 \(cadr \(assoc 'docstr-tags  *mon-help-mon-tags-alist*\)\)\n
:SEE-ALSO `*regexp-mon-doc-help-docstring-tags-DYNAMIC*',
`*regexp-mon-doc-help-docstring-tags-TABLES*',
`*regexp-mon-doc-help-docstring-tags*', `*regexp-mon-doc-help-comment-tags*',
`*regexp-mon-doc-help-pointer-tags*', `mon-help-insert-tags', 
`mon-help-mon-tags', `*mon-help-mon-tags-alist*'.\n►►►")
;;
;;; (progn (makunbound '*regexp-mon-doc-help-meta-tags*)
;;;        (unintern '*regexp-mon-doc-help-meta-tags*) )

;;; ==============================
;;; :NOTE The constant `lisp-font-lock-keywords-2' in font-lock.el 
;;;  has the regexp "\\<:\\sw+\\>" for identifying ``builtins''.
;;;  However, that ``regexp'' depends on the syntax tables:
;;; `emacs-lisp-mode-syntax-table' or `lisp-mode-syntax-table'
;;; Avoid worrying about `with-syntax-table' wrappers esp. w/re following:
;;; two regexps `*regexp-mon-doc-help-docstring-tags-TABLES*'
;;; `*regexp-mon-doc-help-docstring-tags-DYNAMIC*'
;;; :CREATED <Timestamp: #{2010-02-19T18:10:56-05:00Z}#{10075} - by MON KEY>
(defvar *regexp-mon-doc-help-builtin-dynamic-tags* 
  "\\s-\\(\\s.\\sw[a-z-]+\\)\\s-"
  ;; whtspc.punct.downcase-char+.whtspc ; grp1 -> :some-symbol
 "*Regexp for font-locking builtin keyword symbol tags.\n
Regexp has the form:\n
  whtspc.punct.downcase-char+.whtspc ; grp1 -> :some-symbol\n
For `help-mode' views of MON functions, in particular those from:
:FILE mon-doc-help-utils.el.\n
:NOTE When used alongside `*regexp-mon-doc-help-docstring-tags-TABLES*'
and `*regexp-mon-doc-help-docstring-tags-DYNAMIC*' and `case-fold-search' is
non-nil this regexp _will match_ but do so incorrectly by also matching
\" :FOO\" which is not what we want given the case-sensitivity of these other
two ``keyword'' regexps. Calling functions (or their expanders) should let-bind
`case-fold-search' if these associated regexps may come into play.\n
:FACE-FONT-LOCKING-WITH `mon-help-BUILTIN-tag'\n
:SEE-ALSO `*regexp-mon-doc-help-builtin-static-tags*',
`*mon-help-custom-faces-builtins-tags*'.\n►►►")
;;
;;; (progn (makunbound '*regexp-mon-doc-help-builtin-dynamic-tags*)
;;;        (unintern '*regexp-mon-doc-help-builtin-dynamic-tags*) )

;;; ==============================
;;; :CREATED <Timestamp: #{2010-02-19T20:32:03-05:00Z}#{10076} - by MON KEY>
(defvar *regexp-mon-doc-help-builtin-static-tags*
  (regexp-opt *mon-help-custom-faces-builtins-tags*)
  "*Regexp for font-locking builtin keyword symbol tags.\n
For `help-mode' views of MON functions, in particular those from:
:FILE mon-doc-help-utils.el\n
:NOTE When used alongside `*regexp-mon-doc-help-docstring-tags-TABLES*'
and `*regexp-mon-doc-help-docstring-tags-DYNAMIC*' and `case-fold-search' is
non-nil this regexp _will match_ but do so incorrectly by also matching
\" :FOO\" which is not what we want given the case-sensitivity of these other
two ``keyword'' regexps. Calling functions (or their expanders) should let-bind
`case-fold-search' if these associated regexps may come into play.\n
:KEYWORD-LISTS-IN `*mon-help-custom-faces-builtins-tags*'\n
:FACE-FONT-LOCKING-WITH `mon-help-BUILTIN-tag'\n
:SEE-ALSO `mon-help-BUILTIN-tag', `*mon-help-custom-faces-builtins-tags*',
`*regexp-mon-doc-help-builtin-dynamic-tags*'.\n►►►")
;;
;;; (progn (makunbound '*regexp-mon-doc-help-builtin-static-tags*)
;;;        (unintern '*regexp-mon-doc-help-builtin-static-tags*) )

;;; ==============================
;;; :CREATED <Timestamp: #{2010-02-06T11:43:27-05:00Z}#{10056} - by MON KEY>
(defgroup mon-doc-help-utils nil
  "*Extensions for help and documentation related procedures.\n
:SEE (URL `http://www.emacswiki.org/emacs/MonDocHelpUtilsDictionary')\n
:SEE-ALSO `mon-doc-help-utils-faces'.\n►►►"
  :link '(url-link :tag "EmacsWiki" "http://www.emacswiki.org/emacs/mon-doc-help-utils.el")
  :link '(url-link :tag "EmacsWiki" "http://www.emacswiki.org/emacs/MonDocHelpUtilsDictionary")
  :prefix "mon-help-"
  :group 'docs)

;;; ==============================
;;; :CREATED <Timestamp: #{2010-02-06T11:26:37-05:00Z}#{10056} - by MON KEY>
(defgroup mon-doc-help-utils-faces nil
  "*The faces for mon-doc-help-utils library.\n
;; :REGEXP-LIST                                :FACE 
`*regexp-mon-doc-help-pointer-tags*'           `mon-help-PNTR-tag'
`*regexp-mon-doc-help-docstring-tags-DYNAMIC*' `mon-help-DYNATAB-tag'
`*regexp-mon-doc-help-docstring-tags-TABLES*'  `mon-help-DYNATAB-tag' 
`*regexp-mon-doc-help-docstring-tags*'         `mon-help-KEY-tag'
`*regexp-mon-doc-help-comment-tags*'           `mon-help-COMMENT-TAG'
`*regexp-mon-doc-help-meta-tags*'              `mon-help-META-tag'
`*regexp-mon-doc-help-docstring-tags-URL*'     `mon-help-URL-wrap-tag'
`*regexp-mon-doc-help-builtin-dynamic-tags*'   `mon-help-BUILTIN-tag'
`*regexp-mon-doc-help-builtin-static-tags*'    `mon-help-BUILTIN-tag'
 unaffiliated                                  `mon-help-INNER-KEY-tag'
 inlined-regexp                                `mon-help-OLAY-RESULT'
 inlined-regexp                                `mon-help-OLAY-RESULT-string-show'
 inlined-regexp                                `mon-help-OLAY-RESULT-match-show'
\n:SEE :FILE mon-doc-help-utils.el\n
:SEE-ALSO `mon-help-propertize-tags', `mon-help-mon-tags', `mon-help-insert-tags',
`*mon-help-mon-tags-alist*', `mon-help-view-file', `mon-help-temp-docstring-display',
`*mon-help-docstring-help-bffr*'.\n►►►"
  :group 'mon-doc-help-utils
  :group 'faces)

;;; ==============================
;; :MON-HELP-FACES
;;; ==============================

;;; ==============================
;;; :CREATED <Timestamp: #{2009-11-21T16:41:30-05:00Z}#{09476} - by MON>
(defface mon-help-KEY-tag
    '(( ((class color) (min-colors 88))
       (:foreground "light steel blue" :weight extrabold)) )
  "*A mon-help-symbol mon-help-symbol KEY face.\n
:KEYWORD-REGEXPS-IN `*regexp-mon-doc-help-docstring-tags*'\n
:SEE-ALSO `mon-help-META-tag', `mon-help-PNTR-tag', `mon-help-COMMENT-tag',
`mon-help-URL-wrap-tag', `mon-help-INNER-KEY-tag' `mon-help-DYNATAB-tag',
`mon-help-OLAY-RESULT', `mon-help-OLAY-RESULT-string-show',
`mon-help-OLAY-RESULT-match-show'.\n►►►"
  :group 'mon-doc-help-utils-faces)
;;
;;; :TEST-ME (describe-face 'mon-help-KEY-tag)
;;
;;; (progn (makunbound 'mon-help-KEY-tag) (unintern 'mon-help-KEY-tag) )

;;; ==============================
;;; :CREATED <Timestamp: #{2009-11-21T17:03:49-05:00Z}#{09476} - by MON>
(defface mon-help-DYNATAB-tag
    '((t :inherit mon-help-KEY-tag :foreground "cadet blue"))
  "*A mon-help-symbol mon-help-symbol DYNAMIC and TABLE tag face.\n
:KEYWORD-REGEXPS-IN `*regexp-mon-doc-help-docstring-tags-TABLES*'\n
:KEYWORD-REGEXPS-IN `*regexp-mon-doc-help-docstring-tags-DYNAMIC*'\n
:SEE-ALSO `mon-help-META-tag', `mon-help-PNTR-tag', `mon-help-INNER-KEY-tag',
`mon-help-COMMENT-tag', `mon-help-URL-wrap-tag', `mon-help-DYNATAB-tag',
`mon-help-KEY-tag',  `mon-help-OLAY-RESULT',
`mon-help-OLAY-RESULT-string-show', `mon-help-OLAY-RESULT-match-show'.\n►►►"
  :group 'mon-doc-help-utils-faces)
;;
;;; :TEST-ME (describe-face 'mon-help-DYNATAB-tag)
;;
;;; (progn (makunbound 'mon-help-DYNATAB-tag) (unintern 'mon-help-DYNATAB-tag) )

;;; ==============================
;;; :CREATED <Timestamp: #{2009-11-21T17:03:30-05:00Z}#{09476} - by MON>
(defface mon-help-META-tag
    '((t :inherit mon-help-KEY-tag :foreground "sky blue"))
  "*A mon-help-symbol META tag face.\n
:KEYWORD-REGEXPS-IN `*regexp-mon-doc-help-meta-tags*'\n
:SEE-ALSO `mon-help-META-tag', `mon-help-PNTR-tag', `mon-help-DYNATAB-tag',
`mon-help-KEY-tag', `mon-help-COMMENT-tag', `mon-help-URL-wrap-tag',
`mon-help-INNER-KEY-tag',  `mon-help-OLAY-RESULT',
`mon-help-OLAY-RESULT-string-show', `mon-help-OLAY-RESULT-match-show'.\n►►►"
  :group 'mon-doc-help-utils-faces)
;;
;;; :TEST-ME (describe-face 'mon-help-PNTR-tag)
;;
;;; (progn (makunbound 'mon-help-META-tag) (unintern 'mon-help-META-tag) )

;;; ==============================
;;; :CREATED <Timestamp: #{2009-11-21T17:37:44-05:00Z}#{09476} - by MON>
(defface mon-help-PNTR-tag
    '((t :inherit mon-help-KEY-tag :foreground "powder blue"))
  "*A mon-help-symbol pointer tag face.\n
:KEYWORD-REGEXPS-IN `*regexp-mon-doc-help-pointer-tags*'\n
:SEE-ALSO `mon-help-META-tag', `mon-help-PNTR-tag', `mon-help-INNER-KEY-tag',
`mon-help-COMMENT-tag', `mon-help-URL-wrap-tag', `mon-help-DYNATAB-tag',
`mon-help-KEY-tag',  `mon-help-OLAY-RESULT',
`mon-help-OLAY-RESULT-string-show', `mon-help-OLAY-RESULT-match-show'.\n►►►"
  :group 'mon-doc-help-utils-faces)
;;
;;; :TEST-ME (describe-face 'mon-help-PNTR-tag)
;;
;;; (progn (makunbound 'mon-help-PNTR-tag) (unintern 'mon-help-PNTR-tag))

;;; ==============================
;;; :CREATED <Timestamp: #{2010-02-15T20:19:56-05:00Z}#{10072} - by MON KEY>
 (defface mon-help-COMMENT-tag
    '((t 
       :inherit mon-help-KEY-tag 
       :weight bold ;; :slant oblique
       :foreground "DarkSlateGray3"))
   "*A mon-help-symbol comment tag face.\n
:KEYWORD-REGEXPS-IN `*regexp-mon-doc-help-comment-tags*'\n
:SEE-ALSO `mon-help-META-tag', `mon-help-PNTR-tag', `mon-help-DYNATAB-tag',
`mon-help-KEY-tag', `mon-help-COMMENT-tag', `mon-help-URL-wrap-tag',
`mon-help-INNER-KEY-tag', `mon-help-OLAY-RESULT',
`mon-help-OLAY-RESULT-string-show', `mon-help-OLAY-RESULT-match-show'.\n►►►"
   :group 'mon-doc-help-utils-faces)
;;
;;; :TEST-ME (describe-face 'mon-help-COMMENT-tag)
;;
;;; (progn (makunbound 'mon-help-COMMENT-tag) (unintern 'mon-help-COMMENT-tag) )

;;; ==============================
;;; :CREATED <Timestamp: #{2010-02-15T18:03:30-05:00Z}#{10071} - by MON KEY>
(defface mon-help-INNER-KEY-tag
    '((t 
       :inherit mon-help-KEY-tag 
       :weight bold
       :foreground "PaleTurquoise2"))
  "*A mon-help-symbol INNER-KEYcomment tag face.\n
:KEYWORD-REGEXPS-IN `'\n
:SEE-ALSO `mon-help-META-tag', `mon-help-PNTR-tag', `mon-help-DYNATAB-tag',
`mon-help-KEY-tag', `mon-help-COMMENT-tag', `mon-help-URL-wrap-tag',
`mon-help-INNER-KEY-tag', `mon-help-OLAY-RESULT',
`mon-help-OLAY-RESULT-string-show', `mon-help-OLAY-RESULT-match-show'.\n►►►"
  :group 'mon-doc-help-utils-faces)
;;
;;; :TEST-ME (describe-face 'mon-help-INNER-KEY-tag)
;;
;;; (progn (makunbound 'mon-help-INNER-KEY-tag) (unintern 'mon-help-INNER-KEY-tag))

;;; ==============================
;;; :CREATED <Timestamp: #{2010-02-15T19:31:22-05:00Z}#{10072} - by MON KEY>
(defface mon-help-URL-wrap-tag
    '((t 
       :inherit button 
       :slant oblique 
       :weight semi-bold 
       :underline nil))
  "*A mon-help-symbol URL tag face.\n
:KEYWORD-REGEXPS-IN `*regexp-mon-doc-help-docstring-tags-URL*'\n
:SEE-ALSO `mon-help-META-tag', `mon-help-PNTR-tag', `mon-help-DYNATAB-tag',
`mon-help-KEY-tag', `mon-help-COMMENT-tag', `mon-help-URL-wrap-tag',
`mon-help-INNER-KEY-tag', `mon-help-OLAY-RESULT',
`mon-help-OLAY-RESULT-string-show', `mon-help-OLAY-RESULT-match-show'.\n►►►"
  :group 'mon-doc-help-utils-faces)
;;
;;; :TEST-ME (describe-face 'mon-help-URL-wrap-tag)
;;
;;; (progn (makunbound 'mon-help-URL-wrap-tag) (unintern 'mon-help-URL-wrap-tag) )

;;; ==============================
;;; :CREATED <Timestamp: #{2010-02-19T17:19:29-05:00Z}#{10075} - by MON KEY>
(defface mon-help-BUILTIN-tag
    '((t 
       :inherit font-lock-builtin-face 
       :weight semi-light
       :background "gray2"
       :overline "DodgerBlue4"))
  "*A mon-help-symbol BUILTIN tag face.\n
:KEYWORD-LISTS-IN `*mon-help-custom-faces-builtins-tags*'
:KEYWORD-REGEXPS-IN `*regexp-mon-doc-help-builtin-dynamic-tags*'.\n
:KEYWORD-REGEXPS-IN `*regexp-mon-doc-help-builtin-static-tags*'\n
:SEE-ALSO `mon-help-META-tag', `mon-help-PNTR-tag', `mon-help-DYNATAB-tag',
`mon-help-KEY-tag', `mon-help-COMMENT-tag', `mon-help-URL-wrap-tag',
`mon-help-INNER-KEY-tag', `mon-help-OLAY-RESULT',
`mon-help-OLAY-RESULT-string-show', `mon-help-OLAY-RESULT-match-show'.\n►►►"
  :group 'mon-doc-help-utils-faces)
;;
;;; :TEST-ME (describe-face 'mon-help-BUILTIN-tag)
;;
;;; (progn (makunbound 'mon-help-BUILTIN-tag) (unintern 'mon-help-BUILTIN-tag) )

;;; SlateBlue3 AntiqueWhite3
;; :foreground "PaleTurquoise2")
;; :foreground "DeepSkyBlue4"))
;; :foreground "DarkSlateGray3"))
;;; :AliceBlue

;;; ==============================
;;; :CREATED <Timestamp: #{2010-02-20T15:24:32-05:00Z}#{10076} - by MON KEY>
(defface mon-help-OLAY-RESULT
    '((t 
      :foreground "lime green"
      :background "black" 
      :box))
  "*A mon-help overlay face for font-locks evaluated examples in help buffers.\n
:FACE-INHERITED-BY `mon-help-OLAY-RESULT-string-show'
:FACE-INHERITED-BY `mon-help-OLAY-RESULT-match-show'
:CALLED-BY `mon-help-overlay-for-example'
:CALLED-BY `mon-help-overlay-result'\n
:SEE-ALSO `mon-help-overlay-on-region', `mon-help-find-result-for-overlay'.\n►►►"
  :group 'mon-doc-help-utils-faces)
;;
;;; :TEST-ME (describe-face 'mon-help-OLAY-RESULT)
;;
;;; (progn (makunbound 'mon-help-OLAY-RESULT) 
;;;        (unintern 'mon-help-OLAY-RESULT) )

;;; ==============================
;;; :CREATED <Timestamp: #{2010-02-20T15:18:06-05:00Z}#{10076} - by MON KEY>
(defface mon-help-OLAY-RESULT-string-show
    '((t 
       :inherit 'mon-help-OLAY-RESULT
       :weight bold
       :box (:line-width 1
             :color "lime green"
             :style raised-button)))
  "*A mon-help overlay face font-locks evaluated examples in help buffers.\n
:FACE-INHERITS-FROM `mon-help-OLAY-RESULT'
:CALLED-BY `mon-help-overlay-for-example'
:CALLED-BY `mon-help-overlay-result'\n
:SEE-ALSO `mon-help-OLAY-RESULT-match-show', \n►►►."
:group 'mon-doc-help-utils-faces)

;;
;;; :TEST-ME (describe-face 'mon-help-OLAY-RESULT-string-show)
;;
;;; (progn (makunbound '`mon-help-OLAY-RESULT-string-show)
;;;        (unintern '`mon-help-OLAY-RESULT-string-show) )

;;; ==============================
;;; :CREATED <Timestamp: #{2010-02-20T15:18:03-05:00Z}#{10076} - by MON KEY>
(defface mon-help-OLAY-RESULT-match-show
    '((t 
       :inherit 'mon-help-OLAY-RESULT
       :weight ultra-bold 
       :box (:line-width 3 
             :color "yellow1" 
             :style released-button)))
  "*A mon-help overlay face for font-locks evaluated examples in help buffers.\n
:FACE-INHERITS-FROM `mon-help-OLAY-RESULT'
:CALLED-BY `mon-help-overlay-for-example'
:CALLED-BY `mon-help-overlay-result'\n
:SEE-ALSO `mon-help-OLAY-RESULT-string-show', `mon-help-overlay-on-region',
`mon-help-find-result-for-overlay'.\n►►►"
  :group 'mon-doc-help-utils-faces)
;;
;;; :TEST-ME (describe-face 'mon-help-OLAY-RESULT-match-show)
;;
;;; (progn (makunbound 'mon-help-OLAY-RESULT-match-show) 
;;;        (unintern 'mon-help-OLAY-RESULT-match-show) )

;;; ==============================
;;; :NOTE (*VAR* MATCH-GRP FACE)  ;COLOR
;;; (*regexp-mon-doc-help-docstring-tags*         0  mon-help-KEY-tag)     ;"light steel blue"  
;;; (*regexp-mon-doc-help-meta-tags*              0  mon-help-META-tag)    ;"sky blue"           
;;; (*regexp-mon-doc-help-pointer-tags*           2  mon-help-PNTR-tag)    ;"powder blue"        
;;; (*regexp-mon-doc-help-docstring-tags-TABLES*  2  mon-help-DYNATAB-tag) ;"cadet blue"         
;;; (*regexp-mon-doc-help-docstring-tags-DYNAMIC* 0  mon-help-DYNATAB-tag) ;"cadet blue"         
;;;   &REST
;;; (*regexp-mon-doc-help-comment-tags*           0 mon-help-COMMENT-tag)   ;"DarkSlateGray3"
;;; (*regexp-mon-doc-help-comment-tags*           0 mon-help-INNER-KEY-tag) ;"PaleTurquoise2"
;;; (*regexp-mon-doc-help-docstring-tags-URL*     2 mon-help-URL-wrap-tag)  ;"LightSkyBlue"
;;; (*regexp-mon-doc-help-docstring-tags-URL*     4 mon-help-URL-wrap-tag)  ;"LightSkyBlue"
;;; (*regexp-mon-doc-help-builtin-dynamic-tags*   1 mon-help-BUILTIN-tag)   ;"SteelBlue"
;;; (*regexp-mon-doc-help-builtin-static-tags*    0 mon-help-BUILTIN-tag)   ;"SteelBlue"
;;; :CREATED <Timestamp: #{2009-11-21T18:15:49-05:00Z}#{09476} - by MON>
(defun mon-help-propertize-tags (&rest more-triples)
  "Propertize mon-help-tags with face values.\n
For advising `help-mode' of some more things to fontlock.\n
When MORE-TRIPLES is non-nil args are three valued lists of:\n
 - A regular expression or symbol which evaluates to one;
 - The match group to propertize (a postive integer);
 - a symbol or string wich names a face;\n
Each list should have the form:\n
 \(some-regexp-or-var match-group face-name\)\n
:EXAMPLE\n\n(mon-help-propertize-tags-TEST\)\n
:SEE-ALSO `mon-help-propertize-tags-TEST',
`mon-help-mon-tags', `mon-help-insert-tags'.\n►►►"
  (let ((help-props
         `((,*regexp-mon-doc-help-docstring-tags*         0  mon-help-KEY-tag)     
           (,*regexp-mon-doc-help-meta-tags*              0  mon-help-META-tag)    
           (,*regexp-mon-doc-help-pointer-tags*           2  mon-help-PNTR-tag)
           (,*regexp-mon-doc-help-docstring-tags-TABLES*  2  mon-help-DYNATAB-tag) 
           (,*regexp-mon-doc-help-docstring-tags-DYNAMIC* 0  mon-help-DYNATAB-tag)
           ,@(when (and more-triples (consp (car more-triples)))
                   (mapcar #'(lambda (mt)
                               `(,(if (stringp (car mt)) (car mt) (symbol-value (car mt)))
                                  ,(if (integerp (cadr mt)) ;; ,@(cdr mt))) mo-triples))))
                                       (cadr mt)
                                       (error (concat ":FUNCTION mon-help-propertize-tags "
                                                      "- list value `%s' not a number") (cadr mt)))
                                  ,(if (facep (caddr mt))
                                       (caddr mt)
                                       (error (concat ":FUNCTION mon-help-propertize-tags "
                                                      "- list value `%s' not a face") (caddr mt)))))
                                  more-triples)))))
    (let ((case-fold-search nil))
      (mapc #'(lambda (x)              
                (goto-char (buffer-end 0))
                (while (search-forward-regexp  (elt x 0) nil t)
                  (add-text-properties 
                   (match-beginning (elt x 1)) (match-end (elt x 1)) 
                   `(face ,(elt x 2)))))
            help-props))))
;;
;;; :TEST-ME (mon-help-propertize-tags-TEST)

;;; ==============================
;;; :REQUIRES `mon-string-justify-left' <- mon-utils.el
;;; :CREATED <Timestamp: #{2009-11-21T18:45:40-05:00Z}#{09476} - by MON>
(defun mon-help-propertize-tags-TEST ()
  "Test function to verify that `mon-help-propertize-tags' is properly
propertizing.\n
:EXAMPLE\n\n\(mon-help-propertize-tags-TEST\)\n
Test the following regexps:
`*regexp-mon-doc-help-comment-tags*'
`*regexp-mon-doc-help-docstring-tags*'
`*regexp-mon-doc-help-meta-tags*'
`*regexp-mon-doc-help-pointer-tags*'
`*regexp-mon-doc-help-docstring-tags-URL*'
`*regexp-mon-doc-help-docstring-tags-DYNAMIC*'
`*regexp-mon-doc-help-docstring-tags-TABLES*'
`*regexp-mon-doc-help-docstring-tags-URL*'
`*regexp-mon-doc-help-builtin-dynamic-tags*'
`*regexp-mon-doc-help-builtin-static-tags*'\n
Test the following keywords in:
`*mon-help-mon-tags-alist*', `*mon-help-custom-faces-builtins-tags*'\n
Test font-locking of the following faces:
`mon-help-URL-wrap-tag', `mon-help-DYNATAB-tag', `mon-help-INNER-KEY-tag',
`mon-help-KEY-tag', `mon-help-META-tag', `mon-help-PNTR-tag',
`mon-help-COMMENT-tag', `mon-help-BUILTIN-tag'\n
:SEE-ALSO `mon-help-mon-tags', `mon-help-insert-tags'.\nn►►►"
  (let ((tags-divd (concat "\n" (make-string 68 95) "\n"))
         test-mhpt)
    (setq test-mhpt
          (with-temp-buffer
            (princ
             (mapconcat 
              #'identity 
              `(,tags-divd
                ";;; (*regexp-mon-doc-help-docstring-tags* 'mon-help-KEY-tag) \"light steel blue\"\n"
                ,@(cadr (assoc 'docstr-tags *mon-help-mon-tags-alist*))
                ":ALIASED-BY" ":CALLED-BY" ":EXAMPLE" ":FACE-DEFINED-IN" ":FACE-DOCUMENTED-IN"
                ":FILE" ":IDIOM" ":NOTE" ":SEE" ":SEE-ALSO" ":SOURCE" ":USED-BY"
                ,tags-divd
                ";;; (*regexp-mon-doc-help-pointer-tags* 'mon-help-PNTR-tag) \"powder blue\"\n"
                "->" ";->" "; ->" "=>" ";=>" "; =>" "-->" ";-->" "; -->" "--->" "<--" "<--" "; <--"
                "<---" "<--" ";<--" "; <--" "<---" "==>" ";==>" "; ==>" "===>"
                ,tags-divd
                ";;; (*regexp-mon-doc-help-docstring-tags-TABLES*  'mon-help-DYNATAB-tag) \"cadet blue\"\n"
                "| :SOME-SECTIONA | :SOME-SECTIONB | :SOME-SECTIONC |"
                ,tags-divd
                ";;; (*regexp-mon-doc-help-meta-tags* 'mon-help-META-tag)\n"
                ,(replace-regexp-in-string "$" " "
                                           (mon-string-justify-left 
                                            (mapconcat #'identity 
                                                       (cadr (assoc 'meta-tags *mon-help-mon-tags-alist*))
                                                       " ") 68 1))
                ,tags-divd
                ";;; (*regexp-mon-doc-help-docstring-tags-DYNAMIC* 'mon-help-DYNATAB-tag) \"cadet blue\"\n"
                ";; :FUNCTION-LISTS" ";; :SEARCHING" ";; :HELP" ";; :TIME" ";; :EIEIO" ";; :CL"
                ";; :ASCII-ART" ";; :PRESENTATION" ";; :KEYS" ";; :CHAR-TABLES" ";; :RECIPES"
                ";; :INTROSPECTION-AND-UTILITY" ";; :VARIABLES" ";; :DOUBLED-1 :SEE" ";; :DOUBLED-2 :SEE-ALSO"
                ,tags-divd
                ";;; (*regexp-mon-doc-help-comment-tags* mon-help-COMMENT-tag) \"DarkSlateGray3\"\n"
                ,@(cadr (assoc 'comment-tags *mon-help-mon-tags-alist*))
                ,tags-divd
                ";;; (*regexp-mon-doc-help-builtin-dynamic-tags* mon-help-BUILTIN-tag) \"SteelBlue\""
                ";;; (*regexp-mon-doc-help-builtin-static-tags* mon-help-BUILTIN-tag) \"SteelBlue\"\n"
                ,(replace-regexp-in-string "$" " "
                                           (mon-string-justify-left 
                                            (mapconcat #'identity *mon-help-custom-faces-builtins-tags* " ") 68 1 ))
                " :bubba" " :more-bubba" " :another-bubba" ;; Make sure dynamic-tags are matching
                ,tags-divd
                ";;; (*regexp-mon-doc-help-docstring-tags-URL* 'mon-help-URL-wrap-tag) \"LightSkyBlue\"\n"
                ":SEE (URL `http://www.IWasArpanet.com/i-am-really-gopher.html'\)"
                "some surrounding (URL `http://www.ThisIsNotMilnet.com/not-for-u.html'\) text"
                "(URL `http://www.IamTheInterWeb.com/wow-i-can-blah.htm'\)"
                "(URL `http://www.IamTheInterTubes.com/now-blah-is-blahging.htm'\)"
                ) "\n")
             (current-buffer))
            (mon-help-propertize-tags
             '(*regexp-mon-doc-help-comment-tags*           0 mon-help-COMMENT-tag)
             '(*regexp-mon-doc-help-docstring-tags-URL*     2 mon-help-URL-wrap-tag)
             '(*regexp-mon-doc-help-docstring-tags-URL*     4 mon-help-URL-wrap-tag)
             '("^_\\{68,68\\}$"                             0 mon-help-INNER-KEY-tag)
             '(*regexp-mon-doc-help-builtin-dynamic-tags*   1 mon-help-BUILTIN-tag)
             '(*regexp-mon-doc-help-builtin-static-tags*    0 mon-help-BUILTIN-tag))
            (buffer-string)))
    (mon-help-temp-docstring-display test-mhpt "*MON-PROPERTIZE-TAGS-TEST*")))
;;
;;; :TEST-ME (mon-help-propertize-tags-TEST)

;;; ==============================
;;; :CREATED <Timestamp: #{2010-02-26T19:31:23-05:00Z}#{10086} - by MON KEY>
(defun mon-get-next-face-property-change (face-prop-val &optional from-posn)
  "Search for `next-single-property-change' with property 'face.\n
If face property has FACE-PROP-VAL push t onto list of return value.
Return a two element list formatted as:\n
 \(position \(t|nil face-prop-vals\)\)\n
When FROM-POSN is non-nil search for next face property change FROM-POSN.
Default is to search from point.\n
:EXAMPLE\n\n\(mon-get-next-face-property-change 'button \(buffer-end 0\)\)\n
\(mon-get-next-face-property-change 
 'help-argument-name \(line-beginning-position -11\)\)\n
\(mon-get-next-face-property-change 'button \(point\)\)\n
:ALIASED-BY `mon-help-face-next-property-change'\n
:SEE-ALSO `mon-get-text-properties-region-to-kill-ring', `mon-test-props',
`mon-line-test-content', `mon-get-next-face-property-change',
`mon-get-next-face-property-change-if', `mon-get-all-face-property-change'
`mon-list-all-properties-in-buffer', `mon-nuke-text-properties-buffer',
`mon-nuke-text-properties-region', `mon-remove-text-property',
`mon-remove-single-text-property'.\n►►►"
   (let (got-tp)
     (setq got-tp (next-single-property-change (or from-posn (point)) 'face))
     (when got-tp
       (if (consp (get-text-property got-tp 'face))
           (setq got-tp `(,got-tp  ,(get-text-property got-tp 'face)))
           (setq got-tp `(,got-tp  (,(get-text-property got-tp 'face))))))
     (when (and got-tp (cadr got-tp))
       (if (memq face-prop-val (cadr got-tp))
           (push t (cadr got-tp))
           (push nil (cadr got-tp))))
     got-tp))
;;
(defalias 'mon-help-face-next-property-change 'mon-get-next-face-property-change)

;;; ==============================
;;; :CREATED <Timestamp: #{2010-02-27T19:58:23-05:00Z}#{10087} - by MON KEY>
(defun mon-get-next-face-property-change-if (test-face-symbol test-at-posn)
  "Text if the face we're looking for is at position.
TEST-FACE-SYMBOL symbol naming a face to test.\n
TEST-AT-POSN position to test at.\n
:SEE-ALSO `mon-get-text-properties-region-to-kill-ring', `mon-test-props',
`mon-line-test-content', `mon-get-next-face-property-change',
`mon-get-next-face-property-change-if', `mon-get-all-face-property-change'
`mon-list-all-properties-in-buffer', `mon-nuke-text-properties-buffer',
`mon-nuke-text-properties-region', `mon-remove-text-property',
`mon-remove-single-text-property'.\n►►►"
(let ((pg (plist-get (text-properties-at test-at-posn) 'face)))
  (when pg 
    (cond ((consp pg) (memq test-face-symbol pg))
          (t (eq test-face-symbol pg))))))
;;
;;; (eq (plist-get (text-properties-at (point)) 'face) 'font-lock-comment-face)
;;; :TEST-ME (mon-get-next-face-property-change-if 'font-lock-comment-face (point));;

;;; ==============================
;;; :TODO If possible figure out what is causing the peculiar return values w/re
;;; the 2nd :NOTE in docstring below and if there is a reasonable workaround.
;;;
;;; `mon-get-all-face-property-change' fails because of some weird. 
;;; return values when invoked in large (e)lisp-mode buffers and won't reliably find faces
;;; `font-lock-string-face' and `font-lock-comment-face' if these have been
;;; font-locked with font-lock syntactic voodo
;;; e.g. `lisp-font-lock-syntactic-face-function's conditional on (nth 3 state)
;;; vis a vis `font-lock-syntactic-face-function', `font-lock-syntactic-keywords'
;;; which the `jit-lock-*' fncns appear to be frobbing in complicated ways.
;;;
;;; Is it possible that the `looking-at' in `font-lock-syntactic-face-function'
;;; isn't `save-match-data'ing???  See at EOB for a redefinition of
;;; `lisp-font-lock-syntactic-face-function' to `save-match-data' as
;;; `mon-lisp-font-lock-syntactic-face-function'.
;;;
;;; NO. That isn't it... this problem is some bogus BULLSHIT! It is clear the
;;; face properties are set as one can immediately yank the text and _SEE_ that
;;; they are present throughout the buffer's string immediatley so I don't think
;;; this is a display problem.
;;;
;;;
;;; :CREATED <Timestamp: #{2010-02-27T19:38:29-05:00Z}#{10087} - by MON KEY>
;; (defun mon-get-all-face-property-change (search-face-symbol get-from-posn)
;;   "Find all start end locations of SEARCH-FACE-SYMBOL at or after get-from-posn.\n
;; SEARCH-FACE-SYMBOL symbol naming a face to find.\n
;; GET-FROM-POSN position to begin finding from.\n
;; :EXAMPLE\n\n\(mon-get-all-face-property-change 'help-argument-name \(buffer-end 0\)\)\n
;; :NOTE Won't find 'button faces in *Help*.\n
;; :NOTE Won't find 'button faces in *Help*.\n
;; :NOTE Invoked in large (e)lisp-mode buffers won't reliably find faces
;; `font-lock-string-face' and `font-lock-comment-face' if these have been
;; font-locked with font-lock syntactic voodo
;; e.g. `lisp-font-lock-syntactic-face-function's conditional on \(nth 3 state\)
;; vis a vis `font-lock-syntactic-face-function', `font-lock-syntactic-keywords'
;; which the `jit-lock-*' fncns appear to be frobbing in complicated ways.\n
;; :SEE-ALSO `mon-get-text-properties-region-to-kill-ring', `mon-test-props',
;; `mon-line-test-content', `mon-get-next-face-property-change',
;; `mon-get-next-face-property-change-if', `mon-get-all-face-property-change'
;; `mon-list-all-properties-in-buffer', `mon-nuke-text-properties-buffer',
;; `mon-nuke-text-properties-region', `mon-remove-text-property',
;; `mon-remove-single-text-property'.\n►►►"
;;   (save-excursion
;;     (let ((sfc search-face-symbol)
;;           top-st bot-st fc-bnds)
;;       (when (mon-get-next-face-property-change-if sfc get-from-posn)
;;         (setq top-st 
;;               (1- (previous-single-property-change 
;;                    (point) 'face nil (line-beginning-position)))))
;;       (if (integerp top-st)
;;           (setq top-st (mon-get-next-face-property-change sfc top-st))
;;           (setq top-st (mon-get-next-face-property-change sfc get-from-posn)))
;;       (while top-st
;;         (setq bot-st 
;;               (mon-get-next-face-property-change sfc (car top-st)))
;;         (when (caadr top-st)
;;           (push `(,(car top-st) . ,(car bot-st)) fc-bnds))
;;         (when bot-st 
;;           (setq top-st (mon-get-next-face-property-change sfc (car bot-st)))
;;           (goto-char (car bot-st)))
;;         (when (and (null (caadr top-st)) (null (caadr bot-st)))
;;           (while (and top-st 
;;                       (not (eq (cadadr 
;;                                 (mon-get-next-face-property-change 'font-lock-constant-face (point)))
;;                                font-lock-constant-face)))
;;             (if (car (mon-get-next-face-property-change 'font-lock-constant-face (point)))
;;                 (goto-char (car (mon-get-next-face-property-change 'font-lock-constant-face (point))))
;;                 (setq top-st nil)))))
;;           (setq fc-bnds (nreverse fc-bnds))
;;           ;; Uncomment when debug.
;;           ;; (goto-char (buffer-end 1)) (prin1 fc-bnds (current-buffer))
;;           )))

;;; ==============================
;;; :CREATED <Timestamp: #{2010-03-05T17:35:32-05:00Z}#{10095} - by MON KEY>
(defun mon-get-text-properties-region (start end)
  "Return region as a two elt list string and strings text properties.\n
:EXAMPLE\n\n\(let \(\(sbr \(save-excursion (goto-char (buffer-end 0))
             \(search-forward-regexp \"\(mon.*\)$\" nil t\)\)\)\)
  \(setq sbr `\(,\(match-beginning 0\) . ,\(match-end 0\)\)\)
  \(mon-get-text-properties-region \(car sbr\) \(cdr sbr\)\)\)\n
:NOTE Indexes are into string not buffer as with return value of:
 `mon-get-text-properties-print' & `mon-get-text-properties-read-temp'
:SEE-ALSO `mon-get-text-properties-region-to-kill-ring'.\n►►►"
  (interactive "r\np")
  (let (get-str nw-tl) 
    (setq get-str (substring (format "%S" (buffer-substring start end)) 1))
    (setq get-str (car (read-from-string get-str)))
    (setq get-str `(,(car get-str) ,(cdr get-str)))
    (setq nw-tl (substring (format "%S" (cdr get-str)) 1 -1))
    (setq nw-tl (replace-regexp-in-string " ?\\([0-9]+ [0-9]+\\( (\\)\\)" ")(\\1" nw-tl t))
    (setq nw-tl (substring nw-tl 1))
    (setq nw-tl (concat "(" (substring nw-tl 1) ")"))
    (setq nw-tl (list (car (read-from-string nw-tl))))
    (setcdr get-str nw-tl)
    get-str))
;;
;;; :TEST-ME (let ((sfr (save-excursion (search-forward-regexp "(defun.*$"))))
;;;               (setq sfr `(,(match-beginning 0). ,(match-end 0)))
;;;               (mon-get-text-properties-region (car sfr) (cdr sfr)))

;;; ==============================
;;; :CREATED <Timestamp: #{2010-03-02T20:08:34-05:00Z}#{10093} - by MON KEY>
(defun mon-get-text-properties-print (start end tp-buff &optional intrp)
  "Return buffer-string START END with text-properties.\n
TP-BUFF is a buffer name to print to as with prin1.\n
When called-interactively insert at point. Moves point.
:SEE-ALSO `mon-get-text-properties-region', `mon-get-text-properties-print',
`mon-get-text-properties-read-temp', `mon-get-text-properties-elisp-string',
`mon-get-text-properties-elisp-string-pp',
`mon-get-text-properties-region-to-kill-ring'.\n►►►"
  (interactive "r\ni\np")
  (let* (mgtpfs-get
         (standard-output mgtpfs-get)
         mgtpfs)
    (setq mgtpfs (buffer-substring start end))
    (setq mgtpfs-get (prin1 mgtpfs mgtpfs-get))
    (if intrp 
        (prin1 mgtpfs-get (current-buffer))
        (prin1 mgtpfs-get tp-buff))))

;;; ==============================
;;; :CREATED <Timestamp: #{2010-03-02T20:08:44-05:00Z}#{10093} - by MON KEY>
(defun mon-get-text-properties-read-temp (&optional tp-buff)
  "Read list from `mon-get-text-properties-print' and strip leading #.\n
The car of return value is a new list formulated as with `read-from-string'.
The cdr is a list of index pairs and text-propery prop/val pairs e.g.:\n
 \(idx1 idx2 \(p1 p1-val p2 p2-val p3-val \(p3-lv1 p3-lv2 p3-lv3\)\)
  ;; { ... lots more here ... } 
  idx3 idx4 \(p1 p1-val p2 p2-val p3-val \(p3-lv1 p3-lv2 p3-lv3\)\)\)\n
When non-nil optional arg TP-BUFF names a buffer as required by
`mon-get-text-properties-elisp-string'.\n
:SEE-ALSO `mon-get-text-properties-region', `mon-get-text-properties-print',
`mon-get-text-properties-read-temp', `mon-get-text-properties-elisp-string',
`mon-get-text-properties-elisp-string-pp'.►►►"
  (let ((mgtprt-new 
         (if tp-buff tp-buff 
             (get-buffer-create "*MGTPRT-NEW*")))
        re-str 
        str-props)
    (with-current-buffer mgtprt-new
      (goto-char (buffer-end 0))
      (delete-char 1)
      (setq re-str (read-from-string (car (sexp-at-point))))
      (setq str-props (cdr (sexp-at-point)))
      (setq re-str `(,re-str ,str-props)))
    (unless tp-buff (kill-buffer mgtprt-new))
    re-str))

;;; ==============================
;;; :CREATED <Timestamp: #{2010-03-02T20:07:17-05:00Z}#{10093} - by MON KEY>
(defun mon-get-text-properties-elisp-string-pp (syn-list split-buff)
  "Pretty print the string and text property list extracted with
`mon-get-text-properties-elisp-string'.\n
:SEE-ALSO `mon-get-text-properties-region', `mon-get-text-properties-print',
`mon-get-text-properties-read-temp', `mon-get-text-properties-elisp-string'.\n►►►"
  (let* ((mgppespp-split (buffer-name split-buff))
         (mgppespp-buf2
          (concat 
           (substring mgppespp-split 0 (1- (length mgppespp-split))) "-STRING*")) 
         (mgppespp-syn-list
          (concat "(" 
                  (replace-regexp-in-string ") " ")) (" 
                                            (format "%S" (cadr syn-list)))
               ")"))
         chck-syn-list)
    (with-temp-buffer 
      (princ mgppespp-syn-list (current-buffer))
      (pp-buffer)
      (setq mgppespp-syn-list 
            (buffer-substring-no-properties (buffer-end 0) (buffer-end 1))))
    (with-current-buffer split-buff
      (erase-buffer)
      (save-excursion (princ mgppespp-syn-list (current-buffer)))
      (princ (format ";; :IN-BUFFER %s\n;;\n" mgppespp-buf2) (current-buffer))
      (emacs-lisp-mode))
    ;; (mon-get-all-face-property-change 'font-lock-constant-face (buffer-end 0))
    (get-buffer-create mgppespp-buf2)
    (with-current-buffer mgppespp-buf2
      (prin1 (caar syn-list) (current-buffer))
       (emacs-lisp-mode))
    (display-buffer split-buff t)
    (display-buffer mgppespp-buf2 t)))
    

;;; ==============================
;;; :CREATED <Timestamp: #{2010-03-02T20:07:24-05:00Z}#{10093} - by MON KEY>
(defun mon-get-text-properties-elisp-string (&optional some-el-string)
  "Extract the text properties from the elisp SOME-EL-STRING.\n
:EXAMPLE\n\n\(mon-get-text-properties-elisp-string
 \(documentation 'mon-help-mon-help\)\)\n
\(mon-get-text-properties-elisp-string *mon-help-reference-keys*\)\n
:SEE-ALSO `mon-get-text-properties-region', `mon-get-text-properties-print',
`mon-get-text-properties-read-temp', `mon-get-text-properties-elisp-string',
`mon-get-text-properties-elisp-string-pp'.\n►►►"
  (let ((mgtpfes-buf (get-buffer-create "*MGTPFES*"))
        mgtpes-buf2
        mgtpfes-rd)
    (unless (stringp some-el-string)
      (error 
       ":FUNCTION `mon-get-text-properties-elisp-string' - arg SOME-EL-STRING is not"))
    (with-current-buffer mgtpfes-buf (erase-buffer))
    (with-temp-buffer 
      (save-excursion (print some-el-string (current-buffer)))
    (emacs-lisp-mode)
    (font-lock-fontify-syntactically-region  (buffer-end 0) (buffer-end 1))
    (font-lock-fontify-buffer)
    ;; (current-buffer)
    (mon-get-text-properties-print (buffer-end 0) (buffer-end 1) mgtpfes-buf))
    ;; (substring mgtpfes-buf 0 (1- (length mgtpfes-buf))) "-STRING*"))
    (setq mgtpfes-rd (mon-get-text-properties-read-temp mgtpfes-buf))
    (mon-get-text-properties-elisp-string-pp mgtpfes-rd mgtpfes-buf)))
;;
;;; :TEST-ME (mon-get-text-properties-elisp-string *mon-help-reference-keys*)
;;; :TEST-ME (mon-get-text-properties-elisp-string (documentation 'mon-help-mon-help))

;;; ==============================
;;; :CREATED <Timestamp: #{2010-03-05T19:07:34-05:00Z}#{10096} - by MON KEY>
(defun mon-get-text-properties-parse-prop-val-type-chk (prop-val)
  "Check that PROP-VAL's type is suitable.\n
Return eq, eql, equal depending on type of PROP-VAL.\n
Signal an error if PROP-VAL is not of the type:\n
 string, integer, symbol, float, vector, or buffer\n
For use with:\n
 `mon-get-text-properties-parse-buffer'
 `mon-get-text-properties-parse-sym'
 `mon-get-text-properties-parse-buffer-or-sym'\n
:EXAMPLE\n
\(let \(\(bubba-type 
       `\(\"bubba\" bubba  8 8.8 [b u b b a] ,\(get-buffer \(current-buffer\)\)\)\)
      bubba-types\)
  \(dolist \(the-bubba bubba-type \(setq bubba-types \(nreverse bubba-types\)\)\)
    \(push `\(,the-bubba 
            . ,\(mon-get-text-properties-parse-prop-val-type-chk the-bubba\)\)
          bubba-types\)\)\)\n
:SEE-ALSO `mon-help-text-property-functions-ext',
`mon-help-text-property-functions', `mon-help-text-property-properties'.\n►►►"
  (typecase prop-val
    (string  'equal)           
    (integer 'eq)
    (symbol  'eq) 
    (float   'eql)
    (vector  'equal)
    (buffer  'eq)
    ;; cons can't happen '(a b c) 
    (t (error 
        (concat
         ":FUNCTION mon-get-text-properties-parse-sym"
         "- PROPS-IN-SYM not string, integer, float, vector, buffer, or symbol")))))
;;
;;; :TEST-ME 
;; (let ((bubba-type 
;;        `("bubba" bubba  8 8.8 [b u b b a] ,(get-buffer (current-buffer))))
;;       bubba-types)
;;   (dolist (the-bubba bubba-type (setq bubba-types (nreverse bubba-types)))
;;     (push `(,the-bubba 
;;             . ,(mon-get-text-properties-parse-prop-val-type-chk the-bubba))
;;           bubba-types)))

;;; ==============================
;;; (insert-buffer-substring "*MGTPFES*")
;;; :CREATED <Timestamp: #{2010-03-05T12:21:29-05:00Z}#{10095} - by MON KEY>
(defun mon-get-text-properties-parse-buffer (prop prop-val prop-buffer)
  "Filter the text-property list for sublists containing the text-property PROP
  and PROP-VAL.\n
PROP is a property to filter.
PROP-VAL is a property value of PROP to filter.
PROP-BUFFER names a buffer name from which to read from a list of sublists.
Sublists contain two index values and text-property plist of prop val pairs e.g.\n
 \(idx1 idx2 \(p1 p1-val p2 p2-val p3-val \(p3-lv1 p3-lv2 p3-lv3\)\)\)\n
:NOTE Reading begins from `point-min'. Reading does not move point.\n
:SEE `mon-get-text-properties-parse-buffer-or-sym' for usage example.
:SEE `mon-get-text-properties-parse-prop-val-type-chk' for PROP-VAL types.\n
:SEE-ALSO `mon-get-text-properties-region', `mon-get-text-properties-parse-sym',
`mon-get-text-properties-parse-buffer-or-sym', `mon-help-text-property-functions-ext',
`mon-help-text-property-functions', `mon-help-text-property-properties'.\n►►►"
  (unless (buffer-live-p (get-buffer prop-buffer))
    (error ":FUNCTION mon-get-text-properties-parse-buffer - PROP-BUFFER does not exist"))
  (let ((rd-prop-marker (make-marker))
        (prop-st-marker (make-marker))
        (comp-type 
         (mon-get-text-properties-parse-prop-val-type-chk prop-val))
        rd-prop-times i-red im-reding)
    (with-current-buffer  prop-buffer
      (set-marker prop-st-marker (point))
      (set-marker rd-prop-marker (buffer-end 0))
      (unwind-protect
           (progn
             (goto-char (marker-position rd-prop-marker))
             (cond ((> (skip-syntax-forward "^(") 0)
                    (set-marker rd-prop-marker (point)))
                   ((bobp)
                    (set-marker rd-prop-marker (point)))
                    ;; Anything else if prob. funky
                    (t (error ":FUNCTION mon-get-text-properties-parse-buffer - bounds of sexp unknown")))
             (if (eq (car (syntax-after (1+ (marker-position rd-prop-marker)))) 4)
                 (progn 
                   (setq rd-prop-times (length (sexp-at-point)))
                   (forward-char)
                   (set-marker rd-prop-marker (point)))
                 (error ":FUNCTION mon-get-text-properties-parse-buffer - bounds of sexp unknown"))
             ;;(marker-position rd-prop-marker)
             (dotimes (rd rd-prop-times (setq i-red (nreverse i-red)))
               (setq im-reding (read rd-prop-marker))
               (let* ((red-prop (plist-member (caddr im-reding) prop))
                      (red-prop-val (cadr red-prop)))
                 (when red-prop 
                   (cond ((consp red-prop-val)
                          (when (member prop-val red-prop-val)
                            (push im-reding i-red)))
                         ((and (not (null red-prop-val)) (atom red-prop-val))
                          (when (funcall comp-type prop-val red-prop-val)
                            (push im-reding i-red))))))))
        (goto-char prop-st-marker)))))
;;
;;; :TEST-ME (mon-get-text-properties-parse-buffer 'face 'font-lock-constant-face "*MGTPFES*")

;;; ==============================
;;; :CREATED <Timestamp: #{2010-03-05T14:10:07-05:00Z}#{10095} - by MON KEY>
(defun mon-get-text-properties-parse-sym (prop prop-val props-in-sym)
  "Filter the text-property list for sublists containing the text-property PROP and PROP-VAL.\n
PROP is a property to filter.
PROP-VAL is a property value of PROP to filter. 
It is one of the types:
 string, integer, symbol, float, vector, buffer
PROPS-IN-SYM is a symbol to parse.\n
Format of PROPS-IN-SYM are as per `mon-get-text-properties-parse-buffer-or-sym'.\n
:SEE `mon-get-text-properties-parse-buffer-or-sym' for usage example.
:SEE `mon-get-text-properties-parse-prop-val-type-chk' for PROP-VAL types.\n
:SEE-ALSO `mon-get-text-properties-region', `mon-get-text-properties-parse-buffer',
`mon-help-text-property-functions-ext', `mon-help-text-property-functions', 
`mon-help-text-property-properties'.\n►►►"
  (let ((comp-type 
         (mon-get-text-properties-parse-prop-val-type-chk prop-val))
        i-red)
    (mapc #'(lambda (im-reding)
              (let* ((red-prop (plist-member (caddr im-reding) prop))
                     (red-prop-val (cadr red-prop)))
                (when red-prop 
                  (cond ((consp red-prop-val)
                         (when (member prop-val red-prop-val)
                           (push im-reding i-red)))
                        ((and (not (null red-prop-val)) (atom red-prop-val))
                         (when (funcall comp-type prop-val red-prop-val)
                           (push im-reding i-red)))))))
          props-in-sym)
    (setq i-red (nreverse i-red))))
;;
;;; :TEST-ME 
;;; (let ((mgtppb (mon-get-text-properties-parse-buffer 'face 'font-lock-constant-face "*MGTPFES*")))
;;;   (mon-get-text-properties-parse-sym 'face 'font-lock-string-face mgtppb))

;;; ==============================
;;; :CREATED <Timestamp: #{2010-03-05T13:41:29-05:00Z}#{10095} - by MON KEY>
(defun* mon-get-text-properties-parse-buffer-or-sym (prop prop-val &key read-prop-sym read-prop-buffer)
  "Filter the text-property list for sublists containing the text-property PROP and PROP-VAL.\n
Return a two valued list. 
The car is a list of conses of only the indexes for each matching sublist.
The cadr is a list of each each matching sublist.
PROP is a property to filter.
PROP-VAL is a property value of PROP to filter.
Keyword READ-PROP-SYM names a symbol to parse.
Keyword READ-PROP-BUFFER names a buffer to read from.
When keyword READ-PROP-BUFFER is non-nil reading begins from `point-min' does
not move point.\n
Contents of READ-PROP-SYM or READ-PROP-BUFFER should hold a list with sublists.
Sublists contain two index values and text-property plist of prop val pairs e.g.\n
 \(idx1 idx2 \(p1 p1-val p2 p2-val p3-val \(p3-lv1 p3-lv2 p3-lv3\)\)\)\n
:EXAMPLE\n\n\(let \(\(mgtppbos-example
       '\(\(34 35   \(fontified t hard t rear-nonsticky t face some-face\)\)
         \(idx1 idx2 \(p1 p1-val p2 p2-val p3-val \(p3-lv1 p3-lv2 p3-lv3\)\)\)
         \(388 391 \(some-boolean-prop t face \(some-first-face second-face\)\)\)
         ;; { ... lots more here ... }
         \(3862 3884 \(face \(font-lock-constant-face second-face\)\)\)\)\)\)
  \(mon-get-text-properties-parse-buffer-or-sym 
   'face 'second-face :read-prop-sym mgtppbos-example\)\)\n
\(let \(\(mgtppbos-example
       '\(\(34 35     \(fontified t p2 p2-val rear-nonsticky t face some-face\)\)
         \(idx1 idx2 \(p1 p1-val p2 p2-val p3-val \(p3-lv1 p3-lv2 p3-lv3\)\)\)
         \(388 391   \(some-boolean-prop t face \(some-first-face second-face\)\)\)
         ;; { ... lots more here ... }
         \(3862 3884 \(face \(font-lock-constant-face second-face\)\)\)\)\)\)
  \(prin1 mgtppbos-example \(get-buffer-create \"*MGTPPBOS-EXAMPLE*\"\)\)
  \(setq mgtppbos-example
        \(mon-get-text-properties-parse-buffer-or-sym 
         'p2 'p2-val :read-prop-buffer \"*MGTPPBOS-EXAMPLE*\"\)\)
  \(kill-buffer \"*MGTPPBOS-EXAMPLE*\"\)
  mgtppbos-example\)\n
:SEE-ALSO `mon-get-text-properties-parse-sym', `mon-get-text-properties-parse-buffer',
`mon-get-text-properties-region', `mon-help-text-property-functions-ext',
`mon-help-text-property-functions', `mon-help-text-property-properties'.\n►►►"
  (let (mgtpbos)
    (cond (read-prop-sym
           (setq mgtpbos (mon-get-text-properties-parse-sym 
                          prop prop-val read-prop-sym)))
          (read-prop-buffer
           (setq mgtpbos (mon-get-text-properties-parse-buffer 
                          prop prop-val read-prop-buffer))))
    (setq mgtpbos `(,(mon-get-text-properties-map-ranges mgtpbos) ,mgtpbos))))
;;
;;; :TEST-ME (mon-get-text-properties-parse-buffer-or-sym 
;;;               'face 'font-lock-constant-face :read-prop-buffer "*MGTPFES*")
;;; :TEST-ME (let ((mgtppb 
;;;                    (mon-get-text-properties-parse-buffer 
;;;                     'face 'font-lock-constant-face "*MGTPFES*")))
;;;               (mon-get-text-properties-parse-buffer-or-sym 
;;;                'face 'font-lock-string-face :read-prop-sym mgtppb))


;;; ==============================
;;; :CREATED <Timestamp: #{2010-03-05T19:04:53-05:00Z}#{10096} - by MON KEY>
(defun mon-get-text-properties-map-ranges (text-prop-list)
  "Map the indexes at head of each sublist of TEXT-PROP-LIST to a consed list.
Return value is a list of sublists of the form:
 ( (idx1a idx1b) (idx2a idx2b) (idx3a idx3b) { ... } )\n
:EXAMPLE
:CALLED-BY `mon-get-text-properties-parse-buffer-or-sym'.\n
:SEE-ALSO `mon-help-text-property-functions-ext',
`mon-help-text-property-functions', `mon-help-text-property-properties'.\n►►►"
  (let (mgtpmmr)
    (setq mgtpmmr
          (mapcar #'(lambda (top) 
                      (let ((bt (butlast top 1)))
                        (setq bt `(,(car bt) . ,(cadr bt)))))
                  text-prop-list))))
;;
;; (let ((mgtppb
;;        (mon-get-text-properties-parse-buffer 'face 'font-lock-constant-face "*MGTPFES*")))
;;   (setq mgtppb
;;         (mon-get-text-properties-parse-sym 'face 'font-lock-string-face mgtppb))
;;   (setq mgtppb `(,(mon-get-text-properties-map-ranges mgtppb) ,mgtppb)))

;;; ==============================
;;; :CREATED <Timestamp: #{2010-03-05T20:16:13-05:00Z}#{10096} - by MON KEY>
(defun mon-get-text-properties-map-ranges-string (string-range-buffer range-buffer)
  "Map a range text-properties in buffer STRING-RANGE-BUFFER.\n 
Return value inserted in RANGE-BUFFER.\n
:EXAMPLE\n\n
:SEE-ALSO `mon-help-text-property-functions-ext',
`mon-help-text-property-functions', `mon-help-text-property-properties'.\n►►►"
(let (rr the-str str-range)
  (setq rr (with-current-buffer string-range-buffer ;;"*MGTPFES-STRING*"
             (mon-get-text-properties-region (buffer-end 0) (buffer-end 1))))
  (setq the-str (car rr))
  (setq rr (cadr rr))
  (setq rr (mon-get-text-properties-parse-buffer-or-sym 
            'face 'font-lock-constant-face :read-prop-sym rr))
  (setq rr (mapcar #'(lambda (idx-pair)
                       `(,idx-pair ,(substring the-str (car idx-pair) (cdr idx-pair))))
                   (car rr)))
  (princ rr (get-buffer range-buffer))))
;;(current-buffer)))

;;; ==============================
;;; :CREATED <Timestamp: #{2009-11-20T17:55:35-05:00Z}#{09475} - by MON>
(defun* mon-help-mon-tags (&key comment docs meta)
  "A list of MON's commonly used tags.\n
:EXAMPLE\n\n\(mon-help-mon-tags :docs t\)\n
\(mon-help-mon-tags :comment t\)\n
\(mon-help-mon-tags :meta t\)\n
\(mon-help-mon-tags\)\n
:SEE-ALSO `mon-help-insert-tags', `mon-help-propertize-tags',
`mon-help-propertize-tags-TEST', `*mon-help-mon-tags-alist*',
`*mon-help-reference-keywords*'.\n►►►"
  (let ((tag-type
         (cond (comment (assoc 'comment-tags *mon-help-mon-tags-alist*))
               (docs    (assoc 'docstr-tags *mon-help-mon-tags-alist*))
               (meta    (assoc 'meta-tags *mon-help-mon-tags-alist*))
               (t       (assoc 
                         (read (completing-read 
                                "Choose a key (tab completes): "
                                (mapcar #'(lambda (x) 
                                            (format "%s" (car x))) *mon-help-mon-tags-alist*)
                                nil t nil nil "docstr-tags"))
                         *mon-help-mon-tags-alist*)))))
    tag-type))
;;
;;; :TEST-ME (mon-help-mon-tags :docs t)
;;; :TEST-ME (mon-help-mon-tags :comment t)
;;; :TEST-ME (mon-help-mon-tags :meta t)
;;; :TEST-ME (mon-help-mon-tags)

;;; ==============================
;;; :TODO Factor out the read-only-ness checks below to a dedicated macro/defsubst.
;;; :MODIFICATIONS <Timestamp: #{2010-03-23T15:29:06-04:00Z}#{10122} - by MON KEY>
;;; :CREATED <Timestamp: #{2009-11-20T18:20:17-05:00Z}#{09475} - by MON>
(defun mon-help-insert-tags (&optional no-insrt intrp)
  "Insert a \"MON-TAG\" at point. Does not move point.\n
Prompt twice:\n
 i) Complete from a choice of tag-type:
    - comment-tags\n    - docstr-tags\n    - meta-tags\n
 ii) With selected tag-type complete from a choice of tags.\n
Use to keep scope of MON-TAG's as a loosely \"controlled-vocabulary\".
Choice of tag type completed with `mon-help-mon-tags'.\n
When optional arg NO-INSRT is non-nil do not insert tag when called interactively.\n
When current-buffer is in not `view-mode' or `help-mode' do not insert tag. 
When called interactively with NO-INSRT omitted and current-buffer is `buffer-read-only'
but not in not `view-mode' or `help-mode' insert tag with `inhibit-read-only' bound t.\n
:EXAMPLE\n(mon-help-insert-tags)\n
\(apply 'mon-help-insert-tags nil '\(t\)\)\n
:SEE-ALSO `mon-help-propertize-tags', `mon-help-propertize-tags-TEST',
`*mon-help-mon-tags-alist*'.\n►►►"
  (interactive "P\np")
  (let ((mhit (completing-read "Which tag :" (cadr (mon-help-mon-tags))))
        ;; :NOTE Verbose lambda forms below are here future adaptation to macro/defsubst:
        (mhit-prnc-here #'(lambda (mhit-prn &optional inhbt-rd-only) ;; (prn-val &optional inhbt-rd-only)
                            (if inhbt-rd-only
                                (let ((inhibit-read-only t))
                                  (save-excursion (princ mhit-prn (current-buffer))))
                                (save-excursion (princ mhit-prn (current-buffer))))))
        ;;; (mhit-wrtbl-p #'(lambda () (and (file-writable-p (buffer-file-name))
        ;;;                                 (file-exists-p   (buffer-file-name)))))
        (mhit-chk-mode #'(lambda (val &optional val-check)
                           (let ((chk-v (buffer-local-value val (current-buffer))))
                             (if val-check (eql chk-v val-check) chk-v)))))
    (if (or no-insrt (not intrp)
            (funcall mhit-chk-mode 'major-mode 'help-mode)
            (funcall mhit-chk-mode 'view-mode))
        (princ mhit)
        (with-current-buffer (current-buffer)
          (if (funcall mhit-chk-mode 'buffer-read-only)
              (funcall mhit-prnc-here mhit t)
              (funcall mhit-prnc-here mhit))))))
;;
;;; :TEST-ME (mon-help-insert-tags)
;;; :TEST-ME (apply 'mon-help-insert-tags nil '(t))

;;; ==============================
;;; :NOTE It is not entirely clear if the 'list arg is needed.
;;; :TESTING The 'list argument for LINE-REGION-OR-LIST as of:
;;; :CREATED <Timestamp: #{2010-01-26T21:18:01-05:00Z}#{10043} - by MON>
(defun mon-help-overlay-for-example (fun-lay fun-times line-region-or-list 
                                        &rest fun-lay-args)
  "Create an overlay for displaying results of evaluation :EXAMPLE forms.\n
FUN-LAY is a function to call.
FUN-TIMES is the number of times to evaluate FUN-LAY
LINE-REGION-OR-LIST is the type of arg FUN-LAY will evaluate
with the region between `►' and `◄'.\n
When type is a line or region the provide arg as the quoted symbol:\n
 'line or 'region\n
When type is a list the provide arg as the quoted list:\n '(some list)\n
When LINE-REGION-OR-LIST is line evaluate FUN-LAY with bounds of each successive line.
When LINE-REGION-OR-LIST is a list evaluate FUN-LAY searching successively for each elt of list.
When LINE-REGION-OR-LIST is region evaluate FUN-LAY with bound of entire region.
:EXAMPLE
\(mon-help-overlay-for-example 'mon-line-number-region-incr nil 'region\)\n
►\n1Firstname Lastname\n2Firstname Firstname\n3Firstname Lastname\n◄\n
:EXAMPLE
\(mon-help-overlay-for-example 'mon-make-lastname-firstname 3 'line\)\n
►\nFirstname1 Lastname1\nFirstname2 Firstname2\nFirstname3 Lastname3\n◄\n\n
:NOTE when FUN-LAY-ARGS is an init-value from which FUN-LAY steps. It won't.\n
:FACE-FONT-LOCKING-WITH `mon-help-OLAY-RESULT-string-show'
:FACE-FONT-LOCKING-WITH `mon-help-OLAY-RESULT-match-show'\n
:SEE-ALSO `mon-help-overlay-result', `mon-help-find-result-for-overlay',
`mon-help-overlay-on-region', `mon-help-OLAY-RESULT', `mon-help-overlay-functions',
`mon-nuke-overlay-buffer', `momentary-string-display'.\n►►►"
  (let* ((lrol (cond ((eq line-region-or-list 'line)  'li)
                     ((consp line-region-or-list)  'ls)
                     ((eq line-region-or-list 'region)'re)))
         (mhor-lst   (if (consp line-region-or-list) line-region-or-list))
         (mhor-start (save-excursion (1+ (funcall 'search-forward-regexp "^►$"  nil t))))
         (mhor-end   (save-excursion 
                       ;; The (1- { ... })puts point before `◄' i.e.:
                       ;; some-thing
                       ;; !◄
                       ;; (1- (funcall 'search-forward-regexp "^◄$" nil t)))) 
                       ;; The (- { ... } 2) Puts point at end prevous line from ◄ i.e.:
                       ;; some-thing!
                       ;; ◄
                       (- (funcall 'search-forward-regexp "^◄$" nil t) 2)))
         (mhor-botp  (cond ((eq lrol 'li) 
                            #'(lambda () `(,(line-beginning-position) . ,(line-end-position))))
                           ((eq lrol 'ls) 
                            #'(lambda (l)
                                (prog1 
                                    (progn 
                                      (search-forward-regexp l mhor-end t)
                                      `(,(match-beginning 0) . ,(match-end 0)))
                                  (if (match-beginning 0)
                                      (goto-char (match-beginning 0))))))
                           ((eq lrol 're) #'(lambda () (cons mhor-start mhor-end)))))
         (mhor-mhor #'(lambda (bd shw)
                        ;;        (if (and shw (> (length shw) (- (cdr bd) (car bd))))
                        ;;        (let ((new-bd (+ (- (length shw) (- (cdr bd) (car bd))) (cdr bd))))                        
                        (mon-help-overlay-result
                         (or (car bd) (+ mhor-start 0)) 
                         (or (cdr bd) (+ mhor-end 0)) 78 shw))))
    (save-excursion 
      (goto-char mhor-start)
      (dotimes (i (cond ((eq lrol 'li) fun-times)
                        ((eq lrol 'ls) (length mhor-lst))
                        ((eq lrol 're) 1)))
        (let* ((mhor-lst-pop mhor-lst)
               (mhor-bdN (cond ((or (eq lrol 'li)
                                    (eq lrol 're))
                                (funcall mhor-botp))
                               ((eq lrol 'ls) 
                                (funcall mhor-botp (cond ((stringp (car mhor-lst-pop))
                                                          (car mhor-lst))
                                                         (t (format "%s" (car mhor-lst)))))))))
          (funcall mhor-mhor mhor-bdN
                   (cond ((or (eq lrol 'li) (eq lrol 're))
                          (funcall #'(lambda ()
                                       (eval `(,fun-lay ,(car mhor-bdN) ,(cdr mhor-bdN) ,@fun-lay-args)))))
                         (t (unless (null (car mhor-lst-pop))
                              (funcall #'(lambda ()
                                           (eval `(,fun-lay ,(pop mhor-lst-pop) ,@fun-lay-args))))))))
                   (when (eq lrol 'li) (line-move-1 1)))))))

;;; ==============================
;;; :NOTE When arg NO-DROP-NL is non-nil newlines can be removed with:
;;; (mon-replace-char-in-string 10 (match-string-no-properties 1))
;;; (mon-replace-char-in-string 10 (match-string-no-properties 5))
;;; :CREATED <Timestamp: #{2010-02-15T14:19:57-05:00Z}#{10071} - by MON KEY>
(defun mon-help-delimited-region (&optional no-mv-point no-drop-nl)
  "Match region delimited by `►' and `◄' return list of match details.\n
When optional arg NO-MV-POINT is non-nil does not move point.\n
When optional arg NO-DROP-NL is ommitted return value has the form:\n
\(\(\(1 . \"►\"\) \(match-beg-1 . match-end-1\)\)
 \(\(2 . \"MATCH2-LINE0\nMATCH2-LINE1
MATCH2-LINE2\nMATCH2-LINE3\"\) \(match-beg-2 . match-end-2\)\)
 \(\(5 . \"◄\"\) \(match-beg-5 . match-end-5\)\)\n
When optional arg NO-DROP-NL is non-nil return value has the form:\n
\(\(\(1 . \"►\n\"\) \(match-beg-1 . match-end-1\)\)
 \(\(2 . \"MATCH2-LINE0\nMATCH2-LINE1
MATCH2-LINE2\nMATCH2-LINE3\"\) \(match-beg-2 . match-end-2\)\)
 \(\(5 . \"\n◄\"\) \(match-beg-5 . match-end-5\)\)\n
:EXAMPLE\n
;; Does not move point.
\(mon-help-delimited-region t\)\n
;; Does not move point. Does not drop newlines.
\(mon-help-delimited-region t t\)\n
;; Show match-groups & matches, Does drop newlines.
\(mapcar #'car \(mon-help-delimited-region t\)\)\n
;; Show conses for match-beginnings & match-ends.
\(mapcar #'cadr \(mon-help-delimited-region t\)\)\n
;; Return only bounds of match-group 2, e.g. the 'inner-region' between delims.
\(cadr \(nth 1 \(mon-help-delimited-region t\)\)\)\n
;; Does move point. Does not drop newlines.
\(mon-help-delimited-region nil t\)\n
►\nMATCH2-LINE0\nMATCH2-LINE1\nMATCH2-LINE2\nMATCH2-LINE3\n◄\n
:ALIASED-BY `mon-line-strings-region-delimited'
:ALIASED-BY `mon-line-strings-get-delimited-region'\n
:SEE-ALSO `mon-help-overlay-result', `mon-help-find-result-for-overlay',
`mon-help-overlay-on-region', `mon-help-overlay-for-example',
`mon-help-overlay-functions'.\n►►►"
  (let ((mhdr #'(lambda ()
                  (search-forward-regexp 
                   (if no-drop-nl  
                       "^\\(►\n\\)\\(\\(.*\n\\)+\\(.*\\)\\)\\(\n◄\\)"
                       ;;^^1^^^^^^^^2^^3^^^^^^^^^^4^^^^^^^^^^5^^^^^^
                       ;; :NOTE no-drop-nl couples leading and trailing `\n' (char 10)
                       ;;  with delimiter.
                       ;; grp1 -> ►\n  
                       ;; grp2 { ... junk-in-middle ... }
                       ;; grp5 -> \n◄
                       "^\\(►\\)\n\\(\\(.*\n\\)+\\(.*\\)\\)\n\\(◄\\)"
                       ;;^^1^^^^^^^^2^^3^^^^^^^^^^4^^^^^^^^^^^^5^^^^
                       ;; grp1 -> ►  ; drops trailing \n
                       ;; grp2 { ... junk-in-middle ... } 
                       ;; grp5 -> ◄ ; drops leading \n
                       ) nil t)
                  `(((1 . ,(match-string-no-properties 1)) (,(match-beginning 1) . ,(match-end 1)))
                    ((2 . ,(match-string-no-properties 2)) (,(match-beginning 2) . ,(match-end 2)))
                    ((5 . ,(match-string-no-properties 5)) (,(match-beginning 5) . ,(match-end 5)))))))
    (cond (no-mv-point (save-excursion (funcall mhdr)))
          (t (funcall mhdr)))))
;;
(defalias 'mon-line-strings-region-delimited 'mon-help-delimited-region)
(defalias 'mon-line-strings-get-delimited-region 'mon-help-delimited-region)
;;
;;,---- :UNCOMMENT-BELOW-TO-TEST
;;| (mon-help-delimited-region t t)
;;| (mon-help-delimited-region nil t)
;;| (mon-help-delimited-region t)
;;| (mon-help-delimited-region)
;;|
;;|►
;;|MATCH2-LINE0
;;|MATCH2-LINE1
;;|MATCH2-LINE2
;;|MATCH2-LINE3
;;|◄
;;`----

;;; ==============================
;;; :TODO add optional arg OSTRING-FROM-FUNC which:
;;; When optional arg OSTRING-FROM-FUNC is non-nil value of OSTRING is acquired with
;;; a function which accepts the bounds of a region as its first (and only two)
;;; required arguments, i.e. where START and END are the required args to somefunc:
;;;  (somefunc START END)\n
;;; :NOTE wrote `mon-help-delimited-region' for this, not incorporated yet.
;;; :CREATED <Timestamp: #{2010-02-09T11:57:07-05:00Z}#{10062} - by MON KEY>
(defun mon-help-overlay-on-region (ostring) ;&optional ostring-from-func)
  "Display an overlay for region containing OSTRING delimited by `►' and `◄'.
Display for 2 seconds then remove overlay.\n
Overlay displayed with the face `minibuffer-prompt'.\n
:EXAMPLE\n\n(mon-help-overlay-on-region \"Some string\")\n
►\nSome string\n◄\n
\(mon-help-overlay-on-region \"Some string\"\)\n
►Some string◄\n
:FACE-FONT-LOCKING-WITH `minibuffer-prompt'\n
:SEE-ALSO `mon-help-overlay-result', `mon-help-overlay-for-example',
`mon-nuke-overlay-buffer', `mon-help-find-result-for-overlay',
`mon-help-overlay-functions'.\n►►►"
  (unwind-protect
       (let* ((sb (save-excursion 
                    (search-forward-regexp (concat "^►\n?.*" ostring ".*\n?◄$")  nil t)))
              (mhoor-olay (make-overlay (match-beginning 0) (match-end 0) (current-buffer) t t )))
         (overlay-put mhoor-olay 'face 'minibuffer-prompt)
         (sit-for 2))
    (remove-overlays (buffer-end 0) (buffer-end 1) 'face 'minibuffer-prompt)))

;;; ==============================
;;; :MODIFICATIONS <Timestamp: #{2010-01-12T12:36:15-05:00Z}#{10022} - by MON>
;;; :CREATED <Timestamp: #{2010-01-08T23:28:40-05:00Z}#{10015} - by MON>
(defun mon-help-overlay-result (show-here to-here exit-c &optional show-str) ;for-secs 
  "Return overlay from SHOW-HERE TO-HERE and remove it with exit char EXIT-C.\n
SHOW-HERE is the starting point in buffer to place overlay.\n
TO-HERE is the starting point in buffer to place overlay.\n
EXIT-C is the character corresponding the the keyboard key user must type
to exit from the overlay display.
When optional arg SHOW-STR \(a string) is non-nil display it but with a with
less vibrant overlay.\n
When function is invoked place the overlay and message user to:\n
 \"Type `<EXIT-CHAR>' to continue ... or C-g to exit\"\n
:EXAMPLE\n\n\(save-excursion \(forward-sexp 2\)
  \(let \(\(lbp #'\(lambda \(\) `\(,\(line-beginning-position\) . ,\(line-end-position\)\)\)\)
        \(olbp #'\(lambda \(bd\) \(mon-help-overlay-result \(car bd\) \(cdr bd\) 78\)\)\)\)
    \(dotimes \(i 2\)
      \(funcall olbp \(funcall lbp\)\)\(line-move-1 -1\)\)\)\)\n
\( ... LOTSA-JUNK-FOR-AN-OVERLAY ... \)\n\( ...  MORE-JUNK-FOR-AN-OVERLAY ... \)\n
:NOTE This functionality is modeled after `momentary-string-display' but with less
bounds error checking and restricts exiting from the loop until user provides
EXIT-CHAR or enters \7.\n
:CALLED-BY `mon-help-find-result-for-overlay'.\n
:FACE-FONT-LOCKING-WITH `mon-help-OLAY-RESULT-string-show'
:FACE-FONT-LOCKING-WITH `mon-help-OLAY-RESULT-match-show'\n
:SEE-ALSO `mon-help-overlay-for-example', `mon-help-overlay-on-region',
`mon-help-OLAY-RESULT', `mon-nuke-overlay-buffer', `mon-help-overlay-functions'.\n►►►"
  (let ((showlay (make-overlay show-here to-here nil t t))
        (max-mini-window-height 1))
    (unwind-protect
         (save-excursion 
           (if show-str
               (progn
                 (overlay-put showlay 'display show-str)
                 (overlay-put showlay 'face 'mon-help-OLAY-RESULT-string-show))
               (overlay-put showlay 'face 'mon-help-OLAY-RESULT-match-show))
           (goto-char show-here)
           (setq show-here (point))
           (recenter)
           (overlay-recenter show-here)
           (let (got-N)
             (while (not got-N)
               (when (eq (read-event 
                          (format "Type `%c' to continue ... or %s to exit" exit-c (key-description [7])))
                         exit-c)
                 (setq got-N t)))))
      (delete-overlay showlay))))
;;
;;,---- :UNCOMMENT-BELOW-TO-TEST
;;| (let ((botp #'(lambda () `(,(line-beginning-position) . ,(line-end-position))))
;;|        (mhor #'(lambda (bd) (mon-help-overlay-result (car bd) (cdr bd) 78))))
;;|   (save-excursion (forward-sexp 2)
;;|               (dotimes (i 2) (funcall mhor (funcall botp))(line-move-1 -1))))
;;| 
;;| 
;;|( ... LOTSA-JUNK-FOR-AN-OVERLAY... )
;;|( .... MORE-JUNK-FOR-AN-OVERLAY... )
;;`----

;;; ==============================
;;; :CREATED <Timestamp: #{2010-01-09T00:07:02-05:00Z}#{10016} - by MON>
(defun mon-help-find-result-for-overlay (search-it match-b match-e exit-char)
  "Find regexp SEARCH-IT placing overlay on the match from MATCH-B to MATCH-E.\n
SEARCH-IT is a regexp string to search.\n
MATCH-B is the match group for `match-beginning'\n
MATCH-E is the match group for `match-end'\n
EXIT-CHAR is the character corresponding the the keyboard key user must type to
exit from the overlay display.\n
:NOTE Looping procedures which invoke this function won't advance until kbd
input matching EXIT-CHAR is recieved or user enters \7 -- this is a feature!.\n
Useful for examining the result of a procedure inside a *HELP* buffer,
particulary anything that changes or alters text in a buffer i.e. regexp
oriented utilities.\n
:EXAMPLE\n\(save-excursion
  \(dotimes \(i 22\)
    \(mon-help-find-result-for-overlay 
     *regexp-mon-doc-help-pointer-tags* 0 0 78\)\)\)\n
Matches the following:
 ->   ;->  ; -> \n =>   ;=>  ; => \n -->  ;-->  ; --> --->\n <--  <--  ; <--  <---
 <--  ;<-- ; <--  <--- \n ==>  ;==> ; ==>  ===>\n
:FACE-FONT-LOCKING-WITH `mon-help-OLAY-RESULT-string-show'
:FACE-FONT-LOCKING-WITH `mon-help-OLAY-RESULT-match-show'\n
:SEE-ALSO `mon-help-overlay-for-example', `mon-help-overlay-result',
`mon-help-OLAY-RESULT', `mon-help-overlay-functions', 
`mon-nuke-overlay-buffer', `momentary-string-display'.\n►►►"
  (progn
    (search-forward-regexp search-it nil t)
    (let ((mb (match-beginning (or match-b 0)))
           (me  (match-end (or match-e 0))))
      (mon-help-overlay-result mb me exit-char))))
;;
;;; :TEST-ME 
;;; (save-excursion
;;;   (dotimes (i 22)
;;;     (mon-help-find-result-for-overlay *regexp-mon-doc-help-pointer-tags* 0 0 78)))
;;
;;,---- :MATCHES
;;| 
;;|  ->   ;->  ; -> 
;;|  =>   ;=>  ; => 
;;|  -->  ;-->  ; --> --->
;;|  <--  <--  ; <--  <---
;;|  <--  ;<-- ; <--  <--- 
;;|  ==>  ;==> ; ==>  ===>
;;`----

;;; ==============================
;;; :TODO Verify the logic on the arg KILL-EM-BEFORE-THEY-GROW no clear that its
;;;        doing anything or working correctly.
;;; :NOTE See the hidden fnctn: `make-help-screen'.
;;; :MODIFICATIONS <Timestamp: #{2010-02-03T15:16:13-05:00Z}#{10053} - by MON>
;;; :CREATED <Timestamp: #{2009-12-20T17:50:49-05:00Z}#{09517} - by MON>
(defun mon-help-temp-docstring-display (the-help-doc &optional some-other-buffer
                                        kill-em-before-they-grow)
  "Display THE-HELP-DOC string formatted as per help-mode.
Leave existing *Help* buffer untouched.\n
Docstring is displayed in the buffer named by the the value of 
:VARIABLE `*mon-help-docstring-help-bffr*'.\n
When optional arg SOME-OTHER-BUFFER is non-nil display THE-HELP-DOC in that
buffer instead.\n
When optional arg KILL-EM-BEFORE-THEY-GROW is non-nil kill any existing
SOME-OTHER-BUFFER with name before displaying contents there.\n
:EXAMPLE\n\(mon-help-temp-docstring-display
 \(documentation 'mon-help-temp-docstring-display\)\)\n 
\(mon-help-temp-docstring-display 
 \(documentation 'mon-help-temp-docstring-display\)
 \(buffer-name \(get-buffer-create \"*BUBBA-TEST*\"\)\)\)\n
:CALLED-BY `google-define' \(MON's VERSION\)\n
:SEE `make-help-screen' \(hidden function\), `advertised-signature-table', etc. \n
:SEE-ALSO `mon-help-view-file'.\n►►►"
  (let ((help-window-select 'always)
        (dhb (buffer-name 
              (if some-other-buffer
                 ;; :NOTE Going into view-mode don't know whats there or how it got there. 
                 ;;;      Don't try to erase the contents - Kill them. 
                  (if (and kill-em-before-they-grow
                           (buffer-live-p (get-buffer some-other-buffer)))
                      (progn 
                        (kill-buffer (get-buffer some-other-buffer))
                        (get-buffer-create some-other-buffer))
                      (get-buffer-create some-other-buffer))
                 ;; *mon-help-docstring-help-bffr* -> "*MON-HELP*"
                  (get-buffer-create *mon-help-docstring-help-bffr*)))))
    ;; `help-xref-following'
    ;; `help-buffer' 
    ;; (let ((help-xref-following t))
    ;; (buffer-name				;for with-output-to-temp-buffer
    ;;  (if help-xref-following
    ;;      (current-buffer)
    ;;      (get-buffer-create "*Help*")))
    (with-help-window dhb 
      (with-current-buffer dhb
        (insert the-help-doc)
        (help-window-setup-finish (selected-window) ))))) ;;t t)))))
;;
;;; :TEST-ME (mon-help-temp-docstring-display (documentation 'mon-help-temp-docstring-display))
;;; :TEST-ME (mon-help-temp-docstring-display 
;;;            (documentation 'mon-help-temp-docstring-display)
;;;            (buffer-name (get-buffer-create "*BUBBA-TEST*")))

;;; ==============================
;;; :NOTE this is here mostly so I don't forget it.
;;; :COURTESY Thinkig Machines Corp. :HIS help-hacks.el :WAS `help-tmc-hacks'
;;; :SEE (URL `ftp://ftp.sra.co.jp/pub/lang/lisp/misc/gmacs/gmacs/')
;;; :CREATED <Timestamp: #{2009-12-31T13:12:41-05:00Z}#{09534} - by MON KEY>
(defun mon-help-get-mon-help-buffer (d-string) ;; :WAS ()
"Display D-STRING in view-mode with buffer named by:
:VARIABLE `*mon-help-docstring-help-bffr*'\n
:SEE-ALSO `mon-help-temp-docstring-display', `mon-help-view-file'.\n►►►"
  (interactive)
  (let ((current-buffer (current-buffer)))
    (switch-to-buffer 
     (get-buffer-create *mon-help-docstring-help-bffr*)) ;; :WAS "*Help TMC Hacks*"))
    (delete-region (point-min) (point-max))
    (insert d-string) ;; :WAS (insert *hacks-help-string*)
    (goto-char (point-min))
    (view-mode current-buffer)))
;;
;;; :TEST-ME (mon-help-get-mon-help-buffer "Some Test String")

;;; ==============================
;;; :CREATED <Timestamp: #{2009-12-20T20:34:49-05:00Z}#{09517} - by MON>
(defun mon-help-view-file (file &optional dir)
  "View the FILE as like `view-help-file'.\n
When DIR is non-nil it is a directory name in which to look for file.
Unlike `view-help-file' DIR's default is default-dirctory not `data-directory'.
Signal an error if file does not exist or is unreadable.\n
:SEE-ALSO `mon-help-temp-docstring-display',`*mon-help-docstring-help-bffr*',
`goto-address-mode'.\n►►►"
  (interactive "fWhich file: ")
  (let ((orig-data-directory data-directory))
    (unwind-protect 
         (let ((data-directory (if dir
                                   (directory-file-name dir)
                                   (directory-file-name (file-name-directory default-directory)))))
           (cond (dir (if (file-readable-p (concat data-directory "/" file))
                          (setq data-directory `(,file . ,data-directory))
                          (error "The file %s is unreadable or doesn't exist" file)))
                 (t (setq data-directory `(,file . ,data-directory))))
           (view-help-file (car data-directory) (cdr data-directory)))
      (setq data-directory orig-data-directory))))
;;
;;; :TEST-ME (mon-help-view-file ".bashrc" "~/")
;;; :TEST-ME (mon-help-view-file ".bashrc" "/root")
;;; :TEST-ME (apply 'mon-help-view-file '(t))

;;; ==============================
;; :TAGS-TABLES

;;; ==============================
;;; :CREATED <Timestamp: #{2009-08-21T19:02:12-04:00Z}#{09345} - by MON>
(defvar *mon-tags-table-list*
  (if (bound-and-true-p IS-MON-SYSTEM-P)
      `(,*mon-emacs-root* ,*mon-naf-mode-root* ,*mon-ebay-tmplt-mode-root* ,*mon-site-lisp-root*))
  "*List of path for setting `tags-table-list'.
Look for TAGS files in directories specified by return values of:
 `*mon-emacs-root*', `*mon-site-lisp-root*'
 `*mon-naf-mode-root*', `*mon-ebay-tmplt-mode-root*'\n
:SEE-ALSO `mon-tags-apropos', `mon-tags-naf-apropos', `mon-update-tags-tables'.\n►►►")
;;
;;; :TEST-ME *mon-tags-table-list* 
;;
;;;(progn (makunbound '*mon-tags-table-list*) (unintern '*mon-tags-table-list*) )

;;; ==============================
;;; :CREATED <Timestamp: #{2009-08-21T19:27:44-04:00Z}#{09345} - by MON>
(defun mon-update-tags-tables ()
  "Update the 'TAGS' files in paths held by `*mon-tags-table-list*'\n
:NOTE When IS-MON-SYSTEM-P evaluated at startup per `mon-run-post-load-hooks'.\n
:SEE-ALSO `mon-tags-apropos',`mon-tags-naf-apropos', `*mon-tags-table-list*'.\n►►►"
  (interactive)
  (progn
    (shell-command (concat "etags " 
                           (nth 3 *mon-tags-table-list*)"/*.el " 
                           "--output=" (nth 3 *mon-tags-table-list*)"/TAGS"))
    (shell-command (concat  "etags " 
                            (nth 2 *mon-tags-table-list*)"/*.el "
                            "--output="(nth 2 *mon-tags-table-list*)"/TAGS "))
    (shell-command (concat "etags " 
                           (nth 1 *mon-tags-table-list*)"/*.el " 
                           "--include="(nth 2 *mon-tags-table-list*)"/TAGS " 
                           "--output=" (nth 1 *mon-tags-table-list*)"/TAGS"))
    (shell-command (concat  "etags " 
                            (nth 0 *mon-tags-table-list*)"/*.el " 
                            "--include="(nth 3 *mon-tags-table-list*)"/TAGS "
                            "--include="(nth 1 *mon-tags-table-list*)"/TAGS "
                            "--output=" (nth 0 *mon-tags-table-list*)"/TAGS"))
    t))
;;
;;; :TEST-ME (mon-update-tags-tables)
;;; :TEST-ME (call-interactively 'mon-update-tags-tables)

;;; ==============================
;;; :CREATED <Timestamp: #{2009-08-21T19:00:14-04:00Z}#{09345} - by MON KEY>
(defun mon-tags-naf-apropos ()
  "Search tags-tables in for occurences of regexp \"*naf-\" with `tags-apropos'.\n
:SEE-ALSO `mon-tags-apropos', `*mon-tags-table-list*', `mon-update-tags-tables'.
►►►"
  (interactive)
  (tags-apropos "*naf-"))

;;; ==============================
;;; :CREATED <Timestamp: #{2009-08-21T18:57:08-04:00Z}#{09345} - by MON KEY>
(defun mon-tags-apropos ()
  "Search tags-tables in for occurences of regexp \"*mon-\" with `tags-apropos'.\n
:SEE-ALSO `mon-tags-naf-apropos', `*mon-tags-table-list*', 
`mon-update-tags-tables'.\n►►►"
  (interactive)
  (tags-apropos "*mon-"))

;;; ==============================
(defun mon-insert-doc-help-cookie ()
  "Insert default 'documentation cookie' at point.
Everything up to `*doc-cookie*' is commented out when inserted into a buffer.
Default value for cookie is: \"\u25BA\u25BA\u25BA\".\n
:EXAMPLE\n\n\(momentary-string-display 
 \(concat \" Default doc-cookie to insert -> \"
         \(do* \(\(i ?\\u25BA\)
       \(j 0 \(1+ j\)\)
       \(ck \"\" \(concat \(char-to-string i\) ck\)\)\)
     \(\(= j 3\) ck\)\)\) \(point\)\)\n
:NOTE If default value is not acceptable set value of `*doc-cookie*' variable
otherwise.\n
:CALLED-BY `mon-help-function-spit-doc'\n
:SEE-ALSO `mon-insert-ebay-field-trigger-l-and-r',
`mon-insert-ebay-field-trigger-l', `mon-insert-ebay-field-trigger-r'.\n►►►"
  (interactive)
  (insert "►►►"))
;;
;;; :TEST-ME (mon-insert-doc-help-cookie)
;;; :TEST-ME (apply 'mon-insert-doc-help-cookie '(t))

;;; ==============================
;;; :TODO Consider where `documentation-property' can be used instead of `plist-get'.
;;; :NOTE Also take a look at `lisp-doc-string-elt-property'.
;;; :NOTE This idiom works for byte compiling in docstrings.
;;; (eval-and-compile
;;;  (<THE-DEFVAR>))
;;
;;; (eval-when (compile eval)
;;;  (mon-help-put-var-doc-val->func <THE-DEFVAR> <THE-FUNC>))
;;; :CREATED <Timestamp: #{2009-10-01T18:57:13-04:00Z}#{09404} - by MON KEY>
(defmacro mon-help-put-var-doc-val->func (var-name func-name &optional 
                                          pre-v-str cut-v-str pst-v-str)
  "VAR-NAME is a variable whose value and docstring will be put on FUNC-NAME.
CUT-V-STR is a string on which to split the variable documentation of VAR-NAME.
When non-nil cut-v-str is removed from variables documentation with substring up
to CUT-V-STR at head of docstring, var-name's value is inserted, followed by the
substring occuring after CUT-V-STR. The substring CUT-V-STR is not placed on
func-name's documentation-property.\n
When non-nil PRE-V-STR is a string to insert before value string of var-name.\n
When non-nil PST-V-STR is a string to insert after value string of var-name.\n
:EXAMPLE\n
\(mon-help-put-var-doc-val->func '<VAR-NAME> '<FUNC-NAME>
  \"\\nThis is a PRE-V-STR\\n\"
  \"content of CUT-V-STR removed\"
  \"\\nThis ia PST-V-STR\\n\"\)\n\n
\(mon-help-put-var-doc-val->func '<VAR-NAME> '<FUNC-NAME>
  nil \"content of CUT-V-STR removed\" nil\)\n\n
\(mon-help-put-var-doc-val->func '<VAR-NAME> '<FUNC-NAME>
\"\\nPRE-V-STR\\n\" nil \"PST-V-STR\"\)\n
:SEE-ALSO `mon-help-swap-var-doc-const-val', `help-add-fundoc-usage'.\n►►►"
  (declare (indent 2) (debug t))
  (let ((putf-doc (make-symbol "putf-doc"))
        (getv-doc (make-symbol "getv-doc"))
        (getv-val (make-symbol "getv-val")))
    `(let ((,getv-val (symbol-value ,var-name))
           (,getv-doc (if ,cut-v-str
                          `(,(mon-string-upto-index
                              (plist-get (symbol-plist ,var-name) 'variable-documentation)
                              ,cut-v-str)
                             ,(mon-string-after-index
                               (plist-get (symbol-plist ,var-name) 'variable-documentation)
                               ,cut-v-str))
                          (plist-get (symbol-plist ,var-name) 'variable-documentation)))
           (,putf-doc))
       (when (listp ,getv-val)
         (setq ,getv-val
               (with-temp-buffer
                 (insert-char 32 1)
                 (save-excursion (pp ,getv-val (current-buffer)))
                 (indent-pp-sexp)
                 (buffer-substring-no-properties (buffer-end 0) (buffer-end 1)))))
       (setq ,putf-doc
             (if (stringp ,getv-doc)
                 (concat ,getv-doc ,pre-v-str ,getv-val ,pst-v-str)
                 (concat (car ,getv-doc) ,pre-v-str ,getv-val ,pst-v-str (cadr ,getv-doc))))
       (put ,func-name 'function-documentation ,putf-doc))))

;;; ==============================
;;; :NOTE When compiling, defvar and defconst forms must be made known at
;;;       compile time.  Wrap them _and_ the macro call in an
;;;       `eval-when-compile' and make sure that: 
;;;       (eval-when-compile (require 'cl)) is at top of file. 
;;;       Otherwise, all of the args docstrings get doubled up at compile time.
;;;
;;; :MODIFICATIONS <Timestamp: #{2010-01-23T15:52:18-05:00Z}#{10036} - by MON KEY>
;;; :MODIFICATIONS <Timestamp: #{2009-10-03T14:31:54-04:00Z}#{09406} - by MON KEY>
;;; :CREATED <Timestamp: #{2009-09-14T14:16:34-04:00Z}#{09381} - by MON KEY>
(defmacro mon-help-swap-var-doc-const-val (var-name const-name xrefs &optional face-name)
  "Swap the value of VAR-NAME's variable-documentation property onto
  CONST-NAME's variable-documentation property.\n
Put the symbol value of CONST-NAME on VAR-NAME's variable-documentation property.\n
Put the symbol value of VAR-NAME on CONST-NAME's variable-documentation property.\n
Put XREFS of packages related variables on VAR-NAME and CONST-NAME's
variable-documentation property. XREF's is  a symbol holding a list of related
symbol names which should have cross-reference to one another in documentation.
FACE-NAME is variable pointing bound to the symbol holding a face definintion.\n
For example, in `naf-mode' the variable `naf-mode-institution-fface' is bound to
the face `naf-mode-institution-face'. This is because face documentation isn't
accessible as a variable in *Help* buffers i.e. using \[`describe-variable'].\n
:EXAMPLE
\(mon-help-swap-var-doc-const-val
    *naf-school-names-english* naf-mode-school-names-english
    ;;^ VAR-NAME ^             ^ CONST-NAME ^
    *naf-mode-institution-xrefs* naf-mode-institution-fface)
    ;;^ XREF ^                   ^ FACE-NAME ^\n
:NOTE When compiling defvar and defconst forms mut be made known at compile time.
Wrap them _and_ the macro call in an `eval-when-compile' and make sure that
\(eval-when-compile \(require 'cl\)\) is at top of file. Otherwise, all of the
args docstrings get doubled up at compile time.\n
This procedure is implemented as a means of extending *Help* documentation of
`naf-mode' constants, variables, and faces. It is provided because naf-mode's
core mechanism of keyword lookup and identification occurs via font-locking and
`font-lock-extra-managed-props' manipulation of plists and text-properties.
Currently we leverage these facilities with the simple inheritance provided by
Emacs faces. In the future, as Emacs face implementation begins taking advantage
of CEDET and EIEIO class properties, `naf-mode' will use it's existing faces as a
gateway towards OO manipulation of text.  As such, this macro might be used to
similiar functionality to any derived mode which generates font-lock keywords
from lists bound variables.\n
:SEE-ALSO `mon-help-put-var-doc-val->func', `help-add-fundoc-usage'.\n►►►"
  ;;  (declare (indent 2) (debug t))
  (let ((v-doc  (make-symbol "v-doc"))
        (v-val  (make-symbol "v-val"))
	(c-val  (make-symbol "c-val"))
	(cr-val (make-symbol "cr-val"))
	(c-doc  (make-symbol "c-doc"))
        (x-ref  (make-symbol "x-ref"))
        (f-nam  (make-symbol "f-nam"))
        (f-doc  (make-symbol "f-doc")))
    `(let (,v-doc ,v-val ,c-val ,cr-val ,c-doc ,x-ref ,f-nam ,f-doc)
       (setq ,v-doc ,(plist-get (symbol-plist var-name) 'variable-documentation))
       ;; :WAS (setq ,v-val ,(format "%s" (symbol-value var-name)))
       ;; Not sure if format -> pp-to-string is redundant but it works...
       (setq ,v-val ,(format "%s" (pp-to-string  (symbol-value var-name))))
       (setq ,c-doc ,(plist-get (symbol-plist var-name) 'variable-documentation))
       ;;:WAS (setq ,c-val ,(format "%s" (symbol-value const-name)))
       (setq ,c-val ,(format "%s" (pp-to-string (symbol-value const-name))))
       ;; Replace "\\<" and "\\>" at beginning and end of string so *Help*
       ;; doesn't see them as keymap related xref'ing shite.
       (setq ,cr-val (replace-regexp-in-string "^\\\"\\\\\\\\<" "\\\\\\\=<" ,c-val nil t))
       (setq ,c-val (replace-regexp-in-string "\\\\\\\\>\\\"$" "\\\\\\\=>" ,cr-val nil t))
       (setq ,f-nam (when ,face-name
                      (list ,(symbol-name face-name)
                            (replace-regexp-in-string "fface" "face" ,(symbol-name face-name)))))
       (setq ,f-doc (when ,f-nam
                      (concat
                       "\n\n--------------------------\n"
                       "The keywords and regexps are font-locked with:\n"
                       ":FACE-DOCUMENTED-IN `" (car ,f-nam) "'\n"
                       ":FACE-DEFINED-IN    `" (cadr ,f-nam) "'\n"
                       "                    (describe-face '" (cadr ,f-nam) ")\n")))
       (setq ,x-ref (remove ',var-name ,xrefs))
       (setq ,x-ref (concat "\n:SEE-ALSO\n`" (mapconcat 'symbol-name ,x-ref "'\n`") "'\n►►►"))
       (setq ,v-doc ;; Put the vars's properties.
	     (concat
              ,v-doc
              "\n--------------------------\n"
              ":KEYWORD-REGEXPS-IN `" ,(symbol-name const-name) "' a <CONSTANT> with value:\n\n"
              ,c-val
              ,f-doc
              "\n--------"
              ,x-ref))
       (setq ,c-doc ;; Put the constant's properties.
	     (concat
	      ,c-doc
	      "\n\n--------------------------\n"
	      ":KEYWORD-LISTS-IN `" ,(symbol-name var-name) "' a <VARBIABLE> with value:\n\n"
	      ,v-val
	      ,f-doc
	      "\n--------"
	      ,x-ref))
       (plist-put (symbol-plist ',const-name) 'variable-documentation ,c-doc)
       (plist-put (symbol-plist ',var-name)   'variable-documentation ,v-doc))))
;;
;;; (progn (fmakunbound 'mon-help-swap-var-doc-const-val)
;;;        (unintern 'mon-help-swap-var-doc-const-val) )
;;
;;,---- :UNCOMMENT-BELOW-TO-TEST
;;| (progn
;;|   (defface test-swap-var->const-face
;;|             '((((class color) (background light)) (:foreground "CornflowerBlue"))
;;|               (((class color) (background dark)) (:foreground "CornflowerBlue"))
;;|               (t (:bold t :italic t)))
;;|           "*Face font-locking of institution name keywords in .naf files.
;;| Additional documentation in var `test-swap-var->const-fface'")
;;| (defvar test-swap-var->const-fface 'test-swap-var->const-face
;;|            "*Face for `naf-mode' font-locking of institution name keywords
;;| :KEYWORDS-IN the regexp defined in: {:SEE-ALSO list of XREFD var names}.
;;| Face definition in `test-swap-var->const-face'.")
;;| (defvar *test-swap-var-xrefs*
;;|   '(*test-swap-var->const* *test-swap-var->const2* *test-swap-var->const3* *test-swap-var-xrefs*)
;;|   "List of symbol names of variables which xref each other in `test-swap-var-mode'.
;;| :SEE :FILE \"./test-swap-var-mode.el\".")
;;| (defvar *test-swap-var->const* '("list" "of" "keywords" "to" "fontlock")
;;|           "Did this docstring get swapped to docstring of `test-swap-var->cons'?.
;;|   Is its value at the top of docstring?")
;;| (defconst test-swap-var->const (regexp-opt *test-swap-var->const* 'paren)))
;;`----
;;
;;,---- :CLEANUP
;;| (progn (makunbound '*test-swap-var->const*)     (unintern '*test-swap-var->const*)
;;|        (makunbound 'test-swap-var->const)       (unintern 'test-swap-var->const)
;;|        (makunbound '*test-swap-var-xrefs*)      (unintern '*test-swap-var-xrefs*)
;;|        (makunbound 'test-swap-var->const-face)  (unintern 'test-swap-var->const-face)
;;|        (makunbound 'test-swap-var->const-fface) (unintern 'test-swap-var->const-fface)))
;;`----
;;
;;,---- :EVAL-BELOW-TO-TEST
;;| (mon-help-swap-var-doc-const-val *test-swap-var->const* test-swap-var->const)
;;| (mon-help-swap-var-doc-const-val
;;|     *test-swap-var->const* test-swap-var->const
;;|     *test-swap-var-xrefs*  test-swap-var->const-fface)
;;`----
;; 

;;; ==============================
;;; :NOTE Not entirely correct for funcs where byte symbol is byte compiled
;;;       compare output of interpreted:
;;;        (mon-help-xref-symbol-value 'mon-help-xref-symbol-value)
;;;       versus byte-compiled:
;;;        (byte-compile 'mon-help-xref-symbol-value)
;;;        (mon-help-xref-symbol-value 'mon-help-xref-symbol-value)
;;;        (symbol-function 'mon-help-xref-symbol-value)
;;; :TODO Need to check if symbol is compiled and then pull apart the vector.
;;; :CREATED <Timestamp: #{2009-09-30T16:44:24-04:00Z}#{09403} - by MON KEY>
(defun mon-help-xref-symbol-value (sym)
  "Return the value of symbol SYM.
When SYM is a function return `symbol-function' of symbol.
When SYM is a variable return `symbol-value' of symbol.
value returned is of the form:
\(\(SYMBOL <FUNCTION>|<VARIABLE>\) \(VALUE-OF-FUNICTION-OR-VARIABLE\)\n
:EXAMPLE\n(mon-help-xref-symbol-value 'mon-help-xref-symbol-value)\n
\(mon-help-xref-symbol-value '*w32-env-variables-alist*\)\n
:SEE-ALSO `mon-help-function-spit-doc', `mon-help-function-args',
`mon-help-swap-var-doc-const-val', `mon-help-parse-interactive-spec'.\n►►►"
  (let* ((is-sym (intern-soft sym))
         (sym-type-val (cond ((and(fboundp is-sym)(functionp is-sym))
                              `((,is-sym ,'<FUNCTION>),(symbol-function is-sym)))
                             ((bound-and-true-p is-sym)
                              `((,is-sym '<VARIABLE>) ,(symbol-value is-sym))))))
    sym-type-val))

;;; ==============================
;;; :NOTE The do-var arg doesn't work for byte-compiled vars in .elc files on:
;;; "GNU Emacs 23.1.50.1 (i386-mingw-nt5.1.2600)
;;;  of 2009-06-30 on LENNART-69DE564 (patched)"
;;;  Not sure what is happening with that. Interpreted vars are fine...
;;; :CREATED <Timestamp: Thursday July 02, 2009 @ 05:16.20 PM - by MON KEY>
(defun* mon-help-function-spit-doc (sym-name &key alt-cookie do-var insertp
                                             do-face do-group do-theme)
  "Return documentation for function with SYM-NAME.\n
When `:ALT-COOKIE' \(a string\) is non-nil overrides the default comment delimiter
set in global var `*doc-cookie*' - \"\u25BA\u25BA\u25BA\".\n
If `:ALT-COOKIE' is not present in SYM-NAME's docstring header of docstring is
inserted uncommented.\n
When `:INSERTP' is non-nil insert documentation in current buffer.\n
When keyword arg `:DO-VAR' is non-nil get documentation of a variable or constant.
`:DO-VAR' should be t when invoked for variable, constant, custom documentation,
e.g. symbols defined inside a defvar, defconst, or defcustom form.\n
When keyword arg `:DO-FACE' is non-nil get face documentation for sym-name.
`:DO-FACE' should be t when invoked for face documentation, e.g. symbols defined
inside a defface form.\n
When keyword arg `:DO-GROUP' is non-nil get face documentation for sym-name.
`:DO-GROUP' should be t when invoked for group documentation, e.g. symbols defined
inside a defgroup form.\n
When keyword arg `:DO-THEME' is non-nil get face documentation for sym-name.
`:DO-THEME' should be t when invoked for group documentation, e.g. symbols defined
inside a defgroup form.\n
:EXAMPLE\n\(mon-help-function-spit-doc 'mon-help-function-spit-doc\) ;defun
\(mon-help-function-spit-doc '*doc-cookie* :do-var t\) ;defvar
\(mon-help-function-spit-doc 'eldoc-message-commands :do-var t\) ;defconst
\(mon-help-function-spit-doc 'completions-merging-modes :do-var t\) ;defcustom
\(mon-help-function-spit-doc 'font-lock-keyword-face :do-face t\) ;defface
\(mon-help-function-spit-doc 'apropos :do-group t\) ;defgroup\n
:SEE-ALSO `mon-insert-doc-help-cookie', `mon-insert-doc-help-tail',
`mon-help-xref-symbol-value', `mon-help-function-args',
`mon-help-insert-documentation'.\n►►►"
  (eval-when-compile (require 'mon-cl-compat nil t))
  (let (mk-docstr)
    (save-excursion
      (setq mk-docstr
            (with-temp-buffer
              (emacs-lisp-mode)
              (let* ((check-opt (if alt-cookie (string-to-list alt-cookie)))
                     (dc (if (and alt-cookie (stringp alt-cookie))
                             (if (intern-soft "cl::intersection")
                                 (cond ((cl::intersection (string-to-list "[*?^.+$\\") check-opt)
                                        (regexp-quote alt-cookie))
                                       (t alt-cookie))
                                 (cond ((intersection (string-to-list "[*?^.+$\\") check-opt)
                                        (regexp-quote alt-cookie))
                                       (t alt-cookie)))
                             *doc-cookie*))
                     (st-mrk (make-marker))
                     (cookie-mrk (make-marker))
                     (put-help)
                     (help-bnds)
                     (ret-str))
                (setq put-help
                      (cond ((functionp sym-name)
                             (or (documentation sym-name)
                                 (unless (byte-code-function-p sym-name)
                                   (when (stringp (caddr (symbol-function sym-name)))
                                     (stringp (caddr (symbol-function sym-name))))))) ;; funcs, macros.
                            (do-var (or (plist-get (symbol-plist sym-name) 'variable-documentation)
                                        (documentation-property sym-name 'variable-documentation))) ;; var, const, customs.
                            (do-face (or (face-documentation sym-name)
                                         (plist-get (symbol-plist sym-name) 'face-documentation)
                                         (documentation-property sym-name 'face-documentation))) ;; faces.
                            (do-group (or (plist-get (symbol-plist sym-name) 'group-documentation)
                                          (documentation-property sym-name 'group-documentation))) ;; groups.
                            (do-theme (or (plist-get (symbol-plist sym-name) 'theme-documentation)
                                          ;; :NOTE consider `theme-settings' here.
                                          (documentation-property sym-name 'theme-documentation))) 
                            (t (documentation sym-name))))
                (set-marker st-mrk (point))
                (setq help-bnds (+ (marker-position st-mrk) (length put-help)))
                (princ put-help (current-buffer))
                ;; (prin1 put-help (current-buffer))
                (goto-char st-mrk)
                (search-forward-regexp (concat "\\(" dc "\\)") help-bnds t)
                (set-marker cookie-mrk (point))
                (if (equal st-mrk cookie-mrk)
                    nil
                    (progn
                      (comment-region st-mrk cookie-mrk)
                      (goto-char st-mrk)
                      (search-forward-regexp (concat "\\(" dc "\\)") cookie-mrk t)
                      (replace-match "")))
                (setq ret-str  (buffer-string))
                ret-str))))
    (when insertp (save-excursion (newline) (princ mk-docstr (current-buffer))))
    mk-docstr))
;;
;;; :TEST-ME (mon-help-function-spit-doc 'mon-help-function-spit-doc :alt-cookie nil :do-var nil :insertp t)
;;; :TEST-ME (mon-help-function-spit-doc '*regexp-mon-doc-help-pointer-tags* :do-var t :insertp t)
;;; :TEST-ME (mon-help-function-spit-doc 'font-lock-keyword-face :do-face t :insertp t)
;;; :TEST-ME (mon-help-function-spit-doc 'apropos :do-group t :insertp t)

;;; ==============================
;;; :TODO
;;; - This function _should_ test if it found a variable.
;;;   If so, it should change the fomrat spec of 'fstrings'  to:
;;;   "\n(mon-help-function-spit-doc '%s nil t t)
;;; - The test-me subr should insert 4 ':TEST-ME's for functions as:
;;;   ":TEST-ME (<FNAME>)"
;;;   ":TEST-ME (<FNAME> t)"
;;;   ":TEST-ME (describe-function '<FNAME>)"
;;;   ":TEST-ME (call-interactively '<FNAME>)"
;;;   When a variable is found should insert:
;;;   ":TEST-ME <VARNAME>"
;;;   ":TEST-ME (describe-variable '<VARNAME>)"
;;;
;;; :NOTE Use (beginning-of-defun 2) w/ *regexp-symbol-defs*.
;;; :CREATED <Timestamp: Thursday July 16, 2009 @ 11:38.10 AM - by MON KEY>
(defun mon-insert-doc-help-tail (&optional fname test-me-cnt insertp intrp)
  "Return function body code template when body uses a docstring instrospection.
For functions which call `mon-help-function-spit-doc' in the body. Additionally,
insert ';;; :TEST-ME ' templates after the closing of defun. When FNAME \(a string\)
is non-nil don't search for function's name in head of defun substitute FNAME instead.
When TEST-ME-CNT is non-nil include N 'test-me' strings with returned template.
Default test-me-cnt is 3 'test-me's.
When called programmatically INSERTP is non-nil or if called interactively insert
code template in buffer at point. Does not move point.
Regexp held by global var `*regexp-symbol-defs*'.\n
:SEE-ALSO `mon-insert-lisp-testme', `mon-help-regexp-symbol-defs-TEST'.\n►►►"
  (interactive "i\ni\ni\np")
  (let* ((the-sym (if fname
                   fname
                 (save-excursion
                   (search-backward-regexp *regexp-symbol-defs*)
                   (buffer-substring-no-properties (match-beginning 3) (match-end 3)))))
         (tm-cnt (if test-me-cnt test-me-cnt 3))
         (found (match-string-no-properties 2))
         (fun-typs '("defun" "defun*" "defmacro" "defmacro*" "defsubst" "defsubst*"))
         (var-typs '("defvar" "defconst" "defcustom"))
         ;; (sym-name &key :alt-cookie :do-var :insertp :do-face :do-group :do-theme
         (sym-str-cond (cond ((car (member found fun-typs))
                                   "      (mon-help-function-spit-doc '%s :insertp t)\n")
                              ((car (member found var-typs))
                              "      (mon-help-function-spit-doc '%s :do-var t :insertp t)\n")
                              ((string= found "defface")
                              "      (mon-help-function-spit-doc '%s :do-face t :insertp t)\n")
                              ((string= found "defgroup")
                               "      (mon-help-function-spit-doc '%s :do-group t :insertp t)\n")
                              ((string= found "deftheme")
                               "      (mon-help-function-spit-doc '%s :do-theme t :insertp t)\n")
                              (t "      (mon-help-function-spit-doc '%s :insertp t)\n")))
         (fstring
          (format
           (concat
            "(interactive \"i%s%sP\")\n"
            "  (if (or insertp intrp)\n"
            sym-str-cond
            "    (message \"Pass non-nil for optional arg INTRP\")))\n;;\n%s")
           (char-to-string 92)(char-to-string 110) ;;gets us a '\n'
           the-sym
           (if fname
               (replace-regexp-in-string "$" (concat "(" fname " )")
                                         (mon-insert-lisp-testme nil tm-cnt nil))
                     (mon-insert-lisp-testme t tm-cnt nil)))))
    (if (or intrp insertp)
        (save-excursion (newline) (princ fstring (current-buffer)))
      fstring)))
;;
;;; :TEST-ME (mon-insert-doc-help-tail)
;;; :TEST-ME (mon-insert-doc-help-tail nil 3)
;;; :TEST-ME (mon-insert-doc-help-tail nil nil t)
;;; :TEST-ME (mon-insert-doc-help-tail)
;;; :TEST-ME (mon-insert-doc-help-tail "some-function" 3)
;;; :TEST-ME (mon-insert-doc-help-tail "some-function-name" 3 t)
;;; :TEST-ME (mon-insert-doc-help-tail "some-function-name" nil t)
;;; :TEST-ME (apply 'mon-insert-doc-help-tail '(t))

;;; ==============================
;;; :RENAMED `mon-help-regexp-symbol-defs-TEST' -> `mon-help-regexp-symbol-defs-TEST'
;;; :MODIFICATIONS <Timestamp: #{2010-02-24T20:24:30-05:00Z}#{10084} - by MON KEY>
;;; :CREATED <Timestamp: #{2009-09-02T16:11:07-04:00Z}#{09363} - by MON KEY>
(defun mon-help-regexp-symbol-defs-TEST (&optional dis-p do-big-regexp)
  "Return overlays for matches of regexp in region.\n
When optional arg DIS-P is non-nil or when called-interactively return formatted
results to the buffer named *REGEXP-SYMBOL-DEFS-REPORT*.
When optional arg DO-BIG-REGEXP is non-nil use regxp in variable
`*regexp-symbol-defs-big*' default is `*regexp-symbol-defs*'.\n
:EXAMPLE\n\n(mon-help-regexp-symbol-defs-TEST t)\n
\(mon-help-regexp-symbol-defs-TEST t t\)\n
►
\(defun some-function \(&optional optional\)
\(defvar som-bq-list `\(
\(defun some-function-22 \(&optional optional\)
\(defvar som-var t
\(defun *some/-symbol:->name<-2* \(somevar
\(defmacro some-macro \(\)
\(defvaralias 'som-var 'som-other-var
\(defmacro some-macro*:22 \(&rest\)
\(defvar som-double-list \(\(
\(defun *some/-symbol:->name<-2* \(somevar
\(defvar *some-var* 'var
\(defun *some/-symbol:->name<-2* 'somevar
\(defconst som-const \"somestringval\"
\(defun* *some/-symbol:->name<-2* \(&
\(defmacro some-macro*:22 \(&rest\)
\(defun *some/-symbol:->name<-2* \(somevar
\(defvar *some-var* 'var
\(defun *some/-symbol:->name<-2* 'somevar
\(defmacro some-macro \(\)
\(defvar *som-var* nil
\(defmacro* some-macro*:22 \(&rest\)
\(defcustom reb-re-syntax 'read
\(defun* *some/-symbol:->name<-2* \(somevar
\(defsubst *some/subtst-symbol:->name<-2* \(
\(defface *some/-symbol:->name<-2* \(\(
\(defsubst* *some/subtst-symbol:->name<-2* \(
\(defcustom *some/-custom-symbol:->name<-2* 'somecustom
\(defconst *some/-symbol:->name<-2* \(someconst
\(defface *some/-face-symbol:->name<-2* \(someface
\(defgroup *some/-group-symbol:->name<-2* \(somegroup
\(deftheme *some/-theme-symbol:->name<-2* \(sometheme
◄

:SEE-ALSO `mon-help-propertize-regexp-symbol-defs-TEST', `mon-help-overlay-result'
`lisp-font-lock-keywords', `lisp-font-lock-keywords-1', `lisp-font-lock-keywords-2'.\n►►►"
  (interactive "p")
  (eval-when-compile (require 'boxquote))
  (let ((botp          #'(lambda () `(,(line-beginning-position) . ,(line-end-position))))
        (mhrsdt-mhor   #'(lambda (bd) (mon-help-overlay-result (car bd) (cdr bd) 78)))
        (srcher        #'(lambda (srch bnds) (search-forward-regexp srch bnds t)))        
        (ntst-maybe    #'(lambda (m-fncn m-grp) 
                           (let ((nmp (funcall m-fncn m-grp)))
                             (if (numberp nmp) (number-to-string nmp) "!no-match!"))))
        ;; :IS-STILL 
        (srched (if do-big-regexp *regexp-symbol-defs-big* *regexp-symbol-defs*))
        ;; (srched *tt-rsd*) ;; :TEMP-TESTING
        (mhrsdt-bnd-s (make-marker))
        (mhrsdt-bnd-e (make-marker))
        (mhrsdt-step 1)
        match-report mhrsdt-cnt )
    (save-excursion
      (funcall srcher "^►" nil)
      (set-marker mhrsdt-bnd-s (point))
      (funcall srcher "◄$" nil)
      (set-marker mhrsdt-bnd-e (point)))
    (setq mhrsdt-cnt (- (line-number-at-pos (- (marker-position mhrsdt-bnd-e) 2))
                        (line-number-at-pos (marker-position mhrsdt-bnd-s))))
    (save-excursion
      ;;(goto-char mhrsdt-bnd-s)
      (goto-char (1+ mhrsdt-bnd-s))
      (while (< mhrsdt-step mhrsdt-cnt)
        (funcall srcher srched mhrsdt-bnd-e)
        (funcall mhrsdt-mhor (funcall botp))
        (push (concat 
               "------------------------------------\n"
               "Match iteration: " (format "%d\n" mhrsdt-step)
               ;; `font-lock-keyword-face'
               "\nmatch-string1: " (match-string-no-properties 2) " start2: " 
               (funcall ntst-maybe 'match-beginning 2) " end2: " 
               (funcall ntst-maybe 'match-end 2) "\nmatch-string3: "
               ;; `font-lock-type-face', `font-lock-variable-name-face', `font-lock-function-name-face'
               (match-string-no-properties 3)" start3: " 
               (funcall ntst-maybe 'match-beginning 3) " end3: " 
               (funcall ntst-maybe 'match-end 3) "\nmatch-string4: "
               (match-string-no-properties 4) " start4: " 
               (funcall ntst-maybe 'match-beginning 4)  " end4: " 
               (funcall ntst-maybe 'match-end 4)"\n")
              match-report)
        (setq mhrsdt-step (1+ mhrsdt-step))))
    ;; (push          (match-report
    ;; (setq match-report (nreverse match-report))
    (setq srched (buffer-substring-no-properties (1- mhrsdt-bnd-s) mhrsdt-bnd-e))
    (setq srched 
          (with-temp-buffer
            (save-excursion
              (princ srched (current-buffer)))
            (if (fboundp 'boxquote-region)
                (boxquote-region (buffer-end 0)(buffer-end 1))
                (comment-region (buffer-end 0)(buffer-end 1)))
            (goto-char (buffer-end 0))
            (princ ";;; Regexp Match Report for the following lines:\n" (current-buffer))
            (buffer-substring-no-properties (buffer-end 0)(buffer-end 1))))
    (setq match-report (nreverse match-report))
    (push srched match-report)
    (prog1
        (setq match-report 
              (concat (mapconcat #'identity match-report "\n") 
                      "------------------------------------\n"))
      (when (or dis-p)
        (with-current-buffer (get-buffer-create "*REGEXP-SYMBOL-DEFS-REPORT*")
          (unwind-protect 
               (let ((buffer-read-only nil))
                 (erase-buffer)
                 (save-excursion (princ match-report (current-buffer)))
                 (mon-help-propertize-regexp-symbol-defs-TEST)
                 (display-buffer (current-buffer) t t))
            (set (make-local-variable 'buffer-read-only) t)))))))
;;
;;,---- :UNCOMMENT-BELOW-TO-TEST
;;|
;;| (mon-help-regexp-symbol-defs-TEST t)
;;|
;;|►
;;|(defun some-function (&optional optional)
;;|(defvar som-bq-list `(
;;|(defun some-function-22 (&optional optional)
;;|(defvar som-var t
;;|(defun *some/-symbol:->name<-2* (somevar
;;|(defmacro some-macro ()
;;|(defvaralias 'som-var 'som-other-var
;;|(defmacro some-macro*:22 (&rest)
;;|(defvar som-double-list ((
;;|(defun *some/-symbol:->name<-2* (somevar
;;|(defvar *some-var* 'var
;;|(defun *some/-symbol:->name<-2* 'somevar
;;|(defconst som-const "somestringval"
;;|(defun* *some/-symbol:->name<-2* (&
;;|(defmacro some-macro*:22 (&rest)
;;|(defun *some/-symbol:->name<-2* (somevar
;;|(defvar *some-var* 'var
;;|(defun *some/-symbol:->name<-2* 'somevar
;;|(defmacro some-macro ()
;;|(defvar *som-var* nil
;;|(defmacro* some-macro*:22 (&rest)
;;|(defcustom reb-re-syntax 'read
;;|(defun* *some/-symbol:->name<-2* (somevar
;;|(defsubst *some/subtst-symbol:->name<-2* (
;;|(defface *some/-symbol:->name<-2* ((
;;|(defsubst* *some/subtst-symbol:->name<-2* (
;;|(defcustom *some/-custom-symbol:->name<-2* 'somecustom
;;|(defconst *some/-symbol:->name<-2* (someconst
;;|(defface *some/-face-symbol:->name<-2* (someface
;;|(defgroup *some/-group-symbol:->name<-2* (somegroup
;;|(deftheme *some/-theme-symbol:->name<-2* (sometheme
;;|◄
;;`----

;;; ============================== mhprsdt
;;; :CREATED <Timestamp: #{2010-02-11T20:48:23-05:00Z}#{10065} - by MON KEY>
(defun mon-help-propertize-regexp-symbol-defs-TEST ()
  "Helper function for `mon-help-regexp-symbol-defs-TEST'.\n
Propertize symbols matched by regexp `*regexp-symbol-defs*'.
:SEE-ALSO `mon-help-overlay-result'.\n►►►"
  (let ((fnf ;; `font-lock-function-name-face'
         '(defun defun* defmacro defmacro* defsubst defsubst* defclass defadvice
           defgeneric defmethod defsetf defalias))
        (ftf ;; `font-lock-type-face'
         '(defclass deftheme defgroup deftype defpackage defstruct))
        (fvf ;; `font-lock-variable-name-face'
         '(defface defconstant defconst defvar defparameter defvaralias))
        (next-ms #'(lambda (n) (search-forward-regexp (concat "match-string" n ": ") nil t)))
        (got-sym-tp #'(lambda (fc) (let ((mhprsdt-botap ;; :WAS (bounds-of-thing-at-point 'symbol)))
                                          (save-match-data (bounds-of-thing-at-point 'symbol))))
                                     ;;(with-syntax-table emacs-lisp-mode-syntax-table <- fails why??
                                     (unless (null mhprsdt-botap)
                                       (put-text-property (car mhprsdt-botap) (cdr mhprsdt-botap) 'face fc)))))
        ;; got-sym-tp 
        got-def bro)
    (unwind-protect
         (when (buffer-local-value 'buffer-read-only (current-buffer))
           (set 'buffer-read-only nil)
           (setq bro t))
      (set-syntax-table emacs-lisp-mode-syntax-table)
      (while (funcall next-ms "1")
        (setq got-def (symbol-at-point))
        (funcall got-sym-tp 'font-lock-keyword-face)
        (funcall next-ms "3")
        (when ;; :WAS (looking-at "'") (forward-char))  
            (eq (char-after (point)) 39)(forward-char))
        (cond ((memq got-def fnf)(funcall got-sym-tp 'font-lock-function-name-face))
              ((memq got-def ftf)(funcall got-sym-tp 'font-lock-type-face))
              ((memq got-def fvf)(funcall got-sym-tp 'font-lock-variable-name-face))))
      (when bro (set 'buffer-read-only t)))))

;;; ==============================
;;; :COURTESY Dave Love <fx@gnu.org> :HIS fx-misc.el :WAS `function-arity'
;;; :NOTE On the CL functions with &keys (mon-help-function-arity 'reduce)
;;; :CREATED <Timestamp: #{2009-12-19T01:06:00-05:00Z}#{09516} - by MON>
(defun mon-help-function-arity (function)
  "Return information on the arity \(argument numbers\) of FUNCTION.
The result is of the form returned by `subr-arity' or the symbol
`unknown' for an autoloaded function (whose arity is unknown).\n
FUNCTION must be a function \(or special form\) according to
`functionp', or else a macro.\n
:EXAMPLE\n\n\(mon-help-function-arity 'mon-help-function-arity)\n
\(mon-help-function-arity 'reduce\)\n
:NOTE The CL-seq functions with &keys e.g. `reduce' returns 'many'
as the cl-keys occurs in the &rest parameter position. This also occurs with
functions defined with the CL packages `defun*' macro.
:SEE `lambda-list-keywords'.\n
:SEE-ALSO `subr-arity', `mon-help-function-args', `help-function-arglist'.\n►►►"
  (setq function (indirect-function function))
  (cond ((eq 'autoload (car-safe function))
	 'unknown)
	((subrp function)
	 (subr-arity function))
	(t				; macro, lambda or byte code
	 (let ((min-args 0)
	       lambda-list max-args &optional)
	   (if (eq 'macro (car-safe function))
	       (pop function)		; now byte code or lambda
	     (unless (functionp function)
	       (signal 'invalid-function (list function))))
	   (if (eq 'lambda (car-safe function))
	       (setq lambda-list (cadr function))
	     (if (not (byte-code-function-p function))
		 'unknown		; shouldn't happen
	       (setq lambda-list (aref function 0))))
	   ;; We've got a lambda list.
	   (while (and lambda-list (not (eq 'many max-args)))
	     (cond ((eq (car lambda-list) '&optional)
		    (setq &optional 0))
		   ((eq (car lambda-list) '&rest)
  		    (setq max-args 'many))
		   (t
		    (if &optional
			(setq &optional (1+ &optional))
		      (setq min-args (1+ min-args)))))
	     (pop lambda-list))
	   (unless max-args (setq max-args (+ min-args (or &optional 0))))
	   (cons min-args max-args)))))
;;
;;; :TEST-ME (mon-help-function-arity 'mon-file-stamp)

;;; ==============================
;;; :MODIFICATIONS <Timestamp: #{2009-09-07T19:54:58-04:00Z}#{09371} - by MON KEY>
;;; :FIXES CL &key &aux args in the tail of Elisp &rest e.g.
;;;       (help-function-arglist 'mon-help-function-spit-doc)
;;;       ;=> (sym-name &rest --cl-rest--)
;;; :NOTE This isn't per se a problem but it does happen:
;;;       (help-function-arglist 'reduce)
;;;       ;=> (cl-func cl-seq &rest cl-keys)
;;;
;;;       With regards docstring snarfing following shows the commponents of a
;;;       byte-compiled-function:
;;;       `byte-compile-output-docform'  (preface name info form specindex quoted)
;;;        INFO is a list of three elements (PREFIX DOC-INDEX POSTFIX)
;;;        e.g. bind the free-variable OUTBUFFER to some dest and:
;;;        (let ((outbuffer (current-buffer)))
;;;              (byte-compile-output-docform nil nil '("@►►►" 0 "@◄◄◄")
;;;                                '( <SOME-LISP-FORM-HERE> )
;;;                                t t))
;;;       Further along that output gets translated to:
;;;       #@144 ;; chars left until we hit the `^_' eg char 31 ?\x1F
;;;       `^_' ;<- docstring terminator followed by newline
;;;       (defalias 'FUNCNAME #[(arg1 arg2 &rest cl-keys) #@710 
;;;       chars left to end of list only when &keys ------'
;;; :CREATED <Timestamp: #{2009-08-20T21:24:31-04:00Z}#{09345} - by MON>
(defun mon-help-function-args (func)
  "Return arg list of FUNC.\n
:EXAMPLE\n\(mon-help-function-args 'mon-help-function-args\)
\(mon-help-function-args 'mon-help-function-spit-doc\) ;CL arg-list with &key
:NOTE May return misleading results when the CL marcros are in play.
:SEE `lambda-list-keywords', `help-add-fundoc-usage'.\n
:CALLED-BY `mon-help-insert-documentation'.\n
:SEE-ALSO `mon-help-function-arity', `subr-arity', `help-function-arglist',
`mon-help-xref-symbol-value', `mon-help-parse-interactive-spec',
`mon-help-function-spit-doc', `byte-compile-output-docform'.\n►►►"
  (let ((def (help-function-arglist func))
        (test-def))
    (when (and def (member '&rest def))
      (mapc #'(lambda (r) 
                (when (string-equal (format "%s" r) "--cl-rest--")
                  (setq test-def t)))
            def))
    (if test-def
        (let (get-args)
          (setq get-args
                (with-temp-buffer
                  (let (sexp-bnds)
                    (princ (documentation func) (current-buffer))
                    (goto-char (buffer-end 1))
                    (backward-sexp)
                    (setq sexp-bnds (bounds-of-thing-at-point 'sexp))
                    (buffer-substring-no-properties (car sexp-bnds) (cdr sexp-bnds)))))
          (setq get-args (car (read-from-string (downcase get-args))))
          (setq get-args (delete 'fn get-args)))
        (help-function-arglist func))))
;;
;;; :TEST-ME (mon-help-function-args 'mon-help-function-spit-doc)
;;; :TEST-ME (help-function-arglist 'mon-help-function-spit-doc)
;;; :TEST-ME (mon-help-function-args 'mon-help-function-spit-doc)


;;; ==============================
;;; :CREATED <Timestamp: #{2009-09-30T17:22:54-04:00Z}#{09403} - by MON KEY>
(eval-and-compile
(defvar *mon-help-interactive-spec-alist*
  '((a "<FUNCTION-NAME>")
    (b "<EXISTING-BUFFER-NAME>")
    (B "<BUFFER-NAME-OR-NON-EXISTING>")
    (c "<CHARACTER-NO-INPUT-METHOD>")
    (C "<COMMAND-NAME>")
    (d "<VALUE-POINT-AS-NUMBER-NO-I/O>")
    (D "<DIRECTORY-NAME>")
    (E "<PARAMETRIZED-EVENT>")
    (f "<EXISTING-FILE-NAME>")
    (F "<FILE-NAME-OR-NON-EXISTING>")
    (G "<FILE-NAME-OR-NON-EXISTING-W/DIR-NAME>")
    (i "<IGNORED-NOOP>") ;; NO-I/O
    (K "<KEY-SEQUENCE-DOWNCASE-MAYBE>") ;; (downcase the last event if needed to get a definition).
    (K "<KEY-SEQUENCE-REDEFINE-NO-DOWNCASE>") ;; (do not downcase the last event).
    (m "<VALUE-MARK-AS-NUMBER>")              ;; NO-I/O
    (M "<ANY-STRING-W/INPUT-METHOD>")
    (N "<NUMBER<-MINIBUFFER>")
    (N "<NUMERIC-PREFIX-ARG>")
    (p "<PREFIX-ARG->NUMBER>") ;; NO-I/O
    (P "<PREFIX-ARG-RAW>")     ;; Does not do I/O. NO-I/O
    (r "<REGION>")             ;; NO-I/O
    (s "<ANY-STRING>")         ;; Does not inherit the current input method.
    (S "<ANY-SYMBOL>")         ;; NO-INPUT-METHOD
    (U "<MOUSE-UP-EVENT>")     ;; discarded by a previous k or K argument.
    (v "<VARIABLE-NAME>")
    (x "<READ-LISP-EXPRESSION-NO-EVALUATE>")
    (X "<READ-LISP-EXPRESSION-EVALUATE>")
    (z "<CODING-SYSTEM>")
    (Z "<CODING-SYSTEM-NIL-NO-PREFIX>"))
  "*An alist of interactive spec arguments and values.
Alist key \(an intereractive spec letter\) maps to shortform spec-type.
spec-type is a string delimited by `<' and `>'.
:CALLED-BY `mon-help-parse-interactive-spec'.
:SEE-ALSO `mon-help-xref-symbol-value', `mon-help-insert-documentation', 
`mon-help-function-spit-doc'.\n►►►"))
;;
;;; :TEST-ME  *mon-help-interactive-spec-alist*
;;; :TEST-ME (assoc 'z *mon-help-interactive-spec-alist*)
;;

;;;(progn (makunbound '*mon-help-interactive-spec-alist*)
;;;       (unintern '*mon-help-interactive-spec-alist*) )

;;; *mon-help-interactive-spec-alist*
;;; (regexp-opt (mapcar 'cadr *mon-help-interactive-spec-alist*))

;;; ==============================
;;; :CREATED <Timestamp: #{2009-09-07T20:04:57-04:00Z}#{09372} - by MON KEY>
;;; :MODIFICATIONS <Timestamp: #{2009-09-30T17:29:53-04:00Z}#{09403} - by MON KEY>
;;(eval-and-compile
(defun mon-help-parse-interactive-spec (fname)
  (let* ((int-spec *mon-help-interactive-spec-alist*)
         (int-t (interactive-form fname))
         (int-has-spec
          (when int-t
            (cond ((stringp (cadr int-t))
                   (concat
                    "<INTERACITVE-SPEC>\n;;; "
                    (mapconcat #'(lambda (specx)
                      ;; :WAS (concat (cadr (assoc-string (subseq specx 0 1) int-spec)) " " (subseq specx 1)))
                       (concat (cadr (assoc-string (cl::subseq specx 0 1) int-spec)) " " (cl::subseq specx 1)))
                               (save-match-data (split-string (cadr int-t) "\n"))
                               "\n;;; ")))
                  ;; :NOTE Leave the trailing line for `mon-insert-documentation'.
                  ((listp (cadr int-t)) "<INTERACTIVE-SPEC-IS-LIST>")))))
    int-has-spec))
;)
;;
;; Now put a doc-string on `mon-help-parse-interactive-spec'
;; using value & docstring of var `*mon-help-parse-interactive-spec-alist*'.
(eval-when-compile
  (mon-help-put-var-doc-val->func
   '*mon-help-interactive-spec-alist*
   'mon-help-parse-interactive-spec
   "\nThe arg FNAME names a function which has an interactive spec.
Return spec of fname from value lookup in var `*mon-help-interactive-spec-alist*':\n\n"
   ":CALLED-BY `mon-help-parse-interactive-spec'."
   "\n:EXAMPLE\n\n\(mon-help-parse-interactive-spec 'mon-insert-lisp-testme\)\n"))
;;
;;; :TEST-ME (describe-function 'mon-help-parse-interactive-spec)
;;; :TEST-ME (mon-help-parse-interactive-spec  'mon-insert-file-in-dirs)
;;; :TEST-ME (mon-help-parse-interactive-spec  'mon-help-mon-help)
;;; :TEST-ME (mon-help-parse-interactive-spec  'mon-insert-string-n-times)
;;; :TEST-ME (mon-help-parse-interactive-spec  'mon-insert-string-n-fancy-times)
;;; :TEST-ME (listp (cadr (interactive-form    'mon-insert-file-in-dirs)))
;;; :TEST-ME (listp (cadr (interactive-form    'mon-insert-string-n-times)))
;;
;;;(progn (fmakunbound 'mon-help-parse-interactive-spec)
;;;       (unintern 'mon-help-parse-interactive-spec) )

;;; ==============================
;;; :CREATED <Timestamp: #{2009-08-20T21:30:15-04:00Z}#{09345} - by MON>
(defun mon-help-insert-documentation (&optional func-list var-list face-list alt-cookie)
  "Return documentation of symbols held by lists FUNC-LIST VAR-LIST FACE-LIST.
When non-nil ALT-COOKIE is a doc-cookie per `mon-help-function-spit-doc' spec.
Default is `*doc-cookie*'.\n
:SEE-ALSO `mon-help-function-args', `mon-help-xref-symbol-value'.\n►►►"
  (let ((fl func-list)
        (vl var-list)
        (fc-l face-list)
        (alt-c (when alt-cookie (format ":alt-cookie %s" alt-cookie)))
        (dlims)
        (the-docstrings))
    (setq dlims
          (mapcar #'(lambda (x)
                     (concat
                      "\n;;; ============================================================\n"
                      ";;; `%s' " x "\n"
                      ";;; ============================================================\n"))
                  '("<FUNCTION>" "<VARIABLE>" "<FACE>")))
    (save-excursion
      (setq the-docstrings
            (with-temp-buffer
              (when fl
                (dolist (i fl)
                  (let ((f-dlim (format (car dlims) i))
                        (int-specs (if (mon-help-parse-interactive-spec i)
                                       (concat "\n;;; " (mon-help-parse-interactive-spec i))
                                               ""))
                        (args-lst (if (mon-help-function-args i)
                                      (concat ";;; <ARG-LIST>\n;;; " (format "%S" (mon-help-function-args i)))
                                    ""))
                        (alt-ck (if alt-c
                                    (mon-help-function-spit-doc i alt-c)
                                  (mon-help-function-spit-doc i))))
                    (princ
                     (concat f-dlim (format "%s%s\n%s\n%s" args-lst int-specs (comment-divider t) alt-ck) "\n")
                     (current-buffer)))))
              (when vl
                (dolist (j vl)
                  (let ((v-dlim (format (cadr dlims) j)))
                    (princ
                     (concat v-dlim 
                             ;; :WAS (get j 'variable-documentation)  "\n")
                             (replace-regexp-in-string (concat "^" (if alt-c alt-c *doc-cookie*)) ""
                              (replace-regexp-in-string (concat (if alt-c alt-c *doc-cookie*) "$") ""
                                                        (documentation-property j 'variable-documentation) "\n")))
                     (current-buffer)))))
              (when fc-l
                (dolist (k fc-l)
                  (let ((fc-dlim (format (caddr dlims) k)))
                    (princ
                     (concat fc-dlim  (get k 'face-documentation) "\n")
                     (current-buffer)))))
              (buffer-string)))
      (insert the-docstrings))))
;;
(defalias 'mon-insert-documentation 'mon-help-insert-documentation)
;;
;;; :TEST-ME
;; (setq mon-tmp-func-l (list 'mon-insert-string-n-times 'mon-help-mon-help
;;                           'mon-insert-file-in-dirs 'mon-help-insert-documentation
;;                           'mon-insert-string-n-times))
;;
;;; :TEST-ME (mon-help-insert-documentation mon-tmp-func-l)
;;
;;;(progn (makunbound 'mon-tmp-func-l) (unintern 'mon-tmp-func-l) )

;;; ==============================
;;; :CREATED <Timestamp: Friday July 03, 2009 @ 04:53.29 PM - by MON KEY>
(defun mon-help-mon-help (&optional insertp intrp)
  "Help `mon-help-*' to help you find help references. Why not! :).\n
;; :MON-DOC-FUNCTION-LISTS
`mon-help-buffer-functions'
`mon-help-emacs-introspect'
`mon-help-file-dir-functions'
`mon-help-file-dir-functions-usage'
`mon-help-frame-functions'
`mon-help-mon-functions'
`mon-help-mon-help'
`mon-help-plist-functions'
`mon-help-plist-properties'
`mon-help-print-functions'
`mon-help-make-network-process'
`mon-help-process-functions'
`mon-help-sequence-functions'
`mon-help-server-functions'
`mon-help-type-predicates'
`mon-help-read-functions'
`mon-help-window-functions'
`mon-help-xml-functions'\n
;; :MON-DOC-SEARCHING
`mon-help-search-functions'
`mon-help-regexp-syntax'
`mon-help-syntax-class'
`mon-help-syntax-functions'\n
;; :MON-DOC-HELP
`mon-tags-apropos'
`mon-tags-naf-apropos'
`mon-help-package-keywords'\n
;; :MON-DOC-TIME
`mon-help-iso-8601'\n
;; :MON-DOC-EIEIO
`mon-help-eieio-defclass'
`mon-help-eieio-functions'
`mon-help-eieio-methods'\n
;; :MON-DOC-CL
`mon-help-CL:TIME'                        ; :SEE :FILE mon-doc-help-CL.el
`mon-help-CL:LOCAL-TIME'                  ; :SEE :FILE mon-doc-help-CL.el
`mon-help-CL:LOOP'                        ; :SEE :FILE mon-doc-help-CL.el\n
;; :MON-DOC-ASCII-ART
`mon-help-color-chart'
`mon-help-easy-menu'
`mon-help-font-lock'
`mon-help-ipv4-header'
`mon-help-widgets'\n
;; :MON-DOC-PRESENTATION
`mon-help-custom-keywords'
`mon-help-color-functions'
`mon-help-faces'
`mon-help-faces-basic'
`mon-help-faces-themes'
`mon-help-faces-font-lock'
`mon-help-font-lock'
`mon-help-font-lock-functions'
`mon-help-overlay-functions'
`mon-help-text-property-functions'
`mon-help-text-property-properties'
`mon-help-text-property-functions-ext'
`mon-help-text-property-stickyness'\n
;; :MON-DOC-KEYS
`mon-help-key-functions'
`mon-help-keys'
`mon-help-slime-keys'\n
;; :MON-DOC-CHAR-TABLES
`mon-help-binary-representation'
`mon-help-char-functions'
`mon-help-char-representation'
`mon-help-diacritics'
`mon-help-char-ascii'
`mon-help-char-iso-8859-1'
`mon-help-char-ecma-35'
`mon-help-char-ecma-48'
`mon-help-char-raw-bytes'\n
;; :MON-DOC-RECIPES
`mon-help-crontab'
`mon-help-du-incantation'
`mon-help-format-width'
`mon-help-hg-archive'
`mon-help-info-incantation'
`mon-help-install-info-incantation'
`mon-help-pacman-Q'
`mon-help-permissions'
`mon-help-rename-incantation'
`mon-help-tar-incantation'
`mon-help-unix-commands'\n
;; :MON-DOC-INTROSPECTION-AND-UTILITY
`mon-help-w32-env'
`mon-index-elisp-symbol'
`mon-help-function-args'
`mon-help-parse-interactive-spec'
`mon-help-xref-symbol-value'
`mon-help-swap-var-doc-const-val'
`mon-help-function-spit-doc'
`mon-help-insert-documentation'
`mon-insert-doc-help-tail'
`mon-insert-doc-help-cookie'
`mon-help-utils-loadtime'
`mon-help-escape-for-ewiki'
`mon-help-unescape-for-ewiki'\n
;; :MON-DOC-FACES
`mon-help-PNTR-tag'              
`mon-help-DYNATAB-tag'           
`mon-help-DYNATAB-tag'           
`mon-help-KEY-tag'               
`mon-help-COMMENT-TAG'           
`mon-help-META-tag'              
`mon-help-URL-wrap-tag'          
`mon-help-BUILTIN-tag'           
`mon-help-BUILTIN-tag'           
`mon-help-INNER-KEY-tag'         
`mon-help-OLAY-RESULT'           
`mon-help-OLAY-RESULT-string-show'
`mon-help-OLAY-RESULT-match-show'\n
;; :MON-DOC-VARIABLES
`*doc-cookie*'                                 ;<VARIABLE>
`*mon-help-interactive-spec-alist*'            ;<VARIABLE>
`*mon-iptables-alst*'                          ;<VARIABLE>
`*mon-help-reference-keys*'                    ;<VARIABLE>
`*regexp-mon-doc-help-docstring-tags-DYNAMIC*' ;<VARIABLE>
`*regexp-mon-doc-help-docstring-tags-TABLES*'  ;<VARIABLE>
`*regexp-mon-doc-help-docstring-tags*'         ;<VARIABLE>
`*regexp-mon-doc-help-comment-tags*'           ;<VARIABLE>
`*regexp-mon-doc-help-pointer-tags*'           ;<VARIABLE>
`*regexp-mon-doc-help-meta-tags*'              ;<VARIABLE>
`*regexp-clean-du-flags*'                      ;<VARIABLE>
`*regexp-symbol-defs*'                         ;<VARIABLE>
`*regexp-clean-pacman-Q*'                      ;<VARIABLE>
`*w32-env-variables-alist*'                    ;<VARIABLE>\n
:SEE-ALSO `mon-help-mon-functions'.\n►►►"
  (interactive "i\nP")
  (if (or insertp intrp)
      (mon-help-function-spit-doc 'mon-help-mon-help :insertp t)
    (message "Pass non-nil for optional arg INTRP")))
;;
(defalias 'mon-help-reference-sheet 'mon-help-mon-help)
;;
;;; :TEST-ME (mon-help-mon-help)
;;; :TEST-ME (mon-help-mon-help t)
;;; :TEST-ME (describe-function 'mon-help-mon-help)
;;; :TEST-ME (apply 'mon-help-mon-help '(t))

;;; ==============================
;;; :CREATED <Timestamp: #{2010-01-22T16:11:37-05:00Z}#{10035} - by MON KEY>
(defun mon-help-mon-functions (&optional insertp intrp)
  "Incomplete list of MON functions.\n 
;; :MON-BUFFER
`mon-g2be'
`mon-buffer-exists-so-kill'
`mon-print-in-buffer-if-p'
`mon-buffer-written-p'
`mon-buffer-exists-p'
`mon-buffer-name->kill-ring'
`mon-with-file-buffer'
`mon-get-proc-buffers-directories',
`mon-get-buffers-directories'
`mon-get-buffer-parent-dir'
`mon-get-new-buffer-w-stamp',
`mon-string-split-buffer-name'
`mon-string-split-buffer-parent-dir'\n
;; :MON-COLUMN
`mon-indent-lines-from-to-col'
`mon-line-strings-pipe-to-col'
`mon-string-fill-to-col'
`mon-comment-lisp-to-col'
`mon-mysql-cln-pipes-map-col-field'
`mon-mysql-csv-map-col-field'
`mon-mysql-get-field-col'
`mon-rectangle-columns'
`mon-rectangle-sum-column'
`mon-show-columns'\n
;; :MON-RECTANGLE
`mon-rectangle-apply-on-region-points'
`mon-rectangle-capitalize'
`mon-rectangle-columns'
`mon-rectangle-downcase'
`mon-rectangle-operate-on'
`mon-rectangle-sum-column'
`mon-rectangle-upcase'\n
;; :MON-COMMNET\n
;; :MON-INSERT\n
;; :MON-LINE\n
`mon-line-bol-is-eol'
`mon-line-count-matchp'
`mon-line-count-region'
`mon-line-count-buffer'
`mon-line-dolines'
`mon-line-drop-in-words'
`mon-line-end-or-code-end'
`mon-line-eol-is-eob'
`mon-line-find-duplicates'
`mon-line-get-next'
`mon-line-indent-from-to-col'
`mon-line-length-max'
`mon-line-next-bol-is-eol'
`mon-line-number-region-incr'
`mon-line-previous-bol-is-eol'
`mon-line-string-insert-chars-under'
`mon-line-string-rotate-name'
`mon-line-string-rotate-namestrings'
`mon-line-string-rotate-namestrings-combine'
`mon-line-string-unrotate-namestrings'
`mon-line-strings'
`mon-line-strings-bq-qt-sym-bol'
`mon-line-strings-indent-to-col'
`mon-line-strings-one-list'
`mon-line-strings-pipe-bol'
`mon-line-strings-qt-region'
`mon-line-strings-region'
`mon-line-strings-to-list'
`mon-line-test-content'\n
;; :MON-LINE-PIPED
`mon-cln-piped-list'
`mon-line-strings-pipe-to-col'
`mon-line-strings-pipe-bol'
`naf-backup-the-list'
`mon-delete-back-up-list'
`mon-pipe-list'\n
;; :MON-REPLACE
`mon-regexp-map-match'
`mon-regexp-map-match-in-region'
`mon-replace-char-in-string'
`mon-string-split-on-regexp'
`mon-string-csv-regexp'
`mon-string-rotate-to-regexp'
`mon-string-sub-old->new'
`mon-regexp-map-match'
`mon-replace-strings'
`mon-replace-regexp-while'
`mon-replace-string-while'
`mon-regexp-filter'
`mon-replace-region-regexp-lists'
`mon-replace-region-regexp-lists-nonint'
`mon-walk-regexps-in-file'
`mon-replace-regexps-in-file-list'
`replace-string-pairs-region-no-props'
`replace-string-pairs-region3'\n
`mon-replace-string-pairs-region-no-insert'
`mon-exchange-slash-and-backslash'
`mon-cln-control-M'
`mon-cln-csv-fields'
`mon-cln-file-name-string'
`mon-cln-html-chars'
`mon-cln-html-tags'
`mon-cln-iso-latin-1'
`mon-cln-mail-headers'
`mon-cln-up-colon'
`mon-cln-uniq-lines'
`mon-cln-whitespace'
`mon-cln-xml<-parsed'
`mon-cln-xml<-parsed-strip-nil'\n
;; MON-REPLACE-NAF-MODE
`mon-cln-tgm-xml-LF'
`mon-cln-piped-list'
`mon-cln-philsp'
`mon-cln-ulan'
`mon-cln-imdb'
`mon-cln-loc'
`mon-cln-wiki'
`mon-cln-bib'
`mon-delete-back-up-list'
`mon-replace-common-abbrevs'\n
;; :MON-REPLACE-DATES
`mon-ital-date-to-eng'
`mon-num-to-month'
`mon-num-to-month-whitespace'
`mon-month-to-num'
`mon-abr-to-month'
`mon-defranc-dates'\n
;; :MON-REPLACE-TRANSLATE
`mon-defranc-places'
`mon-cln-benezit'
`mon-cln-benezit-fields'\n
;; :MON-REPLACE-CHAR-ENCODING
`mon-make-iso-latin-1-approximation'
`mon-trans-cp1252-to-latin1'
`mon-cln-iso-latin-1'
`deftransmogrify'
`mon-transmogrify'\n
;; :MON-REPLACE-WHITESPACE
`mon-cln-tgm-xml-LF'
`mon-cln-spc-tab-eol'
`mon-cln-spc-tab-at-eol-in-region'
`mon-cln-blank-lines'
`mon-cln-BIG-whitespace'
`mon-cln-whitespace'
`mon-cln-trail-whitespace'
`mon-kill-whitespace'
`mon-num-to-month-whitespace'\n
;; :MON-REPLACE-CASE
`mon-downcase-hex-values'
`mon-upcase-commented-lines'
`mon-toggle-case-regexp-region'
`mon-toggle-case-regexp'
`mon-downcase-regexp-region'
`mon-upcase-regexp-region'
`mon-downcase-regexp'
`mon-upcase-regexp'\n
;; :MON-STRING
`mon-string->strings-splice-sep'
`mon-string->symbol'
`mon-string-after-index'
`mon-string-alpha-list'
`mon-string-chop-spaces'
`mon-string-combine-and-quote'
`mon-string-csv-regexp'
`mon-string-csv-rotate'
`mon-string-fill-to-col'
`mon-string-from-hex-list'
`mon-string-from-sequence'
`mon-string-from-symbol'
`mon-string-has-suffix'
`mon-string-ify-current-line'
`mon-string-ify-list'
`mon-string-incr'
`mon-string-incr-padded'
`mon-string-index'
`mon-string-infix'
`mon-string-insert-string-at-idx'
`mon-string-justify-left'
`mon-string-permute'
`mon-string-permute-line'
`mon-string-position'
`mon-string-read-match-string'
`mon-string-repeat'
`mon-string-replace-char'
`mon-string-rotate-name'
`mon-string-rotate-to-regexp'
`mon-string-set-char-at-idx'
`mon-string-sort-descending'
`mon-string-splice-sep'
`mon-string-split-and-unquote'
`mon-string-split-line'
`mon-string-split-on-regexp'
`mon-string-sub-old->new'
`mon-string-to-hex-list'
`mon-string-to-hex-string'
`mon-string-to-regexp'
`mon-string-to-sequence'
`mon-string-to-symbol'
`mon-string-upto-index'
`mon-string-wonkify'
`mon-string<-symbol'
`mon-canonical-string'\n
;; :MON-LIST-MANIPULATION
`mon-intersection'
`mon-combine'
`mon-map-append'
`mon-maptree'
`mon-transpose'
`mon-flatten'
`mon-recursive-apply'
`mon-sublist'
`mon-sublist-gutted'
`mon-remove-dups'
`mon-assoc-replace'
`mon-moveq'
`mon-elt->'
`mon-elt-<'
`mon-elt->elt'
`mon-elt-<elt'\n
;; :MON-HASHTABLE
`mon-face-bold>normal'
`mon-insert-naf-mode-faces-as-displayed'
`mon-hash-add-uniquify'
`mon-hash-all-keys'
`mon-hash-all-values'
`mon-hash-describe'
`mon-hash-describe-descend'
`mon-hash-get-items'
`mon-hash-get-keys'
`mon-hash-get-string-keys'
`mon-hash-get-symbol-keys'
`mon-hash-get-values'
`mon-hash-has-key'
`mon-dir-hash-images'
`mon-hash-make-size'
`mon-hash-put-CL'
`mon-hash-readlines-buffer'
`mon-hash-readlines-file'
`mon-hash-table-complete'
`mon-hash-to-list'
`mon-hash<-vector'\n
;; :MON-ENVIRONMENT
`mon-get-env-vars-strings'
`mon-get-env-vars-symbols'
`mon-get-env-vars-emacs'
`mon-get-system-specs'
`mon-insert-system-type-cond'
`mon-help-emacs-introspect'\n
;; :MON-FILE-DIRECTORY
`mon-build-path-for-load-path'
`mon-cln-file-name-string'
`mon-file-stamp'
`mon-file-stamp-buffer-filename'
`mon-file-stamp-minibuffer'
`mon-format-jg-file-for-write'
`mon-get-file-mod-times'
`mon-insert-dirs-in-path'
`mon-insert-file-in-dirs'
`mon-insert-naf-file-in-dirs'
`mon-make-jg-dir-in-path'
`mon-toggle-dired-dwim-target'
`mon-write-jg-file-in-path' \n
;; :MON-PROCESS
`mon-insert-sys-proc-list'
`mon-get-sys-proc-list'
`mon-get-proc-w-name'
`mon-get-process'\n
;; :MON-LOADTIME
`mon-help-utils-loadtime'
`mon-bind-nefs-photos-at-loadtime'
`mon-bind-cifs-vars-at-loadtime'
`mon-bind-doc-help-proprietery-vars-at-loadtime'
`mon-bind-iptables-vars-at-loadtime'
`mon-set-register-tags-loadtime',
`mon-CL-cln-colon-swap'\n
;; :MON-TEMPLATE
`mon-insert-drive-transfer-template'
`mon-insert-file-template'
`mon-insert-texi-template'
`mon-insert-CL-package-template'
`mon-insert-defclass-template'
`mon-insert-ebay-template'
`mon-insert-hgignore-template'
`mon-insert-lisp-CL-file-template'
`mon-insert-naf-mode-class-template'
`mon-insert-naf-mode-constant-template'
`mon-insert-naf-mode-face-template'
`mon-insert-naf-mode-file-template'
`mon-insert-naf-mode-var-const-templt'
`mon-insert-naf-mode-xref-template'
`mon-insert-smith-poster-template'\n
;; :MON-FACE
`mon-help-naf-mode-faces'\n
;; :MON-OVERLAY
`mon-help-find-result-for-overlay'
`mon-help-overlay-for-example'
`mon-help-overlay-on-region'
`mon-help-overlay-result'
`mon-nuke-overlay-buffer'\n
;; :MON-TEXT-PROPERTY
`mon-get-all-face-property-change'
`mon-get-next-face-property-change'
`mon-get-next-face-property-change-if'
`mon-get-text-properties-region'
`mon-get-text-properties-region-to-kill-ring'
`mon-get-text-properties-print'
`mon-get-text-properties-read-temp'
`mon-get-text-properties-parse-buffer'
`mon-get-text-properties-parse-sym'
`mon-get-text-properties-parse-buffer-or-sym'
`mon-get-text-properties-elisp-string'
`mon-get-text-properties-elisp-string-pp'
`mon-list-all-properties-in-buffer'
`mon-nuke-text-properties-buffer'
`mon-nuke-text-properties-region'
`mon-remove-single-text-property'
`mon-remove-text-property'
`mon-test-props'\n
;; :MON-TEST
`mon-build-copyright-string-TEST'
`mon-build-user-name-example-TEST'
`mon-drive-transfer-template-TEST'
`mon-file-stamp-buffer-filename-TEST'
`mon-help-keys-wikify-TEST'
`mon-help-propertize-regexp-symbol-defs-TEST'
`mon-help-propertize-tags-TEST'
`mon-help-regexp-symbol-defs-TEST'
`mon-help-wget-cl-pkgs-TEST'
`mon-insert-lisp-testme'
`mon-insert-lisp-testme-fancy'
`mon-insert-test-cases'
`mon-line-strings-to-list-TEST'
`mon-user-system-conditionals-TEST'
`mon-wget-list-to-script-TEST'
`mon-with-inhibit-buffer-read-only-TEST'\n
;; :MON-WORD\n\n
:SEE-ALSO `mon-help-mon-help'.\n►►►"
(interactive "i\nP")
  (if (or insertp intrp)
      (mon-help-function-spit-doc 'mon-help-mon-functions :insertp t)
    (message "Pass non-nil for optional arg INTRP")))
;;
;;; :TEST-ME (mon-help-mon-functions )
;;; :TEST-ME (mon-help-mon-functions t)
;;; :TEST-ME (describe-function 'mon-help-mon-functions)
;;; :TEST-ME (apply 'mon-help-mon-functions nil '(t))

;;; ==============================
;;; :CREATED <Timestamp: Thursday July 02, 2009 @ 02:34.14 PM - by MON KEY>
(defun mon-help-emacs-introspect (&optional insertp intrp)
  "Variables and functions related to what this Emacs knows about this Emacs.
Unless indicated as a '<FUNCTION>' items listed are '<VARIABLE>'.\n
;; :EMACS-ENVIRONMENT
`emacs-uptime'           ;<FUNCTION>
`emacs-priority'
`initial-environment'
`emacs-init-time'
`features'
`inhibit-x-resources'
`init-file-had-error'
`init-file-user'
`getenv'
`setenv'
`system-shell'
`system-type'\n
;; :EMACS-ENVIRONMENT-PATHS-FILES
`current-load-list'
`load-path'
`load-history'
`load-force-doc-strings'
`invocation-directory'
`invocation-name'
`exec-path'\n
;; :EMACS-STATE
`cons-cells-consed'
`floats-consed'
`intervals-consed'
`misc-objects-consed'
`strings-consed'
`string-chars-consed'
`vector-cells-consed'
`obarray'
`memory-full'
`memory-signal-data'
`max-specpdl-size'
`garbage-collect'
`gc-cons-threshold'
`gc-cons-percentage'\n
`this-command'
`last-command'
`load-average'
`num-input-keys'
`num-nonmacro-input-events'
;; :EMACS-IN-OUT
`initial-window-system'
`glyph-table'
`charset-list'
`keyboard-type'
`global-map'
`null-device'\n
;; :EMACS-BUILD
`preloaded-file-list'
`emacs-build-system'
`emacs-build-time'
`emacs-major-version'
`emacs-minor-version'
`emacs-version'          ;<FUNCTION>
`system-configuration'\n
;; :EMACS-BUILD-PATHS-AND-FILES
`build-files'
`configure-info-directory'
`data-directory'
`doc-directory'
`exec-directory'
`installation-directory'
`Info-default-directory-list'
`internal-doc-file-name'
`path-separator'
`source-directory'\n
;; :EMACS-ENVIRONMENT-MON-LOCAL
`mon-get-env-vars-strings'
`mon-get-env-vars-symbols'
`mon-get-env-vars-emacs'
`mon-get-system-specs'
`mon-help-emacs-introspect'\n
:SEE-ALSO `mon-help-load-functions', `mon-help-mon-help',
`mon-help-mon-functions', `mon-help-package-keywords'.\n►►►"
  (interactive "i\nP")
  (if (or insertp intrp)
      (mon-help-function-spit-doc 'mon-help-emacs-introspect :insertp t)
    (message "Pass non-nil for optional arg INTRP")))
;;
;;; :TEST-ME (mon-help-emacs-introspect t)

;;; ==============================
;;; (dolist (i
;;;          (list 'abbrev 'alloc 'applications 'auto-save 'bib 'c 'calendar 'comm
;;;          'convenience 'data 'debug 'development 'dired 'display 'dnd 'docs
;;;          'editing 'editing-basics 'emacs 'emulations 'environment 'execute
;;;          'extensions 'external 'faces 'files 'frames 'games 'hardware 'help
;;;          'hypermedia 'i18n 'installation 'internal 'keyboard 'languages 'limits
;;;          'lisp 'local 'mail 'maint 'matching 'menu 'mode-line 'mouse 'mule
;;;          'multimedia 'news 'oop 'outlines 'processes 'processes-basics
;;;          'programming 'terminals 'tex 'tools 'undo 'unix 'windows 'wp 'x))
;;;   (princ (format "%s %s\n---\n" i (mon-help-function-spit-doc i :do-group t))
;;;          (current-buffer)))
;;; :CREATED <Timestamp: #{2009-09-03T19:27:41-04:00Z}#{09364} - by MON KEY>
(defun mon-help-package-keywords (&optional insertp intrp)
  "Find packages matching a given keyword using `finder-by-keyword'.\n
Keyword Search for Lisp Libraries with \\[finder-by-keyword] command
search the standard Emacs Lisp libraries by topic keywords.
:SEE info node `\(emacs\)Library Keywords\'\.\n
:EXAMPLE\n\(finder-by-keyword\)\n
Here is a partial list of keywords for use with finder-by-keyword:\n
abbrev        Abbreviation handling, typing shortcuts, macros.
alloc         Storage allocation and gc for GNU Emacs Lisp interpreter.
applications  Applications written in Emacs.
auto-save     Preventing accidental loss of data.
bib           Code related to the `bib' bibliography processor.
c             Support for the C language and related languages.
calendar      Calendar and time management support.
comm          Communications, networking, remote access to files.
convenience   Convenience features for faster editing.
data          Support for editing files of data.
development   Support for further development of Emacs.
dired         Directory \"Editor\"
display       How characters are displayed in buffers.
dnd           Handling data from drag and drop.
docs          Support for Emacs documentation.
editing       Basic text editing facilities.
emacs         Customization of the One True Editor.
emulations    Emulations of other editors.
environment   Fitting Emacs with its environment.
execute       Executing external commands.
extensions    Emacs Lisp language extensions.
external      Interfacing to external utilities.
faces         Support for multiple fonts.
files         Support for editing and manipulating files.
frames        Support for Emacs frames and window systems.
games         Games, jokes and amusements.
hardware      Support for interfacing with exotic hardware.
help          Support for on-line help systems and Help commands.
hypermedia    Support for links between text or other media types.
i18n          Internationalization and alternate character-set support.
installation  Emacs installation.
internal      Code for Emacs internals, build process, defaults.
keyboard      Input from the keyboard.
languages     Specialized modes for editing programming languages.
lisp          Lisp support, including Emacs Lisp.
local         Code local to your site.
mail          Modes for electronic-mail handling.
maint         Maintenance aids for the Emacs development group.
matching      Various sorts of searching and matching.
menu 	      Input from the menus.
mode-line     Content of the modeline.
mouse 	      Input from the mouse.
mule 	      MULE Emacs internationalization.
multimedia    Non-textual support, specifically images and sound.
news 	      Support for netnews reading and posting.
oop 	      Support for object-oriented programming.
outlines      Support for hierarchical outlining.
processes     Process, subshell, compilation, and job control support.
programming   Support for programming in other languages.
terminals     Support for terminal types.
tex           Supporting code related to the TeX formatter.
tools         Programming tools.
unix          Front-ends/assistants for, or emulators of, UNIX-like features.
windows       Windows within a frame.
wp            Word processing.
x 	      The X Window system.\n
:SEE :FILE finder.el
:SEE-ALSO. `finder-known-keywords'.\n►►►"
  (interactive "i\nP")
  (if (or insertp intrp)
      (mon-help-function-spit-doc 'mon-help-package-keywords :insertp t)
    (message "Pass non-nil for optional arg INTRP")))
;;
(defalias 'mon-help-finder-keywords 'mon-help-package-keywords)
;;
;;; :TEST-ME (mon-help-package-keywords)
;;; :TEST-ME (mon-help-package-keywords t)
;;; :TEST-ME (describe-function 'mon-help-package-keywords)
;;; :TEST-ME (apply 'mon-help-package-keywords '(t))

;;; ==============================
;;; :CREATED <Timestamp: #{2009-08-08T13:00:11-04:00Z}#{09326} - by MON KEY>
(defun mon-help-regexp-syntax (&optional insertp intrp)
  "Regexp Syntax overview - simplified!\n
:SEE info node `(elisp)Syntax of Regexps' for discussion.\n
;; :REGEXP-SPECIAL-CHARS
\.              -> match ANY
\*              -> match Preceeding - ALL
\+              -> match Preceeding - AT LEAST once.
\?              -> match Preceeding - once OR not at all
\*\? \+\? \?\?       -> match Preceeding - NON-GREEDY
\\=[...\]          -> Character ALTERNATIVE
\\=[^...\]         -> COMPLEMENTed Character Alternative
^              -> match BOL
$              -> match EOL
\\              -> backslash QUOTE special chars\n
;; :REGEXP-BACKSLASH-CONSTRUCTS
\\|             -> ALTERNATIVE
\\\\={m\\}          -> REPEAT match exactly N times
\\\\={m,n\\}        -> REPEAT match n-N times
\\( ... \\)      -> GROUPING construct
\\(\?: ... \\\)    -> SHY Grouping construct
\\(\?NUM: ... \\) -> Explicitly NUMBERED Group
\\digit         -> match DIGITH occurence
\\w             -> match any WORD CONSTITUENT char
\\W             -> match any char NOT a Word Constituent
\\Scode         -> match any char with SYNTAX code
\\Scode         -> match any char NOT with Syntax code
\\cc            -> match any char with CATEGORY
\\Cc            -> match any char NOT with Category
\\`             -> match EMPTY String
\\\\\='             -> match Empty String only at EOB
\\\\==             -> match Empty String only at POINT
\\b             -> match Empty String only at BEGINNING OR END of Word
\\B             -> match Empty String NOT at beginning or end of Word
\\=\\<             -> match Empty String only at BEGINNING of Word
\\=\\>             -> match Empty String only at END of Word
\\_<            -> match Empty String only at BEGINNING of Symbol
\\_>            -> match Empty String only at END of Symbol\n
;; :REGEXP-CHARACTER-CLASSES
\\=[:ascii:] [:nonascii:]
\\=[:alnum:] [:digit:] [:xdigit:]
\\=[:alpha:] [:lower:] [:upper:]
\\=[:blank:] [:cntrl:] [:graph:]
\\=[:print:] [:punct:] [:space:] [:word:]
\\=[:multibyte:] [:unibyte:]\n
:SEE-ALSO `mon-help-search-functions', `mon-help-syntax-class',
`mon-help-syntax-functions'.\n►►►"
  (interactive "i\nP")
  (if (or insertp intrp)
      (mon-help-function-spit-doc 'mon-help-regexp-syntax :insertp t)
    (message "Pass non-nil for optional arg INTRP")))
;;
;;; :TEST-ME (describe-function 'mon-help-regexp-syntax)
;;; :TEST-ME (mon-help-regexp-syntax)
;;; :TEST-ME (mon-help-regexp-syntax t)
;;; :TEST-ME (apply 'mon-help-regexp-syntax '(t))

;;; ==============================
;;; :CREATED <Timestamp: Wednesday June 17, 2009 @ 04:58.00 PM - by MON KEY>
(defun mon-help-syntax-class (&optional insertp intrp)
  "Syntax class mappings.\n
:SEE info node `(elisp)Syntax Table Internals'
:SEE `syntax_spec_code', `syntax_code_spec' in:
:FILE syntax.c\n
List one maps from Int->Class->Code-Char.
List two maps Syntax class code character arguments to SYNTAX.\n
:INT    :CLASS              :CODE-CHAR
0       whitespace         \(designated by ` ' or `-'\)
1       punctuation        \(designated by `.'\)
2       word               \(designated by `w'\)
3       symbol             \(designated by `_'\)
4       open parenthesis   \(designated by `\('\)
5       close parenthesi   \(designated by `\)'\)
6       expression prefi   \(designated by `''\)
7       string quote       \(designated by `\"'\)
8       paired delimiter   \(designated by `$'\)
9       escape             \(designated by `\\'\)
10      character quote    \(designated by `/'\)
11      comment-start      \(designated by `<'\)
12      comment-end        \(designated by `>'\)
13      inherit            \(designated by `@'\)
14      generic comment    \(designated by `!'\)
15      generic string     \(designated by `|'\)\n
;; :SYNTAX-CLASS-TABLE
SYNTAX-CLASS  CODE CHARACTER ARGUMENTS to SYNTAX include:\n
:SYNTAX-CLASS whitespace character; \(designated by ` ' or `-'\)
:SYNTAX-CLASS word constituent; \(designated by `w'\)
:SYNTAX-CLASS symbol constituent; \(designated by `_'\)
:SYNTAX-CLASS punctuation character; \(designated by `.'\)
:SYNTAX-CLASS open parenthesis character; \(designated by `\('\)
:SYNTAX-CLASS close parenthesis character; \(designated by `\)'\)
:SYNTAX-CLASS string quote; \(designated by `\"'\)
:SYNTAX-CLASS escape-syntax character: \(designated by `\\'\)
:SYNTAX-CLASS character quote; \(designated by `/'\)
:SYNTAX-CLASS paired delimiter; \(designated by `$'\)
:SYNTAX-CLASS expression prefix; \(designated by `''\)
:SYNTAX-CLASS comment starter; \(designated by `<'\)
:SYNTAX-CLASS comment ender; \(designated by `>'\)
:SYNTAX-CLASS inherit standard syntax; \(designated by `@'\)
:SYNTAX-CLASS generic comment delimiter; \(designated by `!'\)
:SYNTAX-CLASS generic string delimiter; \(designated by `|'\)\n
:SEE-ALSO `mon-help-syntax-functions', `mon-help-search-functions',
`mon-help-regexp-syntax'.\n►►►"
  (interactive "i\nP")
  (if (or insertp intrp)
      (mon-help-function-spit-doc 'mon-help-syntax-class :insertp t)
    (message "Pass non-nil for optional arg INTRP")))
;;
;;; :TEST-ME (mon-help-syntax-class)
;;; :TEST-ME (mon-help-syntax-class t)
;;; :TEST-ME (describe-function 'mon-help-syntax-class)
;;; :TEST-ME (apply 'mon-help-syntax-class '(t))

;;; ==============================
;;; :CREATED <Timestamp: #{2010-02-22T17:28:44-05:00Z}#{10081} - by MON KEY>
(defun mon-help-syntax-functions (&optional insertp intrp)
  "Functions related to syntax and syntax tables.\n
:SEE info node `(elisp)Syntax Tables'\n
;; :SYNTAX-MOTION
`backward-prefix-chars' 
`forward-same-syntax'
`skip-syntax-forward'
`skip-syntax-backward'\n
;; :SYNTAX-INSPECT
`get-char-property'
`char-syntax'
`describe-syntax'
`syntax-after'
`syntax-class'
`syntax-table'
`syntax-table-p'\n
;; :SYNTAX-HANDLERS
`copy-syntax-table'
`make-syntax-table'
`modify-syntax-entry'
`set-syntax-table'
`string-to-syntax'
`with-syntax-table'\n
;; :SYNTAX-CATEGORY
`define-category'
`describe-categories'
`category-docstring'
`category-set-mnemonics'
`char-category-set'
`get-unused-category'
`category-table'
`category-table-p'
`make-category-table'
`make-category-set'
`modify-category-entry'
`set-category-table'
`standard-category-table'\n
;; :SYNTAX-PARSING
`parse-partial-sexp'
`parse-sexp-lookup-properties'
`syntax-ppss'
`syntax-ppss-after-change-function'
`syntax-ppss-context'
`syntax-ppss-debug'
`syntax-ppss-depth'
`syntax-ppss-flush-cache'
`syntax-ppss-stats'
`syntax-ppss-toplevel-pos'\n
;; :SYNTAX-TABLES
`c-mode-syntax-table'
`emacs-lisp-mode-syntax-table'  ;<VARIABLE> 
`standard-syntax-table'         ;<FUNCTION> 
`text-mode-syntax-table'\n
;; :SYNTAX-VARIABLES 
`before-change-functions'
`font-lock-beginning-of-syntax-function'
`font-lock-syntactic-keywords'
`multibyte-syntax-as-symbol'
`parse-sexp-ignore-comments'
`syntax-begin-function'
`syntax-ppss-last'
`syntax-ppss-max-span'
`syntax-ppss-stats'\n
;; :SYNTAX-PROPERTY
`syntax-table'                ;<PROPERTY>
`text-clone-syntax'           ;<PROPERTY>\n
;; :SYNTAX-MON-LOCAL
`mon-line-test-content'\n
:SEE-ALSO `mon-help-syntax-class', `mon-help-regexp-syntax'
`mon-help-search-functions'.\n►►►"
  (interactive "i\nP")
  (if (or insertp intrp)
      (mon-help-function-spit-doc 'mon-help-syntax-functions :insertp t)
      (message "Pass non-nil for optional arg INTRP")))
;;
;;; :TEST-ME (mon-help-syntax-functions)
;;; :TEST-ME (mon-help-syntax-functions t)
;;; :TEST-ME (describe-function 'mon-help-syntax-functions)
;;; :TEST-ME (apply 'mon-help-syntax-functions '(t))

;;; ==============================
;;; :CREATED <Timestamp: #{2009-08-07T18:16:16-04:00Z}#{09325} - by MON KEY>
(defun mon-help-search-functions (&optional insertp intrp)
  "Common functions, vars, commands for searching, replacing, substituting.\n
:SEE info node `(elisp)Regexp Search'.\n
;; :SEARCH
`search-forward'
`search-backward'
`search-forward-regexp'  ;-> `re-search-forward'  :SEE-ALSO `posix-search-forward'
`search-backward-regexp' ;-> `re-search-backward' :SEE-ALSO `posix-search-backward'
`word-search-forward'
`word-search-backward'\n
;; :SEARCH-INSPECT
`looking-at'             ; :SEE-ALSO `posix-looking-at'
`looking-back'
`subregexp-context-p'\n
;; :SEARCH-MATCH-DATA
`match-end'
`match-data'
`match-beginning'
`match-string'
`match-string-no-properties'
`match-substitute-replacement'
`replace-match'
`replace-match-data'
`replace-match-maybe-edit'
`replace-match-string-symbols'
`save-match-data'
`set-match-data'\n
;; :SEARCH-REPLACE-ACTIONS
`flush-lines'
`keep-lines'
`replace'
`replace-rectangle'
`replace-regexp'
`replace-string'
`replace-regexp-in-string'
`replace-eval-replacement'
`replace-loop-through-replacements'
`perform-replace'
`map-query-replace-regexp'
`filter-buffer-substring'\n
;; :SEARCH-STRINGS
`compare-strings'
`string-match'           ; :SEE-ALSO `posix-string-match'
`string-match-p'
`string-equal'
`string='\n
;; :SEARCH-MODIFY
`regexp-opt'
`regexp-opt-depth'
`regexp-quote'
`replace-quote'\n
;; :SEARCH-SUBSTITUTION
`subst-char-in-region'
`subst-char-in-string'
`translate-region'\n
;; :SEARCH-DIRED
`dired-do-copy-regexp'
`dired-do-create-files'
`dired-do-create-files-regexp'
`dired-do-isearch'
`dired-do-isearch-regexp'
`dired-do-query-replace-regexp'
`dired-do-rename-regexp'
`dired-do-search'
`dired-flag-files-regexp'
`dired-glob-regexp'
`dired-mark-files-containing-regexp'
`dired-mark-files-regexp'
`dired-isearch-filenames'
`dired-isearch-filenames-regexp'\n
;; :SEARCH-TAGS
`tags-search'
`tags-query-replace'\n
;; :SEARCH-VARIABLES
`buffer-substring-filters'
`search-spaces-regexp'
`case-replace'
`case-fold-search'
`default-case-fold-search'
`page-delimiter'
`paragraph-separate'
`paragraph-start'
`regexp-search-ring'
`search-upper-case'
`search-invisible'
`search-ring'
`sentence-end'                  ; :NOTE Also a <FUNCTION>
`sentence-end-base'
`sentence-end-double-space'
`sentence-end-without-space'
`sentence-end-without-period'\n
;; :SEARCH-MON-LOCAL
`replace-in-string-mon'
`replace-char-in-string-mon'
`mon-walk-regexps-in-file'
`mon-replace-regexps-in-file-list'
`mon-string-split-on-regexp'
`mon-string-csv-regexp'
`mon-string-rotate-to-regexp'
`mon-string-sub-old->new'
`replace-string-pairs-region-no-props'
`replace-string-pairs-region3'\n
:SEE-ALSO `mon-help-regexp-syntax', `mon-help-syntax-functions',
`mon-help-syntax-class'.\n►►►"
  (interactive "i\nP")
  (if (or insertp intrp)
      (mon-help-function-spit-doc 'mon-help-search-functions :insertp t)
    (message "Pass non-nil for optional arg INTRP")))
;;
;;; :TEST-ME (mon-help-search-functions)
;;; :TEST-ME (mon-help-search-functions t)
;;; :TEST-ME (apply 'mon-help-search-functions '(t))


;;; ==============================
;;; :CREATED <Timestamp: #{2010-05-14T08:00:09-04:00Z}#{10195} - by MON KEY>
(defun mon-help-hooks (&optional insertp intrp)
"A list of common Emacs hooks.\n
:SEE info node `(emacs)Hooks'
:SEE info node `(elisp)Hooks'
:SEE info node `(elisp)Standard Hooks'\n
;; :HOOK-FUNCTIONS
`add-hook'
`delay-mode-hooks'
`make-local-hook'
`remove-hook'
`run-hook-with-args'
`run-hook-with-args-until-failure'
`run-hook-with-args-until-success'
`run-hooks'
`run-mode-hooks'
`run-mode-hooks'
`with-wrapper-hook'\n
;; :HOOKS
`abbrev-expand-functions'
`activate-mark-hook'
`activate-menubar-hook'
`after-change-functions'
`after-change-major-mode-hook'
`after-init-hook'
`after-insert-file-functions'
`after-make-frame-functions'
`after-revert-hook'
`after-save-hook'
`after-setting-font-hook'
`auto-fill-function'
`auto-save-hook'
`before-change-functions'
`before-hack-local-variables-hook'
`before-init-hook'
`before-make-frame-hook'
`before-revert-hook'
`before-save-hook'
`blink-paren-function'
`buffer-access-fontify-functions'
`bytecomp-load-hook'
`change-major-mode-hook'
`clone-buffer-hook'
`clone-indirect-buffer-hook'
`command-hook-internal'
`command-line-functions'
`comment-indent-function'
`compilation-start-hook'
`completion-setup-hook'
`custom-define-hook'
`deactivate-mark-hook'
`delay-mode-hooks'             ; :NOTE Also a function.
`delayed-mode-hooks'
`delete-frame-functions'
`delete-frame-hook'
`delete-terminal-functions'
`desktop-after-read-hook'
`desktop-no-desktop-file-hook'
`desktop-save-hook'
`dired-load-hook'
`disabled-command-function'
`disabled-command-hook'
`display-time-hook'
`echo-area-clear-hook'
`emacs-startup-hook'
`eshell-pre-command-hook'
`exit-language-environment-hook'
`find-file-hook'
`find-file-hooks'
`find-file-not-found-functions'
`find-file-not-found-hooks'
`find-function-after-hook'
`find-tag-hook'
`first-change-hook'
`font-lock-beginning-of-syntax-function'
`font-lock-fontify-buffer-function'
`font-lock-fontify-region-function'
`font-lock-mark-block-function'
`font-lock-syntactic-face-function'
`font-lock-unfontify-region-function'
`grep-setup-hook'
`hack-local-variables-hook'
`insert-behind-hooks'
`insert-in-front-hooks'
`kbd-macro-termination-hook'
`kill-buffer-hook'
`kill-buffer-query-functions'
`kill-emacs-hook'
`kill-emacs-query-functions'
`lisp-indent-function'
`lisp-interaction-mode-hook'
`local-write-file-hooks'
`menu-bar-update-hook'
`message-mode-hook'
`minibuffer-exit-hook'
`minibuffer-setup-hook'
`mode-line-hook'
`modification-hooks'
`mouse-leave-buffer-hook'
`mouse-position-function'
`next-error-hook'
`post-command-hook'
`post-gc-hook'
`pre-abbrev-expand-hook'
`pre-command-hook'
`resume-tty-functions'
`set-language-environment-hook'
`special-mode-hook'
`suspend-hook'
`suspend-resume-hook'
`suspend-tty-functions'
`temp-buffer-setup-hook'
`temp-buffer-show-function'
`temp-buffer-show-hook'
`term-setup-hook'
`tooltip-hook'
`unload-feature-special-hooks'
`url-load-hook'
`window-configuration-change-hook'
`window-scroll-functions'
`window-setup-hook'
`window-size-change-functions'
`write-contents-functions'
`write-contents-hooks'
`write-file-functions'
`write-file-hooks'
`write-region-annotate-functions'\n
;; :HOOKS-MODE
`Info-mode-hook'
`apropos-mode-hook'
`change-log-mode-hook'
`compilation-mode-hook'
`completion-list-mode-hook'
`custom-mode-hook'
`diff-mode-hook'
`dired-mode-hook'
`emacs-lisp-mode-hook'
`help-mode-hook'
`lisp-mode-hook'
`text-mode-hook'
`view-mode-hook'
:SEE-ALSO .\n►►►"
(interactive "i\nP")
  (if (or insertp intrp)
      (mon-help-function-spit-doc 'mon-help-hooks :insertp t)
    (message "Pass non-nil for optional arg INTRP")))
;;
;;; :TEST-ME (mon-help-hooks )
;;; :TEST-ME (mon-help-hooks )
;;; :TEST-ME (mon-help-hooks )


;;; ==============================
;;; :CREATED <Timestamp: #{2010-02-27T15:14:24-05:00Z}#{10086} - by MON KEY>
(defun mon-help-file-dir-functions (&optional insertp intrp)
  "List of functions related to files and directories.\n
:SEE info node `(elisp)Files'\n
;; :FILE-DIRECTORY-ACTION
`cd'
`cd-absolute'
`browse-url-of-file'
`byte-compile-file'
`confirm-nonexistent-file-or-buffer'
`copy-file'
`file-local-copy'
`insert-file'
`load-file'
`process-file'
`start-file-process'
`view-file'\n
;; FILE-DIRECTORY-ACTION-DESTRUCTIVE
`append-to-file'
`clear-visited-file-modtime'
`delete-file'
`make-directory'
`rename-file'
`set-file-modes'
`set-visited-file-modtime'
`set-visited-file-name'
`with-temp-file'
`write-file'\n
;; :FILE-DIRECTORY-INSPECT
`directory-files'
`directory-files-and-attributes'
`file-attributes'
`file-chase-links'
`file-modes'
`file-newest-backup'
`file-nlinks'
`file-set-intersect'
`file-system-info'\n
;; :FILE-DIRECTORY-NAME-MODIFY
`abbreviate-file-name'
`add-name-to-file'
`convert-standard-filename'
`directory-file-name'
`expand-file-name'
`file-modes-char-to-right'
`file-modes-char-to-who'
`file-modes-rights-to-number'
`file-modes-symbolic-to-number'
`inhibit-file-name-handlers'
`inhibit-file-name-operation'
`recode-file-name'
`substitute-in-file-name'
`unhandled-file-name-directory'\n
;; :FILE-DIRECTORY-NAME-INSPECT
`buffer-file-name'                  ; :NOTE Also a <VARIABLE>
`file-name-all-completions'
`file-name-as-directory'
`file-name-completion'
`file-name-directory'
`file-name-extension'
`file-name-handler-alist'
`file-name-non-special'
`file-name-nondirectory'
`file-name-sans-extension'
`file-name-sans-versions'
`file-relative-name'
`file-truename'
`minibuffer-completing-file-name'
`read-file-name-defaults'
`x-file-dialog'\n
;; :FILE-DIRECTORY-PREDICATE
`file-name-absolute-p'
`file-ownership-preserved-p'
`file-newer-than-file-p'
`file-readable-p'
`file-regular-p'
`file-remote-p'
`file-symlink-p'
`file-writable-p'
`file-accessible-directory-p'
`file-attributes-lessp'
`file-compressed-p'
`file-directory-p'
`file-executable-p'
`file-exists-p'
`file-locked-p'
`next-read-file-uses-dialog-p'\n
;; :FILE-DIRECTORY-FIND
`file-expand-wildcards'
`wildcard-to-regexp'
`ffap'
`find-buffer-visiting'
`find-library'
`find-library-name'
`find-file'
`find-file-at-point'
`find-file-binary'
`find-file-existing'
`find-file-literally'
`find-file-name-handler'
`find-file-noselect'
`find-file-noselect-1'
`find-file-not-found-set-buffer-file-coding-system'
`find-file-other-frame'
`find-file-other-window'
`find-file-read-args'
`find-file-read-only'
`find-file-read-only-other-frame' 	
`find-file-read-only-other-window'
`find-file-text'
`find-dired'
`find-buffer-file-type'
`find-buffer-file-type-coding-system'
`find-buffer-file-type-match'
`hexl-find-file'
`locate-dominating-file'
`locate-library'\n
;; :FILE-DIRECTORY-W32
`w32-get-true-file-attributes'
`w32-long-file-name'
`w32-short-file-name'\n
;; :FILE-DIRECTORY-ELISP
`file-dependents'
`file-loadhist-lookup'
`file-provides'
`file-requires'\n
;; :FILE-DIRECTORY-RECOVER
`after-find-file'
`recover-file'
`recover-this-file'\n
;; :FILE-DIRECTORY-VARIABLES
`add-log-buffer-file-name-function'
`default-directory'
`directory-abbrev-alist'
`file-coding-system-alist'
`file-local-variables-alist'
`file-name-coding-system'
`file-name-handler-alist'
`file-name-history'
`file-name-invalid-regexp'
`file-precious-flag'
`list-buffers-directory'
`insert-default-directory'\n
;; :FILE-DIRECTORY-MON-LOCAL
`mon-file-stamp'
`mon-file-stamp-minibuffer'
`mon-file-stamp-buffer-filename'
`mon-get-file-mod-times'
`mon-insert-dirs-in-path'
`mon-insert-file-in-dirs'
`mon-insert-naf-file-in-dirs'
`mon-toggle-dired-dwim-target'\n
:SEE-ALSO `mon-help-file-dir-functions-usage'
`mon-help-process-functions'.\n►►►"
(interactive "i\nP")
  (if (or insertp intrp)
      (mon-help-function-spit-doc 'mon-help-file-dir-functions :insertp t)
    (message "Pass non-nil for optional arg INTRP")))
;;
;;; :TEST-ME (mon-help-file-dir-functions)
;;; :TEST-ME (mon-help-file-dir-functions t)
;;; :TEST-ME (describe-function 'mon-help-file-dir-functions)
;;; :TEST-ME (apply 'mon-help-file-dir-functions '(t))

;;; ==============================
;;; :RENAMED `mon-help-file-dir-functions' -> `mon-help-file-dir-functions-usage'
;;; :MODIFICATIONS <Timestamp: #{2009-10-28T14:44:24-04:00Z}#{09443} - by MON KEY>
;;; :CREATED <Timestamp: Wednesday May 06, 2009 @ 01:13.41 PM - by MON KEY>
(defun mon-help-file-dir-functions-usage (&optional insertp intrp)
  "Examples of file/directory name related function usage.\n
:SEE info node `(elisp)Files'\n
:NOTE Indentation below is for readablility :).\n
;; :FILE-BUFFER-CONJUNCT-USAGE
`buffer-file-name'               ;<&optional BUFFER>
 (buffer-file-name)\n
`find-buffer-visiting'           ;<FILENAME &optional PREDICATE>
 \(find-buffer-visiting
   \(filename\)\n
;; :FILE-DIRECTORY-ACTION-USAGE
`find-file'                      ;<FILENAME &optional WILDCARDS>
 \(find-file
   \(buffer-file-name\)\)\n
;; :FILE-DIRECTORY-PREDICATE-USAGE
`file-directory-p'               ;<FILENAME>
 \(file-directory-p
   doc-directory\)\n
`file-executable-p'              ;<FILENAME>
 \(file-executable-p
  \(executable-find \"emacs\"\)\)\n
`file-exists-p'                  ;<FILENAME>
 \(file-exists-p
  \(buffer-file-name\)\)\n
`file-locked-p'                  ;<&rest IGNORE>
 \(file-locked-p\)\n
`file-name-absolute-p'           ;<FILENAME>
 \(file-name-absolute-p
   \(directory-file-name
     default-directory\)\)\n
`file-newer-than-file-p'         ;<FILE1 FILE2>
 \(file-newer-than-file-p
  \(buffer-file-name\)
     doc-directory\)\n
`file-regular-p'                 ;<FILENAME>
 \(file-regular-p doc-directory\)\n
 \(file-regular-p \"~/.emacs\"\)\n
`file-writable-p'                ;<FILENAME>
 \(file-writable-p
   default-directory\)\n
;; :FILE-DIRECTORY-NAME-INSPECT-USAGE
`expand-file-name'               ;<NAME &optional DEFAULT-DIRECTORY>
 \(expand-file-name \"../\"\)
 \(expand-file-name \"../../\"\)
 \(expand-file-name \"../../../\"\)\n
`file-relative-name'             ;<FILENAME &optional DIRECTORY>
 \(file-relative-name
    default-directory\)\n
 \(file-relative-name
   \(buffer-file-name\)\)\n
`file-expand-wildcards'          ;<PATTERN &optional FULL>
 \(file-expand-wildcards
  \(concat doc-directory
    \"nxml/*.el\"\)\)\n
`file-truename'                  ;<FILENAME &optional COUNTER PREV-DIRS>
 \(file-truename
   \(getenv \"HOME\"\)\)\n
`substitute-in-file-name'        ;<FILENAME>
 \(substitute-in-file-name
   \"$HOME\\.emacs\")\n
`file-name-directory'            ;<FILENAME>
 \(file-name-directory
   \(buffer-file-name\)\)\n
`file-name-nondirectory'         ;<FILENAME>
 \(file-name-nondirectory 
   \(directory-file-name
     default-directory\)\)\n
`file-name-as-directory'         ;<FILE>
 \(file-name-as-directory
    default-directory\)\n
`file-name-nondirectory'         ;<FILENAME>
 \(file-name-nondirectory
   \(buffer-file-name\)\)\n
`file-name-sans-extension'       ;<FILENAME>
 \(file-name-sans-extension
   \(buffer-file-name\)\)\n
`directory-file-name'            ;<DIRECTORY>
 \(directory-file-name
   default-directory\)\n
 \(directory-file-name
   \(buffer-file-name\)\)\n
;; :DIRECTORY-INSPECT-USAGE
`directory-files'                ;<DIRECTORY &optional FULL MATCH NOSORT>
 \(directory-files
   default-directory\)\n
 \(directory-files
   \(file-name-directory 
     \(buffer-file-name\)\) nil \".el\"\)\n
`directory-files-and-attributes' ;<DIRECTORY &optional FULL MATCH NOSORT ID-FORMAT>
 \(directory-files-and-attributes
   default-directory\) \n
;; :FILE-DIRECTORY-INSPECT-PROPERTY-USAGE
`set-visited-file-modtime'       ;<&optional TIME-LIST>\n
`file-attributes'                ;<FILENAME &optional ID-FORMAT>
 \(file-attributes
    default-directory)\n
  List-returned consists of 12 elements:\n
  :IS-DIRECTORY-P      ;<- nth 0  t|nil
  :NUM-NAMES-OF-FILE   ;<- nth 1
  :UID                 ;<- nth 2
  :GID                 ;<- nth 3
  :LAST-ACCESSED       ;<- nth 4
  :LAST-MODIFIED       ;<- nth 5
  :LAST-STATUS-CHANGE  ;<- nth 6 
  :SIZE-IN-BYTES       ;<- nth 7 
  :FILES-MODES         ;<- nth 8 
  :GID-CHANGES-P       ;<- nth 9  :NOTE t if delete causes change on recreate.
  :FILE-INODE-NUMBER   ;<- nth 10
  :FILE-SYSTEM-NUMBER  ;<- nth 11\n
:NOTE `file-attributes' elts nth 4, 5, and 6 are as per `current-time'.\n
 \(current-time\) -> \(HIGH LOW MICROSEC\)\n
 \(decode-time \(current-time\)\) -> \(SEC MINUTE HOUR DAY MONTH YEAR DOW DST ZONE\)\n
 \(decode-time \(nth 5 \(file-attributes default-directory\)\)\)\n
;; :FILE-DIRECTORY-W32-USAGE
`convert-standard-filename'      ;<FILENAME>
 \(convert-standard-filename 
   \(file-truename
    \(getenv \"PROGRAMFILES\"\)\)\n
`w32-get-true-file-attributes'   ;<VARIABLE>\n
`w32-long-file-name'             ;<FILENAME>
 \(w32-long-file-name 
  \(getenv \"HOME\"\)\)\n
`w32-short-file-name'            ;<FILENAME>
 \(w32-short-file-name 
   \(getenv \"PROGRAMFILES\"\)\)\n
;; :FILE-DIRECTORY-CONJUNCT-USAGE
`split-string'                   ;<STRING &optional SEPARATORS OMIT-NULLS>
 \(split-string 
   \(directory-file-name
     default-directory\) \"/\"\)\n
`thing-at-point'                 ;<THING>
 \(thing-at-point
   'filename\)~/.emacs \n
`bounds-of-thing-at-point'       ;<THING>
 \(bounds-of-thing-at-point
   'filename\)~/.emacs\n
`ffap'                           ;<&optional FILENAME>
 \(ffap\)~/.emacs\n
;; :FILE-DIRECTORY-MON-LOCAL-USAGE
`mon-toggle-dired-dwim-target'
 \(mon-toggle-dired-dwim-target\)\n
`mon-get-file-mod-times'         ;<FILE-OR-DIR>
 \(mon-get-file-mod-times
   user-emacs-directory\)\n
`mon-insert-dirs-in-path'        ;<DIR-LIST DIR-PATH>
 \(mon-insert-dirs-in-path
   symbol path\)\n
`mon-insert-file-in-dirs'        ;<MAKE-DIR-LIST INSERT-TEXT EXTENSION>
 \(mon-insert-file-in-dirs
   \(make-dir-list
     insert-text extension\)\)\n
`mon-insert-naf-file-in-dirs'    ;<MAKE-DIR-LIST>
 \(mon-insert-naf-file-in-dirs
   \(make-dir-list\)\)\n
:SEE-ALSO `mon-help-file-dir-functions'.\n►►►"
  (interactive "i\nP")
  (if (or insertp intrp)
      (mon-help-function-spit-doc 'mon-help-file-dir-functions-usage :insertp t)
      (message "Pass non-nil for optional arg INTRP")))
;;
(defalias 'mon-help-directory-file-functions-usage 'mon-help-file-dir-functions-usage)
;;
;;; :TEST-ME (mon-help-file-dir-functions-usage)

;;; :TEST-ME (mon-help-file-dir-functions-usage t)
;;; :TEST-ME (describe-function 'mon-help-file-dir-functions-usage)
;;; :TEST-ME (apply 'mon-help-file-dir-functions-usage '(t))

;;; ==============================
;;; :CREATED <Timestamp: Friday July 03, 2009 @ 04:45.34 PM - by MON KEY>
(defun mon-help-process-functions (&optional insertp intrp)
  "Process related functions.\n
;; :PROCESS-ACTIONS
`accept-process-output'
`call-process'
`call-process-shell-command'
`continue-process'
`delete-process'
`make-network-process'          :SEE `mon-help-make-network-process'
`process-buffer'
`process-coding-system'
`process-command'
`process-contact'
`process-file'
`process-file-shell-command'
`process-get'
`process-lines'
`process-put'
`process-send-eof'
`process-send-region'
`process-send-string'
`set-process-sentinel'
`shell-quote-argument'
`signal-process'
`start-file-process-shell-command'
`start-process-shell-command'
`stop-process'\n
;; :PROCESS-INSPECTION
`process-exit-status'
`process-id'
`process-filter'
`process-plist'
`process-mark'
`process-name'
`process-sentinel'
`process-status'
`process-tty-name'
`process-type'\n
;; :PROCESS-ENUMERATION
`list-processes'
`list-system-processes'
`process-attributes'
`process-list'
`system-process-attributes'\n
;; :PROCESS-FLAGS
`set-network-process-option'
`set-process-query-on-exit-flag'
`process-query-on-exit-flag'
`process-inherit-coding-system-flag'\n
;; :PROCESS-PREDICATES
`waiting-for-user-input-p'
`process-filter-multibyte-p'
`process-running-child-p'
`processp'\n
;; :PROCESS-VARIABLES
`process-adaptive-read-buffering' ;<VARIABLE>
`process-connection-type'         ;<VARIABLE>
`process-coding-system-alist'     ;<VARIABLE>
`process-environment'             ;<VARIABLE>\n
;; :PROCESS-MON-LOCAL
`mon-get-proc-w-name'
`mon-get-sys-proc-list'
`mon-insert-sys-proc-list'\n
:SEE :FILE process.c
:SEE info node `(elisp)Processes'
:SEE-ALSO `mon-help-make-network-process', `mon-help-server-functions'.\n►►►"
  (interactive "i\nP")
  (if (or insertp intrp)
      (mon-help-function-spit-doc 'mon-help-process-functions :insertp t)
      (message "Pass non-nil for optional arg INTRP")))
;;
;;; :TEST-ME (mon-help-process-functions)
;;; :TEST-ME (mon-help-process-functions t)
;;; :TEST-ME (describe-function  'mon-help-process-functions)
;;; :TEST-ME (apply 'mon-help-process-functions '(t))


;;; ==============================
;;; :CHANGESET 1706
;;; :CREATED <Timestamp: #{2010-04-12T13:19:25-04:00Z}#{10151} - by MON KEY>
(defun mon-help-make-network-process (&optional insertp intrp)
  "A short form enumeration of args for `make-network-process'.\n
:SEE info node `(elisp)Network Processes'.\n
;; :MAKE-NETWORK-PROCESS-ARGS\n
:name    <NAME>\n
:buffer  {<BUFFER>|<BUFFER-NAME>}\n
:type    {nil|datagram} ;When nil create a stream\n
:local   <ADDRESS> ;When non-nil overrides `:family', `:host', `:service' args\n
:remote  <ADDRESS> ;When non-nil overrides `:family', `:host', `:service' args\n
         ¦ IPv4-address -> <VECTOR> of five elts, four 8-bit one 16-bit e.g.:
         ¦                          [192 168 1 100 8080] -> 192.168.1.100:8080
         ¦ IPv6-address -> <VECTOR> of nine elts, each a 16-bit integer
         ¦ local-address      -> <STRING>
         ¦ unsupported-family -> <CONS> (F . AV) -> (<INTEGER> . <VECTOR>)\n
:family  {local|ipv4|ipv6|[address and protocol of service]}\n
:host    {local|[server-process-name{host-name|host-ip}]}\n
:service {name|ip|t[port{<STRING>|<INTEGER>}]}\n
:coding  {<SYMBOL>|<CONS>}\n
:nowait  {nil|t}\n
:noquery {nil|t}\n
:stop    {nil|t}\n
:filter  <FILTER>\n
:sentinel <SENTINEL>\n
:log      <FUNCTION> which accepts the args:
                    ¦ <SERVER>  ;<- A process
                    ¦ <CLIENT>  ;<- A process
                    ¦ <MESSAGE> ;<- A string\n
:plist  <PLIST>\n
:server When t <FAMILY>, <SERVICE>, connection type (a stream or datagram)
        When <INTEGER> length of connection queue\n
:filter-multibyte {nil|t}\n
;; :MAKE-NETWORK-PROCESS-CONNECTION-OPTIONS\n
:broadcast    <BOOLEAN>
:dontroute    <BOOLEAN>
:keepalive    <BOOLEAN>
:linger       <INTEGER>
:oobinline    <BOOLEAN>
:priority     <INTEGEER>
:reuseaddr    <BOOLEAN>
:bindtodevice <DEVICE-NAME>\n
;; :MAKE-NETWORK-PROCESS-CONNECTION-OPTIONS-TEST-KEY-VAL
Form1: (featurep 'make-network-process '(KEYWORD VALUE))
Return non-nil if make-network-process accepts <KEYWORD> with <VALUE>.\n
 \(featurep 'make-network-process '\(:nowait t\)\)
 \(featurep 'make-network-process '\(:type datagram\)\)
 \(featurep 'make-network-process '\(:family local\)\)
 \(featurep 'make-network-process '\(:family ipv6\)\)
 \(featurep 'make-network-process '\(:service t\)\)\n
;; :MAKE-NETWORK-PROCESS-CONNECTION-OPTIONS-TEST-KEYWORD
Form2: (featurep 'make-network-process 'KEYWORD)
Return non-nil if `make-network-process' accepts network option arg <KEYWORD>.\n
 \(featurep 'make-network-process :bindtodevice\)
 \(featurep 'make-network-process :broadcast\)
 \(featurep 'make-network-process :dontroute\)
 \(featurep 'make-network-process :keepalive\)
 \(featurep 'make-network-process :linger\)
 \(featurep 'make-network-process :oobinline\)
 \(featurep 'make-network-process :priority\)
 \(featurep 'make-network-process :reuseaddr\)\n
:SEE :FILE process.c
:SEE-ALSO `mon-help-make-network-process', `mon-help-server-functions'.\n►►►"
(interactive "i\nP")
  (if (or insertp intrp)
      (mon-help-function-spit-doc 'mon-help-make-network-process :insertp t)
    (message "Pass non-nil for optional arg INTRP")))
;;
;;; :TEST-ME (mon-help-make-network-process)
;;; :TEST-ME (mon-help-make-network-process t)
;;; :TEST-ME (describe-function 'mon-help-make-network-process)
;;; :TEST-ME (appply 'mon-help-make-network-process nil '(t))

;;; ==============================
;;; :CREATED <Timestamp: #{2010-01-19T18:30:50-05:00Z}#{10032} - by MON KEY>
(defun mon-help-server-functions (&optional insertp intrp)
  "List of Emacs server related functions and variables.\n
:SEE info node `(emacs)Emacs Server'\n
;; :SERVER-FUNCTIONS
`server-add-client'
`server-buffer-done'
`server-clients-with'
`server-create-tty-frame'
`server-create-window-system-frame'
`server-delete-client'
`server-done'
`server-edit'
`server-ensure-safe-dir'
`server-eval-and-print'
`server-execute'
`server-execute-continuation'
`server-force-delete'
`server-goto-line-column'
`server-goto-toplevel'
`server-handle-delete-frame'
`server-handle-suspend-tty'
`server-kill-buffer'
`server-kill-buffer-query-function'
`server-kill-emacs-query-function'
`server-log'
`server-mode'
`server-process-filter'
`server-quote-arg'
`server-return-error'
`server-running-p' 
`server-save-buffers-kill-terminal'
`server-select-display'
`server-send-string'
`server-sentinel'
`server-start'
`server-switch-buffer'
`server-temp-file-p'
`server-unload-function'
`server-unquote-arg'
`server-unselect-display'
`server-visit-files'
`server-with-environment'
;; :SERVER-VARIABLES
`server-auth-dir'
`server-buffer'
`server-buffer-clients'
`server-clients'
`server-done-hook'
`server-existing-buffer'
`server-host'
`server-kill-buffer-running'
`server-kill-new-buffers'
`server-log'
`server-log-time-function'
`server-mode'
`server-name'
`server-process'
`server-raise-frame'
`server-socket-dir'
`server-switch-hook'  
`server-temp-file-regexp'
`server-use-tcp'
`server-visit-hook'
`server-window'\n
;; :SERVER-FUNCTION-USAGE
\(featurep 'make-network-process\)
\(locate-user-emacs-file \"server/\"\)\n
\\\(getenv \"USERDOMAIN\"\)\) ;<- W32
\(file-truename \(getenv \"APPDATA\"\)\) ;<- W32
\(getenv \"EMACS_SERVER_FILE\"\)
\(file-truename \(getenv \"EMACS_SERVER_FILE\"\)\)
\(getenv \"EMACSCLIENT_STARTING_SERVER\"\)
\(file-truename \(getenv \"EMACSCLIENT_STARTING_SERVER\"\)\)\n
:SEE-ALSO `mon-help-ipv4-header', `mon-help-process-functions',
`mon-help-make-network-process'.\n►►►"
(interactive "i\nP")
  (if (or insertp intrp)
      (mon-help-function-spit-doc 'mon-help-server-functions :insertp t)
    (message "Pass non-nil for optional arg INTRP")))
;;
;;; :TEST-ME (mon-help-server-functions)
;;; :TEST-ME (mon-help-server-functions nil t)
;;; :TEST-ME (describe-function 'mon-help-server-functions)
;;; :TEST-ME (apply 'mon-help-server-functions '(t))

;;; ==============================
;;; :CREATED <Timestamp: #{2009-09-02T10:22:56-04:00Z}#{09363} - by MON KEY>
(defun mon-help-buffer-functions (&optional insertp intrp)
  "Buffer related functions.\n
:SEE info node `(elisp)Buffers and Windows'.\n
;; :BUFFER-ACTIONS-ON
`ispell-buffer'
`create-file-buffer'
`eval-buffer'
`eval-current-buffer'
`generate-new-buffer-name'
`lock-buffer'
`rename-buffer'
`revert-buffer'
`save-buffer'
`unlock-buffer'
`view-buffer'\n
;; :BUFFER-ACTIONS-MOVEMENT
`barf-if-buffer-read-only'
`bury-buffer'
`clone-buffer'
`clone-indirect-buffer'
`clone-indirect-buffer-other-window'
`display-buffer'
`display-buffer-other-frame'
`fit-window-to-buffer'
`get-buffer'
`get-buffer-create'
`make-indirect-buffer'
`next-buffer'
`other-buffer'
`pop-to-buffer'
`previous-buffer'
`replace-buffer-in-windows'
`set-buffer'
`switch-to-buffer'
`switch-to-buffer'
`switch-to-buffer-other-frame'
`switch-to-buffer-other-window'
`unbury-buffer'
`view-buffer-other-frame'
`view-buffer-other-window'\n
;; :BUFFER-ACTIONS-ON-MULITPLE
`buffer-list'
`buffer-menu'
`buffer-menu-other-window'
`grep-buffers'
`list-buffers'
`save-some-buffers'\n
;; :BUFFER-CONTENTS
`insert-buffer'
`prepend-to-buffer'
`buffer-string'
`buffer-substring'
`filter-buffer-substring'
`buffer-substring-filters'        ;<VARIABLE>
`buffer-substring-no-properties'
`buffer-swap-text'
`erase-buffer'
`append-to-buffer'
`copy-to-buffer'
`with-temp-buffer'
`with-output-to-temp-buffer'
\(read \(get-buffer \"SOME-BUFFER-NAME\"\)\)\n
;; :BUFFER-EXAMINATION
`buffer-base-buffer'
`buffer-chars-modified-tick'
`buffer-disable-undo'
`buffer-enable-undo'
`buffer-face-mode'
`buffer-face-set'
`buffer-face-toggle'
`buffer-file-name'
`buffer-has-markers-at'
`buffer-local-value'
`buffer-local-variables'
`buffer-modified-tick'
`buffer-name'
`buffer-size'
`current-buffer'
`gap-position'
`gap-size'
`get-buffer-process'
`get-buffer-window'
`get-buffer-window-list'
`list-buffers-directory'
`window-buffer'\n
;; :BUFFER-FORMAT-AND-CODING
`format-encode-buffer'
`format-decode-buffer'
`buffer-file-format'              ;<VARIABLE>
`revert-buffer-with-coding-system'
;; :BUFFER-KILLING
`kill-buffer'
`kill-buffer-and-window'
`kill-matching-buffers'
`kill-some-buffers'
`kill-this-buffer'
`kill-buffer-if-not-modified'\n
;; :BUFFFER-POSITIONS
`mark-whole-buffer'
`beginning-of-buffer'
`beginning-of-buffer-other-window'
`end-of-buffer'
`end-of-buffer-other-window'
`eobp'
`buffer-end'
`point-min'
`point-max'
`point-max-marker'
`point-min-marker'
;; :BUFFER-PREDICATES
`buffer-live-p'
`buffer-modified-p'
`frame-or-buffer-changed-p'
`local-variable-p'         :SEE info node `(elisp)Creating Buffer-Local'
`local-variable-if-set-p'
`set-buffer-modified-p'\n
;; :BUFFER-WINDOWS
`display-buffer'
`get-buffer-window-list'
`kill-buffer-and-window'
`switch-to-buffer-other-window'
`window-buffer-height'
`window--display-buffer-1'
`window--display-buffer-2'\n
;; :BUFFER-VARIABLES
`buffer-access-fontified-property'
`buffer-access-fontify-functions'
`buffer-auto-save-file-format'
`buffer-auto-save-file-name'
`buffer-backed-up'
`buffer-display-count'
`buffer-display-table'
`buffer-display-time'
`buffer-file-coding-system'
`buffer-file-coding-system-explicit'
`buffer-file-format'
`buffer-file-name'
`buffer-file-number'
`buffer-file-numbers-unique'
`buffer-file-read-only'
`buffer-file-truename'
`buffer-file-type'
`buffer-invisibility-spec'
`buffer-name-history'
`buffer-offer-save'
`buffer-quit-function'
`buffer-read-only'
`buffer-save-without-query'
`buffer-saved-size'
`buffer-substring-filters'
`buffer-stale-function'
`buffer-undo-list'
`temp-buffer-max-height'
`temp-buffer-resize-mode'
`temp-buffer-setup-hook'
`temp-buffer-show-function'
`temp-buffer-show-hook'\n
:SEE-ALSO `mon-help-window-functions', `mon-help-frame-functions'.\n►►►"
  (interactive "i\nP")
  (if (or insertp intrp)
      (mon-help-function-spit-doc 'mon-help-buffer-functions :insertp t)
    (message "Pass non-nil for optional arg INTRP")))
;;
;;; :TEST-ME (mon-help-buffer-functions)
;;; :TEST-ME (mon-help-buffer-functions t)
;;; :TEST-ME (describe-function 'mon-help-buffer-functions)
;;; :TEST-ME (apply 'mon-help-buffer-functions '(t))

;; autoload-generated-file
;;; ==============================
;;; :CREATED <Timestamp: #{2009-10-16T15:07:43-04:00Z}#{09425} - by MON>
(defun mon-help-frame-functions (&optional insertp intrp)
  "Functions for working with frames.\n
:SEE info node `(elisp)Frames'.\n
;; :FRAME-ENUMERATE
`frame-configuration-to-register'
`frame-list'
`frame-terminal'
`frames-on-display-list'
`selected-frame'\n
;; :FRAME-HANDLERS-SERVER
`frame-focus'
`handle-delete-frame'
`handle-switch-frame'
`modify-frame-parameters'
`redirect-frame-focus'
`server-handle-delete-frame'\n
;; :FRAME-HANDLERS
`delete-frame'
`delete-other-frames'
`frame-initialize'
`iconify-frame'
`lower-frame'
`make-frame'
`make-frame-command'
`make-frame-on-display'
`make-frame-visible'
`next-multiframe-window'
`other-frame'
`previous-multiframe-window'
`raise-frame'
`select-frame'\n
;; :FRAME-PARAMS
`frame-char-width'
`frame-current-scroll-bars'
`frame-geom-spec-cons'
`frame-geom-value-cons'
`frame-height'
`frame-notice-user-settings'
`frame-parameter'
`frame-parameters'
`frame-pixel-height'
`frame-pixel-width'
`frame-remove-geometry-params'
`frame-width'\n
;; :FRAME-PREDICATES
`framep'
`framep-on-display'
`frame-configuration-p'
`frame-live-p'
`frame-or-buffer-changed-p'
`frame-visible-p'\n
;; :FRAME-WINDOWS
`frame-first-window'
`frame-root-window'
`frame-selected-window'\n
;; :FRAME-FACES
`frame-set-background-mode'
`frame-face-alist'
`frame-update-face-colors'
`frame-update-faces'\n
;; :FRAME-VARIABLES
`last-event-frame'
`delete-frame-functions'
`frame-alpha-lower-limit'
`frame-background-mode'
`frame-creation-function-alist'
`frame-inherited-parameters'
`frame-initial-frame'
`frame-initial-frame-alist'
`frame-initial-geometry-arguments'
`frame-name-history'
`frame-notice-user-settings'
`frame-title-format'\n
:SEE :FILE lisp/frame.el src/frame.c 
:SEE-ALSO `mon-help-window-functions', `mon-help-buffer-functions'.\n►►►"
  (interactive "i\nP")
  (if (or insertp intrp)
      (mon-help-function-spit-doc 'mon-help-frame-functions :insertp t)
      (message "Pass non-nil for optional arg INTRP")))
;;
;;; :TEST-ME (mon-help-frame-functions)
;;; :TEST-ME (mon-help-frame-functions t)
;;; :TEST-ME (describe-function 'mon-help-frame-functions)
;;; :TEST-ME (apply 'mon-help-frame-functions '(t))

;;; ==============================
;;; :CREATED <Timestamp: #{2009-10-21T12:41:44-04:00Z}#{09433} - by MON>
(defun mon-help-window-functions (&optional insertp intrp)
  "Functions for working with windows.\n
:SEE info node `(elisp)Windows'.\n
;; :WINDOW-DEL-KILL-QUIT
`delete-window'
`delete-windows-on'
`delete-other-windows-vertically'
`kill-buffer-and-window'
`quit-window'\n
;; :WINDOW-ENUMERATE
`selected-window'
`count-windows'
`get-buffer-window-list'
`minibuffer-window'
`next-window'
`previous-window'
`walk-windows'
`window-list'
`window-tree'\n
;; :WINDOW-ENVIRONMENT
`compare-window-configurations'
`current-window-configuration'
`window-buffer'
`window-configuration-frame'
`window-configuration-to-register'
`window-current-scroll-bars'
`window-display-table'
`window-frame'
`window-system'                    ; :NOTE Also a <VARIABLE>
`window-parameter'
`window-parameters'
`window-redisplay-end-trigger'     ;<DEPRECATED>\n
;; :WINDOW-HANDLERS-MOVEMENT
`save-selected-window'
`save-window-excursion'
`with-selected-window'
`handle-select-window'\n
;; :WINDOW-HANDLERS-MOVEMENT-TO
`display-buffer'
`find-file-other-window'
`move-to-window-line-top-bottom'
`switch-to-buffer-other-window'
`window--display-buffer-1'
`window--display-buffer-2'\n
;; :WINDOW-HANDLERS-MOVEMENT-OF
`adjust-window-trailing-edge'
`balance-windows'
`balance-windows-area'
`enlarge-window'
`enlarge-window-horizontally'
`fit-window-to-buffer'
`recenter-top-bottom'
`shrink-window-horizontally'
`shrink-window-if-larger-than-buffer'
`split-window-sensibly'
`split-window-horizontally'
`split-window-vertically'
`window-hscroll'
`window-vscroll'
`window--try-to-split-window'
`window--even-window-heights'\n
;; :WINDOW-POSITION-IN
`window-point'
`window-dot'                ;<DEPRECATED>\n
;; :WINDOW-POSITION-OF
`window-at'
`window-start'
`window-end'\n
;; :WINDOW-PREDICATES
`get-window-with-predicate'
`minibuffer-window-active-p'
`one-window-p'
`special-display-p'
`truncated-partial-width-window-p'
`windowp'
`window-configuration-p'
`window-dedicated-p'
`window-fixed-size-p'
`window--frame-usable-p'
`window-full-width-p'
`window-live-p'
`window-minibuffer-p'
`window-safely-shrinkable-p'
`window-splittable-p'\n
;; :WINDOW-SIZE-PIXEL
`window-pixel-edges'        ; LIST <LEFT TOP RIGHT BOTTOM>
`window-inside-pixel-edges' ; LIST <LEFT TOP RIGHT BOTTOM>
`window-scroll-bars'        ; LIST <WIDTH COLS VERTICAL-TYPE HORIZONTAL-TYPE>
`window-line-height'        ; LIST <HEIGHT VPOS YPOS OFFBOT>
`window-fringes'            ; LIST <LEFT-WIDTH RIGHT-WIDTH OUTSIDE-MARGINS>
`window-margins'            ; CONS <LEFT-WIDTH . RIGHT-WIDTH>\n
;; :WINDOW-SIZE-LINE-COLUMN
`count-screen-lines'
`set-window-text-height'
`window-buffer-height'
`window-edges'              ; LIST <LEFT TOP RIGHT BOTTOM>
`window-inside-edges'       ; LIST <LEFT TOP RIGHT BOTTOM>
`window-width'              ;<COL(S)>
`window-height'             ;<LINE(S)>
`window-text-height'        ;<LINE(S)>
`window-body-height'        ;<LINE(S)>\n
;; :WINDOW-VARIABLES
`even-window-heights'
`pop-up-windows'
`recenter-last-op'
`same-window-buffer-names'
`same-window-regexps'
`split-window-keep-point'
`split-window-preferred-function'
`split-height-threshold'
`split-width-threshold'
`window-area-factor'
`window-min-height'
`window-min-width'
`window-point-insertion-type'
`window-scroll-functions'
`window-size-change-functions'
`window-size-fixed'
`window-system'                      ; :NOTE Also a <FUNCTION>
`window-system-initialization-alist'
`window-system-version'
`window-text-change-functions'\n
;; :WINDOW-VARIABLES-HOOKS
`window-configuration-change-hook' ;<VARIABLE>
`window-setup-hook'                ;<VARIABLE>\n
:SEE :FILE lisp/window.el src/window.c
:SEE-ALSO `mon-help-frame-functions', `mon-help-buffer-functions'.\n►►►"
  (interactive "i\nP")
  (if (or insertp intrp)
      (mon-help-function-spit-doc 'mon-help-window-functions :insertp t)
      (message "Pass non-nil for optional arg INTRP")))
;;
;;; :TEST-ME (mon-help-window-functions)
;;; :TEST-ME (mon-help-window-functions t)
;;; :TEST-ME (describe-function 'mon-help-window-functions)
;;; :TEST-ME (apply 'mon-help-window-functions '(t))

;;; ==============================
;;; :TODO add other XML related material from xml-rpc, and ./lisp/nxml
;;; :CREATED <Timestamp: #{2009-09-17T12:06:53-04:00Z}#{09384} - by MON KEY>
(defun mon-help-xml-functions (&optional insertp intrp)
  "XML related functions.\n
;; :XML-FILE.lisp.xml
`xml-get-children'
`xml-parse-attlist'
`xml-parse-dtd'
`xml-parse-elem-type'
`xml-parse-file'
`xml-parse-fragment'
`xml-parse-region'
`xml-parse-string'
`xml-parse-tag'
`xml-print'
`xml-debug-print'
`xml-escape-string'\n
;; :XML-FILE.nxml.xsd-regexp
`xsdre-translate'
`xsdre-parse-regexp'\n
;; :XML-FILE.nxml.xmltok
`xmltok-unicode-to-char'
`xmltok-forward'
`xmltok-forward-prolog'
`xmltok-forward-special'\n
;; :XML-FILE.nxml.nxml-parse
`nxml-parse-file'\n
;; :XML-FILE.eieio-xml
`eieio-xml-override-prin1'
`eieio-xml-list-prin1'
`object-write-xml'\n
:SEE-ALSO .\n►►►"
  (interactive "i\np")
    (mon-help-function-spit-doc 'mon-help-xml-functions :insertp t)
  (message "Pass non-nil for optional arg INTRP"))
;;
;;; :TEST-ME (mon-help-xml-functions t)

;;; ==============================
;;; :CREATED <Timestamp: #{2009-10-04T06:24:23-04:00Z}#{09407} - by MON>
(defun mon-help-eieio-defclass (&optional insertp intrp)
  "Routine eieio functions, specs, args, etc.
:SEE info node `(eieio)Top'
:SEE :FILE ./cedet-cvs/ede/ede.el for examples of defining big classes.\n
;; :EIEIO-CLASS-SLOT-KEYWORDS
:initarg                 {tag, string}
:initform                {expression}
:type                    {t, null, symbol, list, function, string, character,
                          integer, fixnum, number, real, float, boolean}
                         :SEE `typep'`type-of' `deftype' `typecase' `check-type'
                         :SEE info node `(cl)Type Predicates'
                         :SEE info node `(elisp)Type Predicates'
:allocation              {:instance, :class}
:documentation           {string}\n
;; :EIEIO-CLOS-NON-COMPLIANT
:accessor                {generic-function-name}
:writer                  {generic-function-name}
:reader                  {generic-function-name}\n
;; :EIEIO-EMACS-SPECIFIC
:custom                  {string}
:label                   {string}
:group                   {customization-group}
:custom-groups           {list}
:printer                 {function}
:protection              {:public, :protected, :private}
:allow-nil-initform      {boolean}
:abstarct                {boolean}
:method-invocation-order {:breadth-first, :depth-first}\n
;; :EIEIO-CLOS-NON-IMPLIMENTED
:metaclass
:default-initargs\n
;; Additional class tags are added with: `class-option'\n
;; :EIEIO-BASE-CLASSES
`eieio-persistent'         (file file-header-line) <CLASS>
`eieio-instance-inheritor' (parent-instance)       <CLASS>
`eieio-instance-tracker'   (tracker-symbol)        <CLASS>
`eieio-speedbar'           (buttontype buttonface) <CLASS>
`eieio-singleton'                                  <CLASS>
`eieio-named'                                      <CLASS>\n
:SEE-ALSO `mon-insert-defclass-template', `mon-help-eieio-functions',
`mon-help-eieio-methods'.\n►►►"
  (interactive "i\nP")
  (if (or insertp intrp)
      (mon-help-function-spit-doc 'mon-help-eieio-defclass :insertp t)
      (message "Pass non-nil for optional arg INTRP")))
;;
;;; :TEST-ME (mon-help-eieio-defclass)
;;; :TEST-ME (mon-help-eieio-defclass t)
;;; :TEST-ME (describe-function 'mon-help-eieio-defclass)
;;; :TEST-ME (apply 'mon-help-eieio-defclass '(t))

;;; ==============================
;;; :CREATED <Timestamp: #{2009-10-06T16:41:17-04:00Z}#{09412} - by MON KEY>
(defun mon-help-eieio-functions (&optional insertp intrp)
  "Interface functions for working with EIEIO system of CEDET.\n
:SEE info node `(eieio)Function Index'.\n
;; :EIEIO-CLASSES               :SEE-ALSO `mon-help-eieio-defclass'
`defclass'                       NAME SUPERCLASS SLOTS &rest OPTIONS-AND-DOC
`eieio-hook'                    ;<VARIABLE>
;; :EIEIO-MAKING-OBJECTS:
`make-instance'                  CLASS &rest INITARGS
`class-constructor'              OBJECT-NAME &rest SLOTS
`initialize-instance'            OBJ &rest SLOTS
`shared-initialize'              OBJ &rest SLOTS\n
;; :EIEIO-METHODS               :SEE-ALSO `mon-help-eieio-methods'
`defgeneric'                     METHOD ARGLIST [DOC-STRING]
`call-next-method'               &rest REPLACEMENT-ARGS
`defmethod'                      METHOD [:before|:primary|:after|:static]\n
;; :EIEIO-BASIC-METHODS
`clone'                          OBJ &rest PARAMS
`constructor'                   ;<GENERIC-FUNCTION :STATIC>
`object-print'                   THIS &rest STRINGS
`object-write'                   OBJ &optional COMMENT
`slot-missing'                   AB &rest FOO
`slot-unbound'                   OBJECT CLASS SLOT-NAME FN
`no-applicable-method'           OBJECT METHOD &rest ARGS
`no-next-method'                 OBJECT &rest ARGS\n
`eieio-generic-call-arglst'        ;<VARIABLE>
`eieio-pre-method-execution-hooks' ;<VARIABLE>\n
;; :EIEIO-ACCESSING-SLOTS
`oset'                           OBJECT SLOT VALUE ;-> `eieio-oset'
`slot-value'                     OBJECT SLOT       ;-> `oref' -> `eieio-oref'
`set-slot-value'                 OBJECT SLOT VALUE ;-> `eieio-oset'
`oset-default'                   CLASS SLOT VALUE  ;-> `eieio-oset-default'
`oref-default'                   OBJ SLOT          ;-> `eieio-oref-default'
`slot-makeunbound'               OBJECT SLOT       ;-> is `slot-makunbound'
`with-slots'                     SPEC-LIST OBJECT &rest BODY
`object-add-to-list'             OBJECT SLOT ITEM &optional APPEND
`object-remove-from-list'        OBJECT SLOT ITEM\n
;; :EIEIO-ASSOCIATION-LISTS
`object-assoc'                   KEY SLOT LIST
`object-assoc-list'              SLOT LIST
`eieio-build-class-alist'        &optional BASE-CLASS\n
;; :EIEIO-PREDICATES
`child-of-class-p'               CHILD CLASS
`class-abstract-p'               CLASS
`class-p'                        CLASS
`eieio-slot-originating-class-p' START-CLASS SLOT
`generic-p'                      METHOD-SYMBOL
`generic-primary-only-p'         METHOD
`generic-primary-only-one-p'     METHOD
`next-method-p'
`object-of-class-p'              OBJ CLASS
`object-p'                       OBJ    ;-> `eieio-object-p'
`same-class-fast-p'              OBJ CLASS
`same-class-p'                   OBJ CLASS
`slot-boundp'                    OBJECT SLOT
`slot-exists-p'                  OBJECT-OR-CLASS SLOT\n
;; :EIEIO-UTILITY
`class-v'                        CLASS
`class-constructor'              CLASS
`class-direct-superclasses'      CLASS  ;-> `class-parents'
`class-direct-subclasses'        CLASS  ;-> `class-children'
`class-children-fast'            CLASS
`class-name'                     CLASS
`class-method-invocation-order'  CLSSS
`class-option'                   CLASS OPTION
`class-option-assoc'             LIST OPTION
`class-parents-fast'             CLASS
`class-parent'                   CLASS  ;-> :DEPRECATED
`class-slot-initarg'             CLASS SLOT
`eieio-set-defaults'             OBJ &optional SET-ALL
`eieio-initarg-to-attribute'     CLASS INITARG
`find-class'                     SYMBOL &optional ERRORP
`object-class'                   OBJ    ;->`class-of'
`object-class-fast'              OBJ
`object-class-name'              OBJ
`object-name'                    OBJ &optional EXTRA
`object-slots'                   OBJ
`object-name-string'             OBJ
`object-set-name-string'         OBJ NAME\n
;; :EIEIO-INTROSPECTION
`describe-class'                 CLASS   ;-> `eieio-describe-class'
`describe-generic'               GENERIC ;-> `eieio-describe-generic'
`describe-method'                GENERIC ;-> `eieio-describe-generic'
`eieiodoc-class'                 CLASS INDEXSTRING &optional SKIPLIST
`eieio-all-generic-functions'    &optional CLASS
`eieio-browse'                   ROOT-CLASS
`eieio-class-tree'               &optional ROOT-CLAS
`eieio-class-slot-name-index'    CLASS SLOT
`eieio-slot-name-index'          CLASS OBJ SLOT
`eieio-default-superclass'      ;<VARIABLE> ;<- :ALIASED-BY `standard-class'
`eieio-describe-class-slots'     CLASS
`eieio-describe-constructor'     FCN
`eieio-lambda-arglist'           FUNC
`eieio-method-documentation'     GENERIC CLASS
`eieio-version'                 ;<VARIABLE> & <FUNCTION>\n
;; :EIEIO-SIGNALS
`invalid-slot-name'              OBJ-OR-CLASS SLOT
`no-method-definition'           METHOD ARGUMENTS
`no-next-method'                 CLASS ARGUMENTS
`invalid-slot-type'              SLOT SPEC VALUE
`unbound-slot'                   OBJECT CLASS SLOT\n
;; :EIEIO-PRINTERS
`object-print'                   THIS &rest STRINGS    ;<METHOD>
`object-write'                   OBJ &optional COMMENT ;<METHOD>
`eieio-override-prin1'           THING
`eieio-list-prin1'
`eieio-xml-override-prin1'       THING
`eieio-xml-list-prin1'           LIST
`eieio-edebug-prin1-to-string'   OBJECT &optional NOESCAPE
`eieio-display-method-list'
`object-write-xml'              ;<METHOD>\n
;; :EIEIO-ADVISED-FUNCTIONS
`eieio-describe-class' -> `describe-variable'
`eieio-describe-generic' -> `describe-function'\n
;; :EIEIO-CLOS-UNIMPLEMENTED    :SEE info node `(eieio)CLOS compatibility'
`change-class'
`describe-object'               :SEE `object-write'\n
;; :EIEIO-UNINMPLEMENTED
`destructor'
`eieio-read-xml'\n
;; :EIEIO-LOAD
`eieio-defclass-autoload'     ;<PROPERTY>
:SEE-ALSO `mon-help-eieio-methods', `mon-help-eieio-defclass', 
`mon-insert-defclass-template'.\n►►►"
  (interactive "i\nP")
  (if (or insertp intrp)
      (mon-help-function-spit-doc 'mon-help-eieio-functions :insertp t)
      (message "Pass non-nil for optional arg INTRP")))
;;
;;; :TEST-ME (mon-help-eieio-functions)
;;; :TEST-ME (mon-help-eieio-functions t)
;;; :TEST-ME (describe-function 'mon-help-eieio-functions)
;;; :TEST-ME (apply 'mon-help-eieio-functions '(t))

;;; ==============================
;;; :CREATED <Timestamp: #{2009-10-08T21:20:46-04:00Z}#{09415} - by MON>
(defun mon-help-eieio-methods (&optional insertp intrp)
  "Help interrogating eieio's generic functions and methods.\n
Following presents examples for examining the underlying `vector' and `obarray'
structures. To run throught the examples evaluate below:\n
 ===================\n :CREATE-TWO-CLASSES\n ===================\n
\(defclass tt--367 \(\)\n  \(\(s-367-0\n    :initarg  :s-367-0
    :initform nil\n    :accessor acc-s367-0\)\n   \(s-367-1
    :initarg  :s-367-1\n    :initform nil
    :documentation \"doc s-367-1\"\)\)\n  \"Dummy class tt--367\"\)\n
\(defclass tt--367-sub \(tt--367\)\n  \(\(s-367-sub-0
    :initarg  :s-367-sub-0\n    :initform nil
    :accessor acc-s367-sub-0\)\n   \(s-367-sub-1\n    :initarg  :s-367-sub-1
    :initform nil\n    :type list
    :documentation \"s-367-sub-1 w/ type 'list.\"\)\)
  \"Dummy class tt--367-sub\"\)\n\n ==========================
 :INSTANTIATE-OBJECTS-SLOTS\n ==========================\n
\(setq test-tt--367
      \(tt--367 \"test-tt--367\" :s-367-1 '\(a list on second slot s-367-1\)\)\)\n
\(setf \(acc-s367-0 test-tt--367\) \"slot-value on s-367\"\)\n
\(acc-s367-0 test-tt--367\)\n;=> \"slot-value on s-367\"\n
\(slot-value test-tt--367 :s-367-0\)\n;=> \"slot-value on s-367\"\n
\(setq test-tt--367-sub \(tt--367-sub \"test-tt--367-sub\"\)\)
test-tt--367-sub\n;=> [object tt--367-sub \"test-tt--367-sub\" nil nil nil]\n
\(set-slot-value test-tt--367-sub :s-367-sub-0 [vec on vec]\)
\(acc-s367-sub-0 test-tt--367-sub\)\n;=> [vec on vec]\n
\(setf \(slot-value test-tt--367-sub :s-367-sub-1\) \"This list should fail\"\) \n
\(setf \(slot-value test-tt--367-sub :s-367-sub-1\) '\(this-list should pass\)\) \n
\(slot-value test-tt--367-sub :s-367-sub-1\)\n;=> \(this-list should pass\)\n
 ==============\n :CLASS-VECTORS\n ==============\n
By default an eieio class is instantiated as a vector.
To access this vector use `class-v':\n
:IDIOM \(class-v '<SOME-CLASS>\)\n\n:EXAMPLE\n\(class-v 'tt--367\)\n
:NOTE Class vectors are intialized with respect to `eieio-default-superclass' when
defined without a parent class.\n:SEE info node `(eieio)Default Superclass'.\n
The init value of eieio-default-superclass is hardwired at eieio build time as
a vector of 26 elements. It is bootstrapped from the values of 26 constants.
The 26th of these constants `class-num-slots' sets the vector size of eieio's
default superclass and the default vector size of all classes derived thereof.\n
:EXAMPLE\n\(length \(class-v 'eieio-default-superclass\)\)
\(length \(class-v 'tt--367\)\)\n
25 other constants are also evaluated to generate eieio-default-superclass.
This happens at build time so that the default superclass has a value while it
is _itself_ being built.\n
Because present eieio sytems derive all other classes from eieio's default
superclass current standard eieio systems allow direct access to the individual
elements of a class using the values of those same constants defined to build
eieio's default superclass.\n
Access these `aref' elements with the macro `class-v' with expressions of the form:\n
:IDIOM \(aref \(class-v '<SOME-CLASS>\) <CONSTANT>\)\n
:EXAMPLE\n\(aref \(class-v 'tt--367\) class-symbol\)\n
Assuming the two example classes and instances above are initialized a full
class vector deconstructs as follows:\n
:EXAMPLE\n(class-v 'tt--367)\n
\[defclass               ;; 0  ;<- This determines if `class-p'
 tt--367                ;; 1  `class-symbol' ;<- This is the `class-constructor'
 nil                    ;; 2  `class-parent'
 \(tt--367-sub\)          ;; 3  `class-children'
 [0 s-367-0 s-367-1]    ;; 4  `class-symbol-obarray'
 \(s-367-0 s-367-1\)      ;; 5  `class-public-a'
 \(nil nil\)              ;; 6  `class-public-d'
 \(nil \"doc :s-367-1\"\)   ;; 7  `class-public-doc'
 [t t]                  ;; 7  `class-public-doc'
 \(nil nil\)              ;; 8  `class-public-type'
 \(nil nil\)              ;; 9  `class-public-custom'
 \(\(default\) \(default\)\)  ;; 10 `class-public-custom-label'
 \(nil nil\)              ;; 11 `class-public-custom-group'
 \(nil nil\)              ;; 12 `class-public-printer'\n
 \(\(:s-367-0 . s-367-0\)
  \(:s-367-1 . s-367-1\)\) ;; 14 `class-initarg-tuples'\n
 nil                    ;; 15 `class-class-allocation-a'
 nil                    ;; 16 `class-class-allocation-doc'
 []                     ;; 17 `class-class-allocation-type'
 nil                    ;; 18 `class-class-allocation-custom'
 nil                    ;; 19 `class-class-allocation-custom-label'
 nil                    ;; 20 `class-class-allocation-custom-group'
 nil                    ;; 21 `class-class-allocation-printer'
 nil                    ;; 22 `class-class-allocation-protection'
 []                     ;; 23 `class-class-allocation-values'\n
 [object tt--367 default-cache-object nil nil] ;; 24 `class-default-object-cache'\n
 \(:custom-groups \(default\)
  :documentation \"Dummy class tt-367\"\)]        ;; 25 `class-options'\n
 ==================\n :EIEIO-METHOD-TREE\n ==================\n
eieio stores a generic function's methods in an eieio-method-tree. This is a
kind of property on the generic's 'base' method. It has the form:\n
\(eieio-method-tree . \n                   [BEFORE PRIMARY AFTER
                    genericBEFORE genericPRIMARY genericAFTER]\)\n
Examine a generic function's method-tree with its eieio-method-tree property.\n
:IDIOM (get <METHOD> 'eieio-method-tree)\n
:EXAMPLE\n(get 'acc-s367-0 'eieio-method-tree)\n
\[nil\n nil    ;<- :BEFORE\n \(\(tt--367 lambda \(this\)
           \"Retrieves the slot `s-367-0' from an object of class `tt--367'\"
           \(if \(slot-boundp this \(quote s-367-0\)\)
               \(eieio-oref this \(quote s-367-0\)\) nil\)\)\)
        ;^- :PRIMARY
 nil    ;<- :AFTER\n nil    ;<- genericBEFORE \n nil    ;<- genericPRIMARY
 nil]   ;<- genericAFTER\n
 =====================\n :EIEIO-METHOD-OBARRAY\n =====================\n
eieio's method obarrays are stored as a property of a generic function on its
`eieio-method-obarray' property. This property is a vector which contains a list
of method bindings.\n\nA generic function's eieio-method-obarray has the form:\n
\(eieio-method-obarray . [BEFORE PRIMARY AFTER
                        genericBEFORE genericPRIMARY genericAFTER]\)\n
:IDIOM \(get <METHOD> 'eieio-method-obarray\)\n
:EXAMPLE\n\(get 'acc-s367-0 'eieio-method-obarray\)\n
\[[0 0 0 0 0 0 0 0 0 0 0]     aref 0 - all static methods.
 [0 0 0 0 0 0 0 0 0 0 0]     aref 1 - all methods classified as :before
 [0 0 0 0 0 0 0 0 tt--367    aref 2 - all methods classified as :primary
  0 0 0 0 0 0 0 0 0                   aref 2 is a vector of length 41
  0 0 0 0 0 0 0 0 0          \n  0 0 0 0 0 0 0 0 0          \n  0 0 0 0 0]
 [0 0 0 0 0 0 0 0 0 0 0]     aref 3 - all methods classified as :after
 nil                         aref 4 -   a generic classified as :before
 nil                         aref 5 -   a generic classified as :primary
 nil]                        aref 6 -   a generic classified as :after\n
Examine a particular type or group of methods with a key lookup into
the 'obarray' (a vector) of a generic function.\n
To find primary methods of a generic function get the 2nd index of it's obarray.\n
:IDIOM \(get <METHOD> 'eieio-method-tree\)\n
:EXAMPLE\n\(aref \(get 'acc-s367-sub-0 'eieio-method-obarray\) 2\)\n
\(aref \(get 'acc-s367-0 'eieio-method-obarray\) 2\)\n
A generic form can be interrogated with `eieio-generic-form':\n
:IDIOM \(eieio-generic-form <METHOD> <KEY> <CLASS>\)\n
:EXAMPLE\n\(eieio-generic-form 'acc-s367 2 tt--367-sub\)\n
\(tt--367 . tt--367\) ;key 2\n\(tt--367 . tt--367\) ;key 4
\(tt--367 . tt--367\) ;key 5\n\(tt--367 . tt--367\) ;key 6\n
:SEE-ALSO
`eieiomt-method-list'                  METHOD KEY CLASS
`eieiomt-install'                      METHOD-NAME
`eieiomt-add'                          METHOD-NAME METHOD KEY CLASS
`eieiomt-next'                         CLASS
`eieiomt-method-list'                  METHOD KEY CLASS
`eieiomt-sym-optimize'                 S
`eieio-unbind-method-implementations'  METHOD
`eieiomt-optimizing-obarray'          ;<VARIABLE>\n
 ===============================\n :METHODS-AND-GENERICS-EXAMINING
 ===============================\n
:EXAMPLE\n
\(eieio-describe-constructor 'tt--367\) ; :NOTE A `constructor' is a 'static' method.\n
\(describe-variable 'test-tt--367\)\n
\(describe-function 'acc-s367\)\n
\(eieio-describe-generic 'acc-s367\)\n
\(describe-method 'acc-s367-0\)\n
\(eieio-describe-generic 'acc-s367-sub-0\)\n
\(eieio-describe-method 'acc-s367-sub-0\)\n
\(eieio-describe-method 'acc-s367-0\)\n
\(describe-function 'acc-s367-sub-0\)\n\n
:SEE-ALSO `mon-help-eieio-defclass', `mon-help-eieio-functions'.\n►►►"
  (interactive "i\nP")
  (if (or insertp intrp)
      (mon-help-function-spit-doc 'mon-help-eieio-methods :insertp t)
      (message "Pass non-nil for optional arg INTRP")))
;;
;;; :TEST-ME (mon-help-eieio-methods)
;;; :TEST-ME (mon-help-eieio-methods t)
;;; :TEST-ME (describe-function 'mon-help-eieio-methods)

;;; ==============================
;;; :CREATED <Timestamp: #{2009-10-10T21:36:01-04:00Z}#{09417} - by MON>
(defun mon-help-type-predicates (&optional insertp intrp)
  "List of predicate functions for interrogating elisp types.\n
:SEE info node `(elisp)Type Predicates'\n:SEE info node `(CL)Type Predicates'\n
      _______________________                                       70.
     |                       |                                        
     | :TYPE-PREDICATES-SEQS |                                        
 ____|_______________________|____________                            
|                               --------  |                           
| `sequencep'                  |`listp' |-|--|`consp'                 
|              __________      |`nlistp'| |  .-+`atom'                
|             |          |      --------  |                           
|  ___________| `arrayp' |______________  |                           
| |   _________           _________     | |                           
| |  |         |         |         |    | |                           
| |  |`vectorp'|         |`stringp'|----|-|--|`string-or-null-p'      
| |  |_________|         |_________|    | |  .`char-or-string-p'      
| |  ______________    _______________  | |                           
| | |              |  |               | | |                           
| | |`char-table-p'|  |`bool-vector-p'| | |                           
| | |_|____________|  |_______________| | |  ___________________      
| |___|_________________________________| | |                   |     
|_____|___________________________________| | :NUMERICAL-SHOWER |     
      |                                  ___|___________________|_____
      |-+`keymapp'                      |                             |
      .--+`case-table-p'                |       `zerop'               |
      .--+`syntax-table-p'              |          |     `booleanp'   |
      .--+`display-table-p'             |      `numberp'              |
            ____________                |          |                  |
           |            |               |        +-|-+                |
           | `type-of'  |               | `float'| | |`natnump'       |
   ________|____________|___________    |          | .-+`wholenump'   |
  |                                 |   |          | .--+`integerp'-. |
  | bool-vector  <- `bool-vector-p' |   |          | .---+`oddp'    | |
  | buffer       <- `bufferp'       |   |          | .---+`evenp'   | |
  | char-table   <- `char-table-p'  |   |          |                | |
  | cons         <- `consp'         |   |  `plusp'-+-`minusp'       | |
  | float        <- `floatp'        |   |___________________________|_|
  | font-entity  <- `fontp'         |                               | 
  | font-object  <- `fontp'         |         `number-or-marker-p'+-| 
  | font-spec    <- `fontp'         |        `integer-or-marker-p'+-. 
  | frame        <- `framep'        |                                 
  | hash-table   <- `hash-table-p'  |                                 
  | integer      <- `integerp',     |                                 
  | marker       <- `markerp'       |                                 
  | overlay      <- `overlayp'      |                                 
  | process      <- `processp'      |                                 
  | string       <- `stringp'       |                                 
  | subr         <- `subrp'         |                                 
  | symbol       <- `symbolp'       |                                 
  | vector       <- `vectorp'       |                                 
  | window       <- `windowp'       |                                 
  |_________________________________|                               70^

;; :TYPE-PREDICATE-COMPILED-FUNCTION
`byte-code-function-p'\n
;; TYPE-PREDICATE-DISPLAY-CONFIG
`custom-theme-p'
`window-live-p'         
`window-configuration-p'
`user-variable-p'  
`frame-configuration-p'
`frame-live-p'\n
;; :TYPE-PREDICATE-FUNCTIONS
`typep'
`deftype'
`etypecase'
`typecase'
`check-type'
`functionp'
`keywordp'
`commandp'
:SEE-ALSO .\n►►►"
  (interactive "i\nP")
  (if (or insertp intrp)
      (mon-help-function-spit-doc 'mon-help-type-predicates :insertp t)
      (message "Pass non-nil for optional arg INTRP")))
;;
;;; :TEST-ME (mon-help-type-predicates)
;;: :TEST-ME (mon-help-type-predicates t)
;;; :TEST-ME (describe-function 'mon-help-type-predicates)
;;; :TEST-ME (apply 'mon-help-type-predicates '(t))

;;; ==============================
;;; :CREATED <Timestamp: #{2010-03-08T13:28:30-05:00Z}#{10101} - by MON KEY>
(defun mon-help-sequence-functions (&optional insertp intrp)
  "List of functions related to sequences list, alist, array, vector, ring, etc.\n
:SEE info node `(elisp)Sequences Arrays Vectors'.
:SEE info node (elisp)Lists'.\n
;; :SEQUENCE-GENERAL
`atom'
`elt'
`nth'
`copy-sequence'
`length'
`safe-length'
`sequencep'
`append'
`concat'\n
;; :SEQUENCE-CONS
`string-to-list'
`car-safe'
`cdr-safe'
`nlistp'
`listp'
`null'
`nthcdr'
`last'
`butlast'
`nbutlast'
`list'
`make-list'
`reverse'
`nreverse'
`copy-tree'
`number-sequence'
`setcar'
`setcdr'
`pop'
`push'
`nconc'
`add-to-list'
`add-to-ordered-list'
`delq'
`remq'
`delete'
`delete-dups'
`sort'
`memq'
`memql'
`member'
`member-ignore-case'\n
;; :SEQUENCE-ALIST
`assoc'
`rassoc'
`assoc-string'
`assq'
`rassq'
`assoc-default'
`copy-alist'
`assq-delete-all'
`rassq-delete-all'\n
;; :SEQUENCE-ALIST-FILE.lisp.emacs-lisp.assoc
`asort'
`aelement'
`aheadsym'
`anot-head-p'
`aput'
`adelete'
`aget'
`amake'\n
;; :SEQUENCE-ALIST-FILE.lisp.international.mule-util
`lookup-nested-alist'
`set-nested-alist'
`nested-alist-p'\n
;; :SEQUENCE-VECTOR
`vconcat'
`vectorp'
`string-to-vector'
`make-vector'\n
;; :SEQUENCE-BOOL-VECTOR
`make-bool-vector'
`bool-vector-p'\n
;; :SEQUENCE-ARRAY
`arrayp'
`aset'
`aref'
`fillarray'\n
;; :SEQUENCE-RING
`make-ring'
`ring-p'
`ring-size'
`ring-length'
`ring-elements'
`ring-copy'
`ring-empty-p'
`ring-ref'
`ring-insert'
`ring-remove'
`ring-insert-at-beginning'\n
:SEE-ALSO `mon-help-hash-functions', `mon-help-plist-functions',
`mon-help-plist-properties', `mon-help-type-predicates'.\n►►►"
;;; caar, cadr, cdar, cddr 
(interactive "i\nP")
  (if (or insertp intrp)
      (mon-help-function-spit-doc 'mon-help-sequence-functions :insertp t)
    (message "Pass non-nil for optional arg INTRP")))
;;
;;; :TEST-ME (mon-help-sequence-functions)
;;; :TEST-ME (mon-help-sequence-functions t)
;;; :TEST-ME (describe-function 'mon-help-sequence-functions)
;;; :TEST-ME (apply 'mon-help-sequence-functions nil '(t))

;;; ==============================
;;; :CREATED <Timestamp: #{2010-02-25T16:33:59-05:00Z}#{10084} - by MON KEY>
(defun mon-help-key-functions (&optional insertp intrp)
  "List of keyboard and key related functions, variables, keymaps.\n
:SEE info node `(elisp)Keymaps'\n
;; :KEY-FUNCTIONS-INSPECT
`describe-bindings'
`key-binding'
`keyboard-coding-system'
`lookup-key'
`minor-mode-key-binding'
`where-is'
`where-is-internal'\n
;; :KEY-FUNCTIONS-READ-EVENT
`event-basic-type'
`event-convert-list'
`event-modifiers'
`kbd'
`listify-key-sequence'
`prefix-numeric-value'
`read-char-exclusive'
`read-event'
`read-key-sequence'
`read-key-sequence-vector'
`substitute-command-keys'
`substitute-key-definition'
`substitute-key-definition-key'
`this-command-keys'
`this-command-keys-vector'
`unread-command-char'
`unread-command-events'\n
;; :KEY-FUNCTIONS-STATE
`discard-input'
`input-pending-p'
`keyboard-quit'
`while-no-input'
`with-local-quit'\n
;; :KEY-FUNCTIONS-BIND
`define-key'
`define-prefix-command'
`global-key-binding'
`global-set-key'
`global-unset-key'
`keyboard-translate'
`keypad-setup'
`local-key-binding'
`local-set-key'
`local-unset-key'\n
;; :KEY-FUNCTIONS-MAP-HANDLERS
`copy-keymap'
`make-keymap'
`make-sparse-keymap'
`map-keymap'
`set-keymap-parent'
`suppress-keymap'
`use-global-map'
`use-local-map'
`use-local-map'\n
;; :KEY-FUNCTIONS-MAP-INSPECT
`accessible-keymaps'
`command-remapping'
`current-active-maps'
`current-global-map'
`current-local-map'
`current-minor-mode-maps'
`keymap-parent'
`keymapp'\n
;; :KEY-VARIABLES-PREFIX-LAST
`current-prefix-arg'
`inhibit-quit'
`key-substitution-in-progress'
`last-prefix-arg'
`num-input-keys'
`num-nonmacro-input-events'
`prefix-arg'
`quit-flag'
`this-command-keys-shift-translated'\n
;; :KEY-VARIABLES-INPUT-MOD
`extra-keyboard-modifiers'
`input-decode-map'
`keyboard-translate-table'
`keyboard-type'
`keypad-numlock-setup'
`keypad-numlock-shifted-setup'
`keypad-shifted-setup'
`meta-prefix-char'
`set-keyboard-coding-system'
`special-event-map'
`translation-table-for-input'
`where-is-preferred-modifier'\n
;; :KEY-VARIABLES-MODE-MAPS
`emulation-mode-map-alists'
`minor-mode-map-alist'
`minor-mode-overriding-map-alist'
`overriding-local-map'
`overriding-local-map-menu-flag'
`overriding-terminal-local-map'\n
;; :KEY-KEYMAPS                   :SEE info node `(elisp)Standard Keymaps'
`Buffer-menu-mode-map'
`Helper-help-map'
`Info-edit-map'
`Info-mode-map'
`apropos-mode-map'
`c-mode-map'
`command-history-map'
`ctl-x-4-map'
`ctl-x-5-map'
`ctl-x-map'
`custom-mode-map'
`debugger-mode-map'
`dired-mode-map'
`edit-abbrevs-map'
`edit-tab-stops-map'
`electric-buffer-menu-mode-map'
`electric-history-map'
`emacs-lisp-mode-map'
`esc-map'
`facemenu-background-menu'
`facemenu-face-menu'
`facemenu-foreground-menu'
`facemenu-indentation-menu'
`facemenu-justification-menu'
`facemenu-menu'
`facemenu-special-menu'
`fundamental-mode-map'
`global-map'
`grep-mode-map'
`help-map'
`help-mode-map'
`input-decode-map'
`isearch-mode-map'
`key-translation-map'
`kmacro-map'
`lisp-interaction-mode-map'
`lisp-mode-map'
`local-function-key-map'
`menu-bar-edit-menu'
`menu-bar-files-menu'
`menu-bar-help-menu'
`menu-bar-mule-menu'
`menu-bar-search-menu'
`menu-bar-tools-menu'
`mode-specific-map'
`multi-query-replace-map'
`occur-mode-map'
`query-replace-map'
`search-map'
`text-mode-map'
`tool-bar-map'
`view-mode-map'\n
;; :KEY-FUNCTIONS-W32
`w32-register-hot-key'
`w32-unregister-hot-key'
`w32-registered-hot-keys'
`w32-reconstruct-hot-key'
`w32-toggle-lock-key'\n
;; :KEY-VARIABLES-W32
`w32-alt-is-meta'
`w32-pass-alt-to-system'
`w32-quit-key'
`w32-phantom-key-code'
`w32-enable-num-loc'
`w32-enable-caps-lock'
`w32-scroll-lock-modifier'
`w32-apps-modifier'
`w32-mouse-button-tolerance'
`w32-mouse-move-interval'
`w32-pass-extra-mouse-buttons-to-system'
`w32-pass-multimedia-buttons-to-system'
`w32-pass-rwindow-to-system'
`w32-pass-lwindow-to-system'
`w32-rwindow-modifier'
`w32-pass-multimedia-buttons-to-system'
;; :KEY-FUNCTIONS-MON-LOCAL
`mon-test-keypresses'
:SEE-ALSO `mon-help-keys', `mon-help-diacritics', `mon-help-w32-functions',
`mon-help-slime-keys'.\n►►►"
(interactive "i\nP")
  (if (or insertp intrp)
      (mon-help-function-spit-doc 'mon-help-key-functions :insertp t)
    (message "Pass non-nil for optional arg INTRP")))
;;
;;; :TEST-ME (mon-help-key-functions)
;;; :TEST-ME (mon-help-key-functions t)
;;; :TEST-ME (describe-function 'mon-help-key-functions)
;;; :TEST-ME (apply 'mon-help-key-functions '(t))


;;; ==============================
;;; :CREATED <Timestamp: #{2010-04-01T13:54:15-04:00Z}#{10134} - by MON KEY>
(defun mon-help-load-functions (&optional insertp intrp)
  "List of functions related to loading elisp files.\n
:SEE info node `elisp(Loading)'.\n
;; :LOAD-FUNCTIONS
`autoload'
`load'
`load-file'
`load-library'
`load-theme'
`load-with-code-conversion'\n
`provide'
`require'
`intern'
`intern-soft'
;; :LOAD-DECLARE
`declare'                       :SEE info node `(elisp)Declaring Functions'
`declare-function'
`check-declare'
`check-declare-file'
`check-declare-directory'
`byte-compile-declare-function'
;; :LOAD-EVAL
`eval'
`eval-and-compile'
`eval-buffer'
`eval-current-buffer'
`eval-when'
`eval-when-compile'
`eval-after-load'
`load-time-value'\n
;; :LOAD-FILE-DIRECTORY
`get-load-suffixes'
`locate-library'
`symbol-file'
\(getenv \"EMACSLOADPATH\"\)
`load-path'                     ;<VARIABLE> 
`path-separator'                ;<VARIABLE>\n
;; :LOAD-HISTORY
`load-history-regexp'
`load-history-filename-element'
`featurep'
`preloaded-file-list'           ;<VARIABLE>
`features'                      ;<VARIABLE>
`current-load-list'             ;<VARIABLE>
`load-history'                  ;<VARIABLE>\n
;; :LOAD-UNLOAD
`unload-feature'
`makunbound'
`unintern'
`unload-feature-special-hooks' ;<VARIABLE>\n
;; :LOAD-VARIABLES
`obarray'
`byte-compile-dynamic-docstrings'
`after-load-alist'
`load-in-progress'
`force-load-messages'
`load-force-doc-strings'
`load-file-rep-suffixes'
`load-read-function'
`load-source-file-function'
`load-suffixes'
`read-symbol-positions-list'
`read-with-symbol-positions'\n
:SEE :FILE lread.c loaddefs.el
:SEE-ALSO `mon-help-emacs-introspect', `mon-help-read-functions', `mon-help-print-functions'.\n►►►"
(interactive "i\nP")
  (if (or insertp intrp)
      (mon-help-function-spit-doc 'mon-help-load-functions :insertp t)
    (message "Pass non-nil for optional arg INTRP")))
;;
;;; :TEST-ME (mon-help-load-functions)
;;; :TEST-ME (describe-function 'mon-help-load-functions)
;;; :TEST-ME (apply 'mon-help-load-functions nil '(t))

;;; ==============================
;;; :CREATED <Timestamp: #{2009-09-20T13:26:27-04:00Z}#{09387} - by MON>
(defun mon-help-read-functions (&optional insrtp intrp)
  "List of functions for reading.\n
:SEE info node `(elisp)Read and Print'.\n
      _______                       ____________________  60.
     |       |                     |                    |   
     | :READ |                     | :STANDARD-READERS  |   
   __|_______|_______________     _|____________________|_  
  |                          |   |                        | 
  | `read'                   |   | `read-color'           | 
  | `read-from-string'       |   | `read-kbd-macro'       | 
  | `read-from-whole-string' |   | `read-number'          | 
  |__________________________|   | `read-passwd'          | 
        _________________        | `read-regexp'          | 
       |                 |       | `read-string'          | 
       | :STANDARD-INPUT |       | `read-shell-command'   | 
       | :READ-STREAMS   |       |________________________| 
   ____|_________________|________________________________  
  |                                                       | 
  |  `standard-input'--+ <VARIABLE>                       | 
  |    |                 ______________________________   | 
  |    |-+ <BUFFER>     |                              |  | 
  |    |-+ <MARKER>     | `read-circle'                |  | 
  |    |-+ <STRING>     |  |-+ <VARIABLE>              |  | 
  |    |-+ <FUNCTION>   | `read-with-symbol-positions' |  | 
  |    |-+ <SYMBOL>     |  |-+ <VARIABLE>              |  | 
  |    |-+ t            | `read-symbol-positions-list' |  | 
  |    |-+ nil          |  |-+ <VARIABLE>              |  | 
  |                     |______________________________|  | 
  |_______________________________________________________| 
     ______________                          __________     
    |              |                        |          |    
    | :MINI-BUFFER |                        | :BUFFERS |    
   _|______________|_______      ___________|__________|__  
  |                        |    |                         | 
  | `read-minibuffer'      |    | `read-buffer'           | 
  | `read-from-minibuffer' |    | `read-buffer-function'  | 
  | `read-no-blanks-input' |    | `read-buffer-to-switch' | 
  |________________________|    |_________________________|   
     ________                                  ________      
    |        |                                |        |     
    | :FILES |                                | :CHARS |     
   _|________|________________    ____________|________|____ 
  |                           |  |                          |
  | `read-file-name'          |  | `read-char'              |
  | `read-directory-name'     |  | `read-char-by-name'      |
  | `read-file-name-internal' |  | `read-char-excvusive'    |
  | `read-file-modes'         |  | `read-charset'           |
  | `file-readable-p'         |  | `read-quoted-char'       |
  | `desktop-read'            |  | `read-quoted-char-radix' |
  | `read-abbrev-file'        |  |  |-+<VARIABLE>           |
  |___________________________|  |__________________________|
    _______________                            ________
   |               |                          |        |
   | :KEY-EVENTS   |                          | :FACES |
 __|_______________|_________   ______________|________|____
|                            | |                            |
| `read-event'               | | `read-face-font'           |
| `read-key-sequence'        | | `read-face-name'           |
| `read-key-sequence-vector' | | `read-face-attribute'      |
| `read-command'             | | `read-all-face-attributes' |
| `unread-command-events'    | | `read-face-and-attribute'  |
|  |-+ <VARIABLE>            | |____________________________|
|____________________________|          ______________       
                                       |              |      
                                       | :ENVIRONMENT |      
                              _________|______________|_____ 
                             |                              |
                             | `read-coding-system'         |
                             | `read-non-nil-coding-system' |
                             | `read-input-method-name'     |
                             | `read-multilinlual-string'   |
                             | `read-language-name'         |
                             | `read-envvar-name'           |
                             | `read-with-symbol-positions' |
                             | `read-symbol-positions-list' |
                             |______________________________|
                                                          60^\n
:SEE :FILE `lread.c'
:SEE-ALSO `mon-help-print-functions', `mon-help-load-functions',
`mon-help-key-functions', `mon-help-char-representation'.\n►►►"
  (interactive "i\nP")
  (if (or insrtp intrp)
      (mon-help-function-spit-doc 'mon-help-read-functions :insertp t)
    (message "Pass non-nil for optional arg INTRP")))
;;
;;; :TEST-ME (mon-help-read-functions)
;;; :TEST-ME (mon-help-read-functions t)
;;; :TEST-ME (describe-function 'mon-help-read-functions)
;;; :TEST-ME (apply 'mon-help-read-functions '(t))

;;; ==============================
;;; :CREATED <Timestamp: #{2010-01-13T12:21:21-05:00Z}#{10023} - by MON KEY>
(defun mon-help-print-functions (&optional insertp intrp)
  "Print related functions and Variables which affect their output.\n
;; :PRINT-FUNCTIONS      :SEE info node `(elisp)Output Functions'
`eval-print-last-sexp'
`format'
`message'
`prin1'
`prin1-char'
`prin1-to-string'
`princ'
`princ-list'
`print'
`print-buffer'
`print-region'
`pp-to-string'
`terpri'
`with-output-to-string'
`write-char'\n
;; :PRINT-PRETTY-FUNCTIONS.lisp.emacs-lisp.pp
`pp'
`pp-buffer'
`pp-display-expression'
`pp-eval-expression'
`pp-eval-last-sexp'
`pp-last-sexp'
`pp-macroexpand-expression'
`pp-macroexpand-last-sexp'\n
;; :PRINT-STREAMS             :SEE info node `(elisp)Streams Intro'
`standard-output'
`standard-input'\n
;; :PRINT-VARIABLES           :SEE info node `(elisp)Output Variables'
`eval-expression-print-length'
`eval-expression-print-level'
`float-output-format'
`printable-chars'
`print-charset-text-property'
`print-circle'
`print-continuous-numbering'
`print-escape-multibyte'
`print-escape-newlines'
`print-escape-nonascii'
`print-length'
`print-level'
`print-number-table'
`print-quoted'
`print-gensym'
 \(let \(\(print-gensym t\)
       \(my-bubba \(make-symbol \"bubba\"\)\)\)
   \(princ my-bubba \(current-buffer\)\)\)\n ;=> #:bubba\n
:SEE info node `(elisp)Read and Print'
:SEE info node `(elisp)Printed Representation'\n
:SEE-ALSO `mon-help-read-functions', `mon-help-load-functions',
`mon-help-char-representation', `mon-help-format-width',
`gnus-bind-print-variables'.\n►►►"
  (interactive "i\nP")
  (if (or insertp intrp)
      (mon-help-function-spit-doc 'mon-help-print-functions :insertp t)
      (message "Pass non-nil for optional arg INTRP")))
;;
;;; :TEST-ME (mon-help-print-functions )
;;; :TEST-ME (mon-help-print-functions t)
;;; :TEST-ME (describe-function 'mon-help-print-functions)
;;; :TEST-ME (apply 'mon-help-print-functions '(t))

;;; ==============================
;;; :CREATED <Timestamp: #{2010-01-16T15:11:07-05:00Z}#{10026} - by MON KEY>
(defun mon-help-hash-functions (&optional insertp intrp)
  "Hash related functions.\n
:SEE info node `(elisp)hash functions)'.
:SEE info node `(elisp)Hash Tables'.\n
;; :HASH-TABLE-EMACS
`make-hash-table' <&rest KEYWORD-ARGS>
                         [:rehash-size {integer|float}]
                         [:rehash-threshold float] ;<- \(and \(<= F 1\) \(floatp F\)\)
                         [:size integer] 
                         [:test {eq|eql|equal}]
                         [:weakness {nil|key|value|key-or-value|key-and-value}]
`clrhash'
`cl-not-hash-table'
:ALIASED-BY `cl-make-hash-table'  <- `make-hash-table'
:ALIASED-BY `cl-hash-table-p'     <- `hash-table-p'
:ALIASED-BY `cl-hash-table-count' <- `hash-table-count'
:ALIASED-BY `cl-gethash'          <- `gethash'
:ALIASED-BY `cl-puthash'          <- `puthash'
:ALIASED-BY `cl-remhash'          <- `remhash'
:ALIASED-BY `cl-clrhash'          <- `clrhash'
:ALIASED-BY `cl-maphash'          <- `maphash'\n
`copy-hash-table',    
`define-hash-table-test'
`gethash'
`hash-table-count'
`hash-table-p'
`hash-table-rehash-size'
`hash-table-rehash-threshold'
`hash-table-size'
`hash-table-test'
`hash-table-weakness',	      
`maphash'
`puthash'
`remhash'
`sxhash'\n
;; :HASH-TABLE-FUNCTIONS-MON-LOCAL
`mon-hash-add-uniquify'
`mon-hash-all-keys'
`mon-hash-all-values'
`mon-hash-describe'
`mon-hash-describe-descend'
`mon-hash-make-size'               :SEE-ALSO `sxhash'
`mon-hash-readlines-buffer'
`mon-hash-readlines-file'
`mon-hash-to-list'\n
;; :HASH-TABLE-MACROS-MON-LOCAL
`mon-hash-add-uniquify'
`mon-hash-all-keys'
`mon-hash-all-values'
`mon-hash-describe'
`mon-hash-describe-descend'
`mon-hash-get-items'
`mon-hash-get-keys'
`mon-hash-get-string-keys'
`mon-hash-get-symbol-keys'
`mon-hash-get-values'
`mon-hash-has-key'
`mon-dir-hash-images'
`mon-hash-make-size'
`mon-hash-put-CL'
`mon-hash-readlines-buffer'
`mon-hash-readlines-file'
`mon-hash-table-complete'
`mon-hash-to-list'
`mon-hash<-vector'\n
;; :HASH-TABLE-EXAMPLE\n
\(let \(\(super-hash \(make-hash-table :test 'equal\)\)
      \(hotness\)\)
  \(dolist \(S '\(\(\"Christie Brinkley\" . 8\)
               \(\"Kim Alexis\" . 7\)
               \(\"Paulina Porizkova\" . 10\)
               \(\"Elle Macpherson\" . 9\)\)
           \(progn
             \(maphash #'\(lambda \(N R\) 
                          \(push \(format \"SUPERMODEL %s is a %d\" N R\) hotness\)\)
                      super-hash\)
             \(setq hotness \(mapconcat #'\(lambda \(H\) \(identity H\)\) hotness \"\\n\"\)\)\)\)
    \(puthash \(car S\) \(cdr S\) super-hash\)\)\)\n\n
:SEE-ALSO `mon-help-sequence-functions', `mon-help-plist-functions',
`mon-help-plist-properties', `mon-help-type-predicates'.\n►►►"
  (interactive "i\nP")
  (if (or insertp intrp)
      (mon-help-function-spit-doc 'mon-help-hash-functions :insertp t)
      (message "Pass non-nil for optional arg INTRP")))
;;
;;; :TEST-ME (mon-help-hash-functions)
;;; :TEST-ME (mon-help-hash-functions t)
;;; :TEST-ME (describe-function 'mon-help-hash-functions)
;;; :TEST-ME (apply 'mon-help-hash-functions nil '(t))

;;; ==============================
;;; :CREATED <Timestamp: #{2009-09-19T17:02:02-04:00Z}#{09386} - by MON KEY>
(defun mon-help-plist-functions (&optional insertp intrp)
  "Help for plist and property list related functions.\n
:SEE info node `(elisp)Property Lists'.
:SEE info node `(elisp)Symbol Plists'.
:SEE info node `(elisp)Other Plists'.\n
;; :PLIST-FUNCTIONS-GETTERS
`get'
`plist-get'
`lax-plist-get'
;; :PLIST-FUNCTIONS-SETTERS
`setplist'
`put'
`plist-put'
`lax-plist-put'
;; :PLIST-FUNCTION-INSPECT
`symbol-plist'
`plist-member'
;; :PLIST-FUNCTION-PROCESS
`process-plist'
`process-put'
`process-get'
;; :PLIST-FUNCTION-CHARACTER        :SEE info node `(elisp)Character Properties'
`charset-plist'
`char-code-property-description'
`put-char-code-property'
`get-char-code-property'            :SEE `mon-help-char-representation'
`documentation-property'\n
;; :PLIST-FUNCTIONS-MON-LOCAL
`mon-plist-keys'
`mon-plist-remove'\n
:SEE-ALSO `mon-help-plist-properties', `mon-help-text-property-functions'.
`mon-help-hash-functions', `mon-help-sequence-functions', `mon-help-plist-functions',
`mon-help-type-predicates'.\n►►►"
  (interactive "i\nP")
  (if (or insertp intrp)
      (mon-help-function-spit-doc 'mon-help-plist-functions :insertp t)
    (message "Pass non-nil for optional arg INTRP")))
;;
;;; :TEST-ME (mon-help-plist-functions)
;;; :TEST-ME (mon-help-plist-functions t)
;;; :TEST-ME (call-interatively 'mon-help-plist-functions)
;;; :TEST-ME (describe-function 'mon-help-plist-functions)

;;; ==============================
;;; :CREATED <Timestamp: #{2010-03-08T12:07:55-05:00Z}#{10101} - by MON KEY>
(defun mon-help-plist-properties (&optional insertp intrp)
  "List of common Emacs elisp ``built-in'' properties appearing on plists.\n
:NOTE Unless indicated following otherwise, following list enumerates a property
;; :PLIST-PROPERTIES
`buffer-access-fontified-property' ; :NOTE Also a <FUNCTION>
`lisp-indent-function'\n
;; :PLIST-PROPERTIES-DOC
`doc-string-elt'
`lisp-doc-string-elt-property'
`char-code-property-documentation'
`face-documentation'               ; :NOTE Also a <FUNCTION>
`function-documentation'
`theme-documentation'
`variable-documentation'\n
;; :PLIST-PROPERTIES-FACE
`customized-face'         
`face-alias'  
`face-defface-spec'
`face-documentation'        
`saved-face'
;; :PLIST-PROPERTIES-SYNTAX
`syntax-table'
`text-clone-syntax'\n
;; :PLIST-PROPERTIES-CHARACTER
`bidi-class'
`canonical-combining-class'
`decimal-digit-value'
`decomposition'
`digit'
`general-category'
`iso-10646-comment'
`lowercase'
`mirrored'
`name'
`numeric-value'              
`old-name'
`titlecase'
`uppercase'
;; :PLIST-PROPERTIES-OVERLAY
`after-string'
`before-string'
`evaporate'
`isearch-open-invisible'
`isearch-open-invisible-temporary'
`priority'
`window'\n
;; :PLIST-PROPERTIES-TEXT-PROPERTIES-SPECIAL
:SEE `mon-help-text-property-properties'
;; :PLIST-PROPERTIES-ERROR
`error' 
       <PLIST> (symbol-plist 'error)
      ¦ `error-conditions'
      ¦ `error-message'
      ¦ `byte-compile-format-like'\n
:SEE-ALSO `mon-help-plist-functions', `mon-help-text-property-functions',
`mon-help-text-property-properties'.\n►►►"
(interactive "i\nP")
  (if (or insertp intrp)
      (mon-help-function-spit-doc 'mon-help-plist-properties :insertp t)
    (message "Pass non-nil for optional arg INTRP")))
;;
;;; :TEST-ME (mon-help-plist-properties)
;;; :TEST-ME (mon-help-plist-properties t)
;;; :TEST-ME (describe-function 'mon-help-plist-properties)
;;; :TEST-ME (apply 'mon-help-plist-functions nil '(t))

;;; ==============================
;;; :SOURCE from commented sections of :FILE `cus-face.el' and :FILE `custom.el'
;;; The Example theme, forest-theme.el
;;; :COURTESY Chong Yidong :SOURCE emacs-devel :SUBJECT Re: Color themes
;;; :DATE Sun, 09 Aug 2009 12:18:01 -0400
;;; :SEE (URL `http://lists.gnu.org/archive/html/emacs-devel/2009-08/msg00356.html')
;;; :CREATED <Timestamp: #{2009-08-24T18:30:56-04:00Z}#{09351} - by MON KEY>
(defun mon-help-faces-themes (&optional insertp intrp)
  "Functions for handling themes and their faces.\n
;; :THEME-FUNCTIONS
`deftheme'                    ;<MACRO>
`load-theme'
`provide-theme'
`enable-theme'
`disable-theme'
;; :FACE-CUSTOM
`custom-set-faces'
`custom-reset-faces'
`custom-declare-face'
`custom-face-attributes-get'
;; :FACE-CUSTOM-THEME
`custom-declare-theme'
`customize-create-theme'
`custom-push-theme'
`custom-make-theme-feature'
`custom-check-theme'
`custom-variable-theme-value'
`custom-theme-recalc-variable'
`custom-theme-p'
`custom-theme-set-faces'
`custom-theme-reset-faces'
`custom-theme-recalc-face'
`custom-theme-set-variables'
;; :FACE-CUSTOM-VARIABLES
`custom-face-attributes'      ;<CONSTANT>
`custom-enabled-themes'
`custom-enabling-themes'
`custom-theme-directory'
`custom-known-themes'\n
:SEE :FILE `cus-face.el', `custom.el', `cus-edit.el'.\n
;; :THEME-CUSTOM
Custom themes are collections of settings that can be enabled or
disabled as a unit.\n
Each Custom theme is defined by a symbol, called the theme name.
The `theme-settings' property of the theme name records the
variable and face settings of the theme.  This property is a list
of elements, each of the form:\n
    (PROP SYMBOL THEME VALUE)\n
- PROP is either `theme-value' or `theme-face'
- SYMBOL is the face or variable name
- THEME is the theme name (redundant, but simplifies the code)
- VALUE is an expression that gives the theme's setting for SYMBOL.\n
The theme name also has a `theme-feature' property, whose value is
specified when the theme is defined (see `custom-declare-theme').
Usually, this is just a symbol named THEME-theme.  This lets
external libraries call \(require 'foo-theme\).\n
In addition, each symbol (either a variable or a face) affected by
an *enabled* theme has a `theme-value' or `theme-face' property,
which is a list of elements each of the form:\n
    (THEME VALUE)\n
which have the same meanings as in `theme-settings'.\n
The `theme-value' and `theme-face' lists are ordered by decreasing
theme precedence.  Thus, the first element is always the one that
is in effect.\n
Each theme is stored in a theme file, with filename THEME-theme.el.
Loading a theme basically involves calling \(load \"THEME-theme\"\)
This is done by the function `load-theme'.  Loading a theme
automatically enables it.\n
When a theme is enabled, the `theme-value' and `theme-face'
properties for the affected symbols are set.  When a theme is
disabled, its settings are removed from the `theme-value' and
`theme-face' properties, but the theme's own `theme-settings'
property remains unchanged.\n
;; :THEME-DEFINING
A theme file should be named `THEME-theme.el' (where THEME is the theme
name), and found in either `custom-theme-directory' or the load path.
It has the following format:\n
\(deftheme THEME DOCSTRING\)
\(custom-theme-set-variables 'THEME  [THEME-VARIABLES]\)
\(custom-theme-set-faces 'THEME [THEME-FACES]\)
\(provide-theme 'THEME\)\n
;; :THEME-EXAMPLE :SEE :FILE forest-theme.el\n
\(deftheme forest \"Created 2009-08-09.\"\)\n
\(custom-theme-set-faces 'forest\n
 '\(default \(\(t \(:foreground \"wheat\" :background \"black\"\)\)\)\)\n
 '\(font-lock-comment-face \(\(\(\(class color\) \(min-colors 88\)\)
                            \(:foreground  \"medium sea green\"\)\)\)\)\n
 '\(font-lock-constant-face \(\(\(\(class color\) \(min-colors 88\)\)
                             \(:foreground \"turquoise\"\)\)\)\)\n
 '\(font-lock-function-name-face \(\(\(\(class color\) \(min-colors 88\)\)
                                  \(:foreground \"pale green\"\)\)\)\)\n
 '\(font-lock-keyword-face \(\(\(\(class color\) \(min-colors 88\)\)
                            \(:foreground \"white\"\)\)\)\)\n\n
 '\(font-lock-string-face \(\(\(\(class color\) \(min-colors 88\)\)
                           \(:foreground \"dark khaki\"\)\)\)\)\n
 '\(font-lock-type-face \(\(\(\(class color\) \(min-colors 88\)\)
                         \(:foreground \"medium aquamarine\"\)\)\)\)\n
 '\(font-lock-variable-name-face \(\(\(\(class color\) \(min-colors 88\)\)
                                  \(:foreground \"yellow green\"\)\)\)\)\n
 '\(font-lock-warning-face \(\(\(\(class color\) \(min-colors 88\)\)
                            \(:foreground \"salmon1\"\)\)\)\)\n
 '\(font-lock-builtin-face \(\(\(\(class color\) \(min-colors 88\)\)
                            \(:foreground \"LightSteelBlue\"\)\)\)\)\n
 '\(region \(\(\(\(class color\) \(min-colors 88\)\)
            \(:foreground \"white\" :background \"dark green\"\)\)\)\)\n
 '\(highlight \(\(\(\(class color\) \(min-colors 88\)\)
               \(:foreground \"white\" :background \"dark green\"\)\)\)\)\)\n
\(provide-theme 'forest\)\n
;;;; end forest-theme.el\n
:SEE info node `(elisp)Defining Faces'.\n:SEE info node `(elisp)Face Attributes'.
:SEE-ALSO `mon-help-faces', `mon-help-faces-basic', `mon-help-color-chart'
`mon-help-font-lock-functions', `mon-help-font-lock',
`mon-help-custom-keywords', `mon-help-widgets', `mon-help-easy-menu',
`mon-help-plist-functions',`mon-help-eieio-defclass',
`mon-help-eieio-functions', `mon-help-eieio-methods'.\n►►►"
  (interactive "i\np")
  (if (or insertp intrp)
      (mon-help-function-spit-doc 'mon-help-faces :insertp t)
    (message "Pass non-nil for optional arg INTRP")))
;;
;;; :TEST-ME (mon-help-faces-themes t)

;;; ==============================
;;; :RENAMED `mon-help-make-faces'  -> `mon-help-faces'
;;; :CREATED <Timestamp: #{2009-09-26T13:23:36-04:00Z}#{09396} - by MON KEY>
(defun mon-help-faces (&optional insertp intrp)
"Functions, Variables, Properties, etc. for defining faces.\n
    _________________                                 
   |                 | :SEE info node `(elisp)Defining Faces'            
   | :FACE-DEFINING  | :SEE info node `(elisp)Face Functions'                             
 __|_________________|_________________________________________________73.
|                                         |                              |
| `defface' <MACRO>                       |   :FACE-DEFINING-FUNCTIONS   |
|  :SPEC                                  |______________________________|
|  | :DISPLAY                             |                              |
|  | |-+ defalut                          | `make-face'                  |
|  | |-+ t                                | `face-list'                  |
|  | |-+ <LIST> -> of form: (Key Value)   | `copy-face'                  |
|  |   ¦ (type {graphic, x, pc, w32, tty})| `face-id'                    |
|  |   ¦ (class [color|grayscale|mono})   | `face-documentation'         |
|  |   ¦ (background [light|dark])        | `face-equal'                 |
|  |   ¦ (min-colors <INTEGER>)           | `face-differs-from-default-p'|
|  |   ¦ (supports   <VALUE>)             |______________________________|
|  |                                                                     |
|  `---------------------.                                               |
|                         \\                                              |
|                          \\     :SEE info node `(elisp)Face Attributes' |
|__________________________ \\    ________________________________________|
|                          | `->|                                        |
| :FACE-ATTRIBUTE-KEYWORDS |    | :family - <STRING>                     |
|__________________________|__  |  { Fontset name, Font family }         |
|                             | |  :NOTE `*' and `?' wildcards allowed.  |
|  :family :foundry           | |  :SEE `font-family-list'               |
|  :font   :fontset           | |________________________________________|
|  :height                    | |                                        |
|  :width :weight :slant      | | :foundry - <STRING>                    |
|  :foreground :background    | | :NOTE `*' and `?' wildcards allowed.   |
|  :underline  :overline      | |________________________________________|
|  :strike-through            | |                                        |
|  :box                       | | :font - (a font object)                |
|  :inverse-video             | | :SEE info node `(elisp)Font Selection' |
|  :stipple                   | | :SEE info node `(elisp)Fontsets'       |
| `face-attribute-name-alist' | |________________________________________|
|_____________________________| |                                        |
|                             | | :height - [<INTEGER>|<FLOAT>]          |
| :FACE-ATTRIBUTE-FUNCTIONS   | |  { 1/10 point, float }                 |
|                             | |________________________________________|
|-----------------------------| |                                        |
|                             | | :width - <SYMBOL>                      |
| `font-family-list'          | |  { normal, condensed, expanded         |
| `face-attribute'            | |    semi-condensed, semi-expanded       |
| `set-face-attribute'        | |    extra-condensed, extra-expanded     |
| `face-all-attributes'       | |    ultra-condensed, ultra-expanded }   |
| `merge-face-attribute'      | |________________________________________|
| `face-attribute-relative-p' | |                                        |
| `invert-face'               | | :weight - <SYMBOL>                     |
| `face-foreground'           | |  { normal, bold, light                 |
| `face-background'           | |    semi-bold, semi-light               |
| `face-stipple'              | |    extra-bold, extra-light             |
| `face-font'                 | |    ultra-bold, utltra-light }          |
| `face-bold-p'               | |________________________________________|
| `face-italic-p'             | |                                        |
| `face-underline-p'          | | :slant - <SYMBOL>                      |
| `face-inverse-video-p'      | |  { normal, italic, oblique,            |
|                             | |   reverse-italic, reverse-oblique }    |
|_____________________________| |________________________________________|
|                             | |                                        |
| :FACE-ATTRIBUTE-VARIABLES   | | :foreground - [<STRING>|<HEX-VAL>]     |
|                             | | :background - [<STRING>|<HEX-VAL>]     |
|-----------------------------| | :SEE info node `(elisp)Color Names'    |
|                             | |             `mon-help-color-chart'     |
| `bitmap-spec-p'             | |         `mon-help-color-functions'     |
| `face-attribute-name-alist' | |________________________________________|
| `custom-face-attributes'    | |                                        |
| `frame-background-mode'     | | :underline - [<BOOLEAN>|<STRING>]      |
| `underline-minimum-offset'  | | :overline  - [<BOOLEAN>|<STRING>]      |
| `x-bitmap-file-path'        | | :strike-through - [<BOOLEAN>|<STRING>] |
|                             | |  { t - using face's color              |
|_____________________________| |    <STRING> - Using specified <COLOR>  |
|                             | |    nil - do not apply effect }         |
| :FACE-PROPERTY-ATTRIBUTES   | |________________________________________|
|  (face symbol properties)   | |                                        |
|                             | | :box - [<BOOLEAN>|<STRING>|<LIST>]     |
|-----------------------------| |  { nil - no box                        |
|                             | |   t - linewidth in :foreground <COLOR> |
| `face-alias'                | |   color - box w/ line width in <COLOR> |
| `face-defface-spec'         | |   ( :line-width <WIDTH>                |
| `customized-face'           | |     :color <COLOR>                     |
| `face-documentation'        | |     :style <STYLE> ) }                 |
| `saved-face'                | |________________________________________|
|                             | |                                        |
|_____________________________| | :inverse-video - <BOOLEAN>             |
                                |  { t - yes                             |
                                |    nil - no }                          |
 _____________________________  |________________________________________|
|                             | |                                        |
|      :FACE-READERS          | | :stipple - [<BOOLEAN>|<STRING>]        |
|_____________________________| |  { <BITMAP> :SEE `x-bitmap-file-path'  |
|                             | |   ,----                                |
| `read-face-font'            | |   | <WIDTH>  - Width in pixels         |
| `read-face-name'            | |   | <HEIGHT> - Height in pixels        |
| `read-face-attribute'       | |   | <DATA>   - Data string of raw bits |
| `read-all-face-attributes'  | |   `----                                |
| `read-face-and-attribute'   | |  nil - no stipple }                    |
|_____________________________| |________________________________________|
                                |                                        |
                                | :inherit - [<STRING>|<LIST>]           |
                                |  { face name, or list of face names }  |
                                |______________________________________73^\n
:SEE-ALSO `mon-help-faces-basic', `mon-help-font-lock', `mon-help-faces-themes',
`mon-help-color-chart', `mon-help-custom-keywords', `mon-help-widgets',
`mon-help-easy-menu', `mon-help-plist-functions', `mon-help-plist-properties'
`mon-help-color-chart', `mon-help-eieio-defclass', `mon-help-eieio-functions',
`mon-help-eieio-methods'.\n►►►"
(interactive "i\nP")
  (if (or insertp intrp)
      (mon-help-function-spit-doc 'mon-help-faces :insertp t)
    (message "Pass non-nil for optional arg INTRP")))
;;
;;; :TEST-ME (mon-help-faces)
;;; :TEST-ME (mon-help-faces t)
;;; :TEST-ME (describe-function 'mon-help-faces)
;;; :TEST-ME (apply 'mon-help-faces '(t))

;;; ==============================
;;; :RENAMED `mon-help-basic-faces' -> `mon-help-faces-basic'
;;; :CREATED <Timestamp: #{2009-09-04T17:34:43-04:00Z}#{09365} - by MON KEY>
(defun mon-help-faces-basic (&optional insertp intrp)
  "The custom-group `basic-faces' is utilized for inheriting faces.\n
These are the standard Emacs faces are defined in :FILE faces.el\n
:NOTE As of 23.1 there is no _formal_ indication that newly defined faces must
inherit from one of the basic-faces this practice is encouraged.\n
:SEE \(URL `http://lists.gnu.org/archive/html/emacs-devel/2009-08/msg00525.html').\n►►►
;; :FACE-BASIC
\(describe-face 'default\)
\(describe-face 'bold\)
\(describe-face 'italic\)
\(describe-face 'underline\)
\(describe-face 'bold-italic\)
\(describe-face 'fixed-pitch\)
\(describe-face 'variable-pitch\)
\(describe-face 'shadow\)
\(describe-face 'link\)
\(describe-face 'link-visited\)
\(describe-face 'highlight\)
\(describe-face 'region\)
\(describe-face 'mode-line\)
\(describe-face 'header-line\)
\(describe-face 'secondary-selection\)
\(describe-face 'trailing-whitespace\)
\(describe-face 'escape-glyph\)
\(describe-face 'nobreak-space\)
\(describe-face 'mode-line-inactive\)
\(describe-face 'mode-line-highlight\)
\(describe-face 'mode-line-emphasis\)
\(describe-face 'mode-line-buffer-id\)
\(describe-face 'vertical-border\)
\(describe-face 'minibuffer-prompt\)
\(describe-face 'minibuffer-noticeable-prompt\)
\(describe-face 'fringe\)
\(describe-face 'scroll-bar\)
\(describe-face 'border\)
\(describe-face 'cursor\)
\(describe-face 'mouse\)
\(describe-face 'tool-bar\)
\(describe-face 'menu\)\n
:SEE-ALSO `mon-help-faces-basic', `mon-help-font-lock', `mon-help-faces-themes', 
`mon-help-font-lock-functions', `mon-help-naf-mode-faces'.\n►►►"
  (interactive "i\np")
  (if (or insertp intrp)
      (mon-help-function-spit-doc 'mon-help-faces-basic :insertp t)
    (message "Pass non-nil for optional arg INTRP")))
;;
;;; :TEST-ME (mon-help-faces-basic t)
;;; :TEST-ME (describe-function 'mon-help-faces-basic)

;;; ==============================
;;; :CREATED <Timestamp: #{2010-03-08T15:36:26-05:00Z}#{10101} - by MON KEY>
(defun mon-help-faces-font-lock (&optional insertp intrp)
  "List of faces defined specifically for Font Lock mode.\n
:SEE info node `(elisp)Faces for Font Lock'.\n
;; :FACE-FONT-LOCK
\(describe-face 'font-lock-comment-face\)
\(describe-face 'font-lock-comment-delimiter-face\)
\(describe-face 'font-lock-doc-face\)
\(describe-face 'font-lock-string-face\)
\(describe-face 'font-lock-keyword-face\)
\(describe-face 'font-lock-builtin-face\)
\(describe-face 'font-lock-function-name-face\)
\(describe-face 'font-lock-variable-name-face\)
\(describe-face 'font-lock-type-face\)
\(describe-face 'font-lock-constant-face\)
\(describe-face 'font-lock-preprocessor-face\)
\(describe-face 'font-lock-negation-char-face\)
\(describe-face 'font-lock-warning-face\)\n
;; :FACE-FONT-LOCK-VARIABLES
`font-lock-builtin-face'
`font-lock-comment-delimiter-face'
`font-lock-constant-face'
`font-lock-doc-face'
`font-lock-function-name-face'
`font-lock-keyword-face'
`font-lock-negation-char-face'
`font-lock-preprocessor-face'
`font-lock-reference-face'
`font-lock-string-face'
`font-lock-type-face'
`font-lock-variable-name-face'
`font-lock-warning-face'\n
:SEE-ALSO `mon-help-font-lock', `mon-help-font-lock-functions',
`mon-help-faces', `mon-help-faces-themes', `mon-help-faces-basic'.\n►►►"
(interactive "i\nP")
  (if (or insertp intrp)
      (mon-help-function-spit-doc 'mon-help-faces-font-lock :insertp t)
    (message "Pass non-nil for optional arg INTRP")))
;;
;;; :TEST-ME (mon-help-faces-font-lock )
;;; :TEST-ME (mon-help-faces-font-lock )
;;; :TEST-ME (mon-help-faces-font-lock )

;;; ==============================
;;; :CREATED <Timestamp: #{2010-02-20T16:01:38-05:00Z}#{10076} - by MON KEY>
(defun mon-help-font-lock-functions (&optional insertp intrp)
  "List of font-lock and jit-lock related functions.\n
:SEE info node `(elisp)Font Lock Basics'.\n
:FONT-LOCK-FUNCTIONS
`font-lock-add-keywords'
`font-lock-after-change-function'
`font-lock-after-fontify-buffer'
`font-lock-after-unfontify-buffer'
`font-lock-append-text-property'
`font-lock-apply-highlight'
`font-lock-apply-syntactic-highlight'
`font-lock-change-mode'
`font-lock-choose-keywords'
`font-lock-compile-keywords'
`font-lock-default-fontify-buffer'
`font-lock-default-fontify-region'
`font-lock-default-function'
`font-lock-default-unfontify-buffer'
`font-lock-default-unfontify-region'
`font-lock-defontify'
`font-lock-eval-keywords'
`font-lock-extend-jit-lock-region-after-change'
`font-lock-extend-region-multiline'
`font-lock-extend-region-wholelines'
`font-lock-fillin-text-property'
`font-lock-fontify-anchored-keywords'
`font-lock-fontify-block'
`font-lock-fontify-buffer'
`font-lock-fontify-keywords-region'
`font-lock-fontify-region'
`font-lock-fontify-syntactic-anchored-keywords'
`font-lock-fontify-syntactic-keywords-region'
`font-lock-fontify-syntactically-region'
`font-lock-match-c-style-declaration-item-and-skip-to-next'
`font-lock-mode'
`font-lock-mode-internal'
`font-lock-prepend-text-property'
`font-lock-remove-keywords'
`font-lock-set-defaults'
`font-lock-turn-off-thing-lock'
`font-lock-turn-on-thing-lock'
`font-lock-unfontify-buffer'
`font-lock-unfontify-region'
`font-lock-update-removed-keyword-alist'
`font-lock-value-in-major-mode'\n
;; :FONT-LOCK-JIT-LOCK-FUNCTIONS
`jit-lock-after-change'
`jit-lock-context-fontify'
`jit-lock-deferred-fontify'
`jit-lock-fontify-now'
`jit-lock-force-redisplay'
`jit-lock-function'
`jit-lock-mode'
`jit-lock-refontify'
`jit-lock-register'
`jit-lock-stealth-chunk-start'
`jit-lock-stealth-fontify'
`jit-lock-unregister'\n
;; :FONT-LOCK-VARIABLES
`font-lock-keywords'
`font-lock-keywords-alist'
`font-lock-keywords-case-fold-search'
`font-lock-keywords-only'
`font-lock-mark-block-function'
`font-lock-maximum-decoration'
`font-lock-maximum-size'
`font-lock-mode'
`font-lock-mode-major-mode'
`font-lock-multiline'
`font-lock-removed-keywords-alist'
`font-lock-set-defaults'
`font-lock-support-mode'
`font-lock-syntactic-face-function'
`font-lock-syntactic-keywords'
`font-lock-syntactically-fontified'
`font-lock-syntax-table'
`font-lock-unfontify-buffer-function'
`font-lock-unfontify-region-function'
`font-lock-verbose'\n
;; :FONT-LOCK-JIT-LOCK-VARIABLES
`jit-lock-after-change-extend-region-functions'
`jit-lock-chunk-size'
`jit-lock-context-time'
`jit-lock-context-timer'
`jit-lock-context-unfontify-pos'
`jit-lock-contextually'
`jit-lock-defer-buffers'
`jit-lock-defer-contextually'
`jit-lock-defer-time'
`jit-lock-defer-timer'
`jit-lock-functions'
`jit-lock-mode'
`jit-lock-stealth-buffers'
`jit-lock-stealth-load'
`jit-lock-stealth-nice'
`jit-lock-stealth-repeat-timer'
`jit-lock-stealth-time'
`jit-lock-stealth-timer'
`jit-lock-stealth-verbose'\n
;; :FONT-LOCK-VARIABLES-NAMING-FACES
`font-lock-negation-char-face'
`font-lock-variable-name-face'
`font-lock-preprocessor-face'
`font-lock-reference-face'
`font-lock-string-face'
`font-lock-type-face'
`font-lock-warning-face'\n
:SEE :FILE font-lock.el :FILE jit-lock.el
:SEE-ALSO `mon-help-font-lock', `mon-help-faces-font-lock', `mon-help-faces',
`mon-help-faces-basic', `mon-help-faces-themes', `mon-help-custom-keywords',
`mon-help-widgets', `mon-help-easy-menu', `mon-help-plist-functions',
`mon-help-color-chart', `mon-help-eieio-defclass', `mon-help-eieio-functions',
`mon-help-eieio-methods'.\n►►►"
(interactive "i\nP")
  (if (or insertp intrp)
      (mon-help-function-spit-doc 'mon-help-font-lock-functions :insertp t)
    (message "Pass non-nil for optional arg INTRP")))
;;
;;; :TEST-ME (mon-help-font-lock-functions)
;;; :TEST-ME (mon-help-font-lock-functions t)
;;; :TEST-ME (describe-function 'mon-help-font-lock-functions)
;;; :TEST-ME (apply 'mon-help-font-lock-functions nil '(t))

;;; ==============================
;;; :CREATED <Timestamp: Wednesday June 17, 2009 @ 05:37.52 PM - by MON KEY>
(defun mon-help-font-lock (&optional insertp intrp)
  "Display `font-lock-keywords' usgage.\n
:SEE info node `(elsip)Search-based Fontification'.\n
Each element of `font-lock-keywords' specifies how to find certain
cases of text, and how to highlight those cases:\n
 ___________________________________________________________________________79.
|                                                                             |
| REGEXP                                                                      |
|_____________________________________________________________________________|
|                                                                             |
| FUNCTION                                                                    |
|_____________________________________________________________________________|
|                                                                             |
|[MATCHER . SUBEXP]                                                           |
|         |->{REGEXP|FUNCTION}                                                |
|_____________________________________________________________________________|
|                                        +specify a proplist here**           |
|                                        |                                    |
|[MATCHER . FACESPEC]                    v                                    |
|                |-> (FACESPEC (face FACE PROP1 VAL1 PROP2 VAL2...))          |
|                |                                                            |
|                |-> (font-lock-extra-managed-props PROP1 VAL1 PROP2 VAL2)    |
|                         |                           |-> field VAL           |
|                         |                              help-echo VAL        |
| **and/or specify it here^                              category VAL         |
|_____________________________________________________________________________|
|                                                                             |
| [MATCHER] . [SUBEXP-HIGHLIGHTER]                                            |
|                    |-> [SUBEXP] . [FACESPEC]                                |
|                                    |-> [OVERRIDE                            |
|                                                {t|keep|prepend|append}      |
|                                         [LAXMATCH]]                         |
|                                                  {t|nil}                    |
|                                                   t-> NO ERROR if no find   |
|                                                   nil-> subexp missing ERROR|
|_____________________________________________________________________________|
|                                                                             |
| [MATCHER . ANCHORED-HIGHLIGHTER]                                            |
|          |-> [ANCHORED-MATCHER PRE-FORM POST-FORM                           |
|                                 SUBEXP-HIGHLIGHTERS...]                     |
|_____________________________________________________________________________|
|                                                                             |
| [MATCHER . HIGHLIGHTERS...]                                                 |
|          |-> [SUBEXP-HIGHLIGHTER[ANCHORED-HIGHLIGHTER]]                     |
|_____________________________________________________________________________|
|                                                                             |
| [eval . FORM]                                                               |
|___________________________________________________________________________79.\n
:SEE-ALSO `mon-help-font-lock-functions', `mon-help-faces-font-lock',
`mon-help-faces-basic', `mon-help-font-lock', `mon-help-faces-themes',
`mon-help-naf-mode-faces', `mon-help-overlay-functions'.\n►►►"
  (interactive "i\nP")
  (if (or insertp intrp)
      (mon-help-function-spit-doc 'mon-help-font-lock :insertp t)
      (message "Pass non-nil for optional arg INTRP")))
;;
;;; :TEST-ME (mon-help-font-lock)
;;; :TEST-ME (mon-help-font-lock t)
;;; :TEST-ME (describe-function 'mon-help-font-lock)
;;; :TEST-ME (apply 'mon-help-font-lock '(t))

;;; ==============================
;;; :CREATED <Timestamp: #{2010-02-01T19:07:24-05:00Z}#{10052} - by MON KEY>
(defun mon-help-overlay-functions (&optional insrtp intrp)
  "Functions related to overlays.\n
:SEE info node `(elisp) Overlays'.\n
;; :OVERLAY-FUNCTIONS
`cl-map-overlays' 
`get-char-property-and-overlay'  :SEE `get-char-property'
`delete-overlay'
`make-overlay'
`move-overlay'
`next-overlay-change'
`overlay-buffer'
`overlay-end'
`overlay-get'
`overlay-properties'
`overlay-put'
`overlay-recenter'
`overlay-start'
`overlayp'
`overlays-at'
`overlays-in'
`overwrite-mode'
`previous-overlay-change'
`remove-overlays'\n
;; :OVERLAY-VARIABLES
`overlay-arrow-position'
`overlay-arrow-string'
`overlay-arrow-variab'\n
;; :OVERLAY-PROPERTIES            :NOTE these are in addition to the 'special' text props:
`after-string'                    :SEE info node `(elisp)Special Properties'
`before-string'                   :SEE info node `(elisp)Overlay Properties'
`evaporate'
`isearch-open-invisible'
`isearch-open-invisible-temporary'
`priority'
`window'\n
;; :OVERLAY-FUNCTIONS-MON-LOCAL
`mon-help-find-result-for-overlay'
`mon-help-overlay-for-example'
`mon-help-overlay-on-region'
`mon-help-overlay-result'
`mon-nuke-overlay-buffer'\n
:SEE :FILE buffer.c :FILE textprop.c
:SEE-ALSO `mon-help-faces', `mon-help-font-lock',
`mon-help-font-lock-functions', `mon-help-text-property-functions',
`mon-help-text-property-properties', `mon-help-text-property-functions-ext',
`mon-help-text-property-stickyness', `mon-help-plist-functions'.\n►►►"
(interactive "i\nP")
  (if (or insrtp intrp)
      (mon-help-function-spit-doc 'mon-help-overlay-functions :insertp t)
    (message "Pass non-nil for optional arg INTRP")))
;;
;;; :TEST-ME (mon-help-overlay-functions )
;;; :TEST-ME (mon-help-overlay-functions t)
;;; :TEST-ME (apply 'mon-help-overlay-functions '(t))

;;; ==============================
;;; :CREATED <Timestamp: #{2009-09-20T13:46:12-04:00Z}#{09387} - by MON>
(defun mon-help-text-property-functions (&optional insrtp intrp)
  "List of text-property related functions and variables.\n
   ________________________               _______________________               
  |                        |             |                       |              
  | :TEXT-PROPERTY-GETTERS |             | :TEXT-PROPERTY-SEARCH |              
 _|________________________|_______    __|_______________________|___________79.
|                                  |  |                                        |
| `filter-buffer-substring'        |  | `next-property-change'                 |
| `buffer-substring-no-properties' |  | `next-single-property-change'          |
| `remove-list-of-text-properties' |  | `next-char-property-change'            |
| `remove-text-properties'         |  | `next-single-char-property-change'     |
| `get-text-property'              |  | `previous-property-change'             |
| `get-char-property'              |  | `previous-single-property-change'      |
| `get-char-property-and-overlay'  |  | `previous-char-property-change'        |
|__________________________________|  | `previous-single-char-property-change' |
    ________________________          | `text-properties-at'                   |
   |                        |         | `text-property-any'                    |
   | :TEXT-PROPERTY-SETTERS |         | `text-property-not-all'                |
 __|________________________|_        | `describe-text-properties'             |
|                             |       |________________________________________|
| `propertize'                |              __________________________         
| `add-text-properties'       |             |                          |        
| `put-text-property'         |             | :TEXT-PROPERTY-VARIABLES |        
| `set-text-properties'       |           __|__________________________|_______ 
| `with-silent-modifications' |          |                                     |
|_____________________________|          |  `buffer-access-fontified-property' |
     _______________________             |  `buffer-access-fontify-functions'  |
    |                       |            |  `buffer-substring-filters'         |
    | :TEXT-PROPERTY-FIELDS |            |  `char-property-alias-alist'        |
 ___|_______________________|__          |  `default-text-properties'          |
|                              |         |  `inhibit-read-only'                |
| `constrain-to-field'         |         |  `minibuffer-allow-text-properties' |
| `delete-field'               |         |  `text-property-default-nonsticky'  |
| `field-beginning'            |         |  `show-help-function'               |
| `field-end'                  |         |  `use-hard-newlines'                |
| `field-string'               |         |_____________________________________|
| `field-string-no-properties' |             _________________________________  
| `inhibit-field-text-motion'  |            |                                 | 
|______________________________|            | :TEXT-PROPERTY-STICKY-VARIABLES | 
        __________________________        __|_________________________________| 
       |                          |      |                                     |
       | :TEXT-PROPERTY-FONT-LOCK |      | `text-property-default-nonsticky'   |
 ______|__________________________|_     | `buffer-access-fontified-property'  |
|                                   |    |_____________________________________|
| `font-lock-append-text-property'  |          _______________________          
| `font-lock-extra-managed-props'   |         |                       |         
| `font-lock-fillin-text-property'  |         | :TEXT-PROPERTY-STICKY |         
| `font-lock-prepend-text-property' |     ____|_______________________|________ 
|___________________________________|    |                                     |
                                         | `insert-and-inherit'                |
                                         | `insert-before-markers-and-inherit' |
:SEE info node `(elisp)Text Properties'  |___________________________________79^\n
:SEE :FILE buffer.c :FILE textprop.c\n
:SEE-ALSO `mon-help-text-property-properties',
`mon-help-text-property-stickyness', `mon-help-text-property-functions-ext',
`mon-help-overlay-functions', `mon-help-plist-functions',
`mon-help-plist-properties', `mon-help-widgets'.\n►►►"
  (interactive "i\nP")
  (if (or insrtp intrp)
      (mon-help-function-spit-doc 'mon-help-text-property-functions :insertp t)
    (message "Pass non-nil for optional arg INTRP")))
;;
;;; :TEST-ME (mon-help-text-property-functions)
;;; :TEST-ME (mon-help-text-property-functions t)
;;; :TEST-ME (describe-function 'mon-help-text-property-functions)
;;; :TEST-ME (apply 'mon-help-text-property-functions '(t))


;;; ==============================
;;; :CREATED <Timestamp: #{2010-03-10T13:45:45-05:00Z}#{10103} - by MON KEY>
(defun mon-help-text-property-properties (&optional insertp intrp)
  "List of text-property properties.\n
     __________________________       
    |                          |      
    | :TEXT-PROPERTIES-SPECIAL |  :SEE info node `(elisp)Special Properties'     
 ___|__________________________|______________________________________________80. 
|                                                                               |
| `keymap' `local-map'                                                          |
| `syntax-table' `category' `field'                                             |
| `face' `font-lock-face' `fontified'                                           |
| `pointer' `mouse-face'                                                        |
| `insert-in-front-hooks' `insert-behind-hooks' `modification-hooks'            |
| `isearch-open-invisible' `isearch-open-invisible-temporary'                   |
| `line-height' `line-spacing'                                                  |
| `line-prefix' `wrap-prefix'                                                   |
| `point-entered' `point-left'                                                  |
| `before-string' `after-string'                                                |
| `read-only'                            :NOTE On error sigals `text-read-only' |
| `composition' `intangible' `invisible' :NOTE These and `display' move point.  |
|            ____________________________________                               |
|           |                                    |                              |
|           | :TEXT-PROPERTIES-SPECIAL-HELP-ECHO |                              |
|  _________|____________________________________|____________________________  |
| |                                                                           | |
| | `help-echo'  [<STRING>|<FUNCTION>|<FORM>]                                 | |
| |             ¦ <FUNCTION> with args <WINDOW>, <OJBECT>, <POSITION>         | |
| |             ¦ <WINDOW>   <- <WINDOW-NAME>  ;e.g. (selected-window)        | |
| |             ¦ <OBJECT>   <- [<BUFFER-NAME>|<OVERLAY-SYMBOL>|<STRING>]     | |
| |             ¦ <POSITION> <- [<BUFFER-POSN>|<OVERLAY-POSN>|<STRING-POSN>]  | |
| |___________________________________________________________________________| |
|             :SEE info node `(emacs)Tooltips'                                  |       
|            __________________________________                                 |
|           |                                  |                                |
|           | :TEXT-PROPERTIES-SPECIAL-DISPLAY |                                |
|  _________|__________________________________|_____                           |
| |                                                  |                          |
| | `display'  <STRING>                              |                          |
| |           ¦ (image . <IMAGE-PROPS>)              |                          |
| |           ¦ (slice X Y <WIDTH> <HEIGHT>)         |                          |
| |           ¦ ((margin nil) <STRING>)              |                          |
| |           ¦ (space-width <FACTOR>)               |                          |
| |           ¦ (height [(+ N)|(- N)|                |                          |
| |           ¦           <NUMBER>|<SYMBOL>|<FORM>]) |                          |
| |           ¦ (raise <FACTOR>                      |                          |
| |__________________________________________________|                          |
|      :SEE info node `(elisp)Display Property'                                 |
|_______________________________________________________________________________|
   __________________________          __________________________                
  |                          |        |                          |               
  | :PLIST-PROPERTIES-FORMAT |        | :PLIST-PROPERTIES-STICKY |               
 _|__________________________|_      _|__________________________|_              
|                              |    |                              |             
|           `hard'             |    |       `front-sticky'         |             
|      `right-margin'          |    |      `rear-nonsticky'        |             
|       `left-margin'          |    |______________________________|             
|      `justification'         |                                                
|______________________________|                                                
                                                                             80^
:SEE-ALSO `mon-help-text-property-functions', `mon-help-text-property-functions-ext',
`mon-help-overlay-functions', `mon-help-plist-functions',
`mon-help-text-property-properties'.\n►►►"
(interactive "i\nP")
  (if (or insertp intrp)
      (mon-help-function-spit-doc 'mon-help-text-property-properties :insertp t)
    (message "Pass non-nil for optional arg INTRP")))
;;
;;; :TEST-ME (mon-help-text-property-properties )
;;; :TEST-ME (mon-help-text-property-properties )
;;; :TEST-ME (mon-help-text-property-properties )

;;; ==============================
;;; :COURTESY :FILE /emacs/*/src/intervals.c
;;; :CREATED <Timestamp: #{2009-08-25T18:33:48-04:00Z}#{09352} - by MON KEY>
(defun mon-help-text-property-stickyness (&optional insertp intrp)
  "List of text property stickyness functions, variables, and their usage.\n
;; :TEXT-PROPERTY-STICKYNESS-USAGE\n
Any property might be front-sticky on the left, rear-sticky on the left,
front-sticky on the right, or rear-sticky on the right; the 16 combinations
can be arranged in a matrix with rows denoting the left conditions and
columns denoting the right conditions:
      _  __  _
_     FR FR FR FR
FR__   0  1  2  3
 _FR   4  5  6  7
FR     8  9  A  B
  FR   C  D  E  F\n
:LEFT-PROPS  = '\(front-sticky \(p8 p9 pa pb pc pd pe pf\)
                rear-nonsticky \(p4 p5 p6 p7 p8 p9 pa pb\)
                p0 L p1 L p2 L p3 L p4 L p5 L p6 L p7 L
                p8 L p9 L pa L pb L pc L pd L pe L pf L\)\n
:RIGHT-PROPS = '\(front-sticky \(p2 p3 p6 p7 pa pb pe pf\)
                rear-nonsticky \(p1 p2 p5 p6 p9 pa pd pe\)
                p0 R p1 R p2 R p3 R p4 R p5 R p6 R p7 R
                p8 R p9 R pa R pb R pc R pd R pe R pf R\)\n
We inherit from whoever has a sticky side facing us.  If both sides
do \(cases 2, 3, E, and F\), then we inherit from whichever side has a
non-nil value for the current property.  If both sides do, then we take
from the left.\n
When we inherit a property, we get its stickiness as well as its value.
So, when we merge the above two lists, we expect to get this:\n
:RESULT      = '\(front-sticky \(p6 p7 pa pb pc pd pe pf\)
     	        rear-nonsticky \(p6 pa\)
                p0 L p1 L p2 L p3 L p6 R p7 R
                pa R pb R pc L pd L pe L pf L\)\n
The optimizable special cases are:
    left rear-nonsticky = nil, right front-sticky = nil \(inherit left\)
    left rear-nonsticky = t,   right front-sticky = t   \(inherit right\)
    left rear-nonsticky = t,   right front-sticky = nil \(inherit none\)\n
:NOTE `insert-char's optional arg INHERIT which allows inheriting
text-properties of adjoining text with sticky properties.\n
:SEE :FILE buffer.c textprop.c\n
:SEE-ALSO `mon-help-text-property-functions', `mon-help-text-property-functions-ext',
`mon-help-overlay-functions', `mon-help-plist-functions'.\n►►►"
  (interactive "i\nP")
  (if (or insertp intrp)
      (save-excursion
        (mon-help-function-spit-doc 'mon-help-text-property-stickyness :insertp t))
    (message "Pass non-nil for optional arg INTRP")))
;;
;;; :TEST-ME (mon-help-text-property-stickyness)
;;; :TEST-ME (mon-help-text-property-stickyness t)
;;; :TEST-ME (describe-function 'mon-help-text-property-stickyness)
;;; :TEST-ME (apply 'mon-help-text-property-stickyness '(t))

;;; ==============================
;;; :NOTE Emacs lisp and Scheme suffer a similiar affliction which requires
;;; constant reinvention/reimplementation of common idioms. While the reasons
;;; for this are slightly different the outcome is the same.
;;; Emacs' lacks _primitive_ lexical scoping and has no _formal_ spec. 
;;; Scheme has both of the abobe, but being a lisp 1 can't get em right...
;;; For example of the later, consider Scheme's treatment of `call/cc' with
;;; `dynamic-wind' e.g. the `unwind-protect' problem.
;;; :SEE (URL `http://www.nhplace.com/kent/PFAQ/unwind-protect-vs-continuations-original.html')
;;; :SEE (URL `http://list.cs.brown.edu/pipermail/plt-scheme/2009-July/034408.html')
;;; :SEE (URL `http://mumble.net/~campbell/blag.txt')
;;; For example of the former :SEE `mon-help-text-property-functions-ext'

;;; ==============================
;;; :TODO Add the third party package functions that also manipulate tp.
;;; e.g. slime  erc, gnus, w3m, etc. 
;;; Also, what about provided functions e.g. from :FILE font-lock.el
;;; :CREATED <Timestamp: #{2010-02-04T13:03:36-05:00Z}#{10054} - by MON KEY>
(defun mon-help-text-property-functions-ext (&optional insertp intrp)
"Text property related functions that are either not C level builtins or
provided in third party packages.\n
;; :TEXT-PROPERTY-FUNCTIONS-FILE.lisp.font-lock
`font-lock-prepend-text-property'
`font-lock-append-text-property'
`font-lock-fillin-text-property'\n
;; :TEXT-PROPERTY-FUNCTIONS-FILE.lisp.gnus
`gnus-put-text-property'
`gnus-put-text-property-excluding-characters-with-faces'
`gnus-put-text-property-excluding-newlines'
`gnus-remove-text-with-property'
`gnus-add-text-properties-when'
`gnus-remove-text-properties-when'
`gnus-string-remove-all-properties'\n
;; :TEXT-PROPERTY-FUNCTIONS-FILE.*.slime
`slime-property-bounds'
`slime-propertize-region'\n
;; :TEXT-PROPERTY-FUNCTIONS-FILE.lisp.erc\n
;; :TEXT-PROPERTY-FUNCTIONS-FILE.*.w3m\n
;; :TEXT-PROPERTY-FUNCTIONS-MON-LOCAL
`mon-get-all-face-property-change'
`mon-get-next-face-property-change'
`mon-get-next-face-property-change-if'
`mon-get-text-properties-region-to-kill-ring'
`mon-line-test-content'
`mon-list-all-properties-in-buffer'
`mon-nuke-text-properties-buffer'
`mon-nuke-text-properties-region'
`mon-remove-single-text-property'
`mon-remove-text-property'
`mon-test-props'\n
:SEE-ALSO `mon-help-text-property-functions',
`mon-help-text-property-stickyness', `mon-help-overlay-functions',
`mon-help-plist-functions'.\n►►►"
(interactive "i\nP")
  (if (or insertp intrp)
      (mon-help-function-spit-doc 'mon-help-text-property-functions-ext :insertp t)
    (message "Pass non-nil for optional arg INTRP")))
;;
;;; :TEST-ME (mon-help-text-property-functions-ext )
;;; :TEST-ME (mon-help-text-property-functions-ext t)
;;; :TEST-ME (describe-function 'mon-help-text-property-functions-ext)
;;; :TEST-ME (apply 'mon-help-text-property-functions-ext nil '(t))

;;; ==============================
;;; :CREATED <Timestamp: #{2009-09-04T17:54:39-04:00Z}#{09365} - by MON KEY>
(defun mon-help-color-functions (&optional insertp intrp)
  "Color related functions.\n
;; :COLOR-FUNCTIONS
`color-distance'
`color-values'
`xw-color-values'
`tty-color-values'
`ansi-color-apply'
`ansi-color-make-color-map'\n
;; :COLOR-READERS
`read-color'
`facemenu-read-color'
`background-color-at-point'
`foreground-color-at-point'\n
;; :COLOR-SETTERS
`set-cursor-color'
`set-border-color'
`set-background-color'
`set-foreground-color'
`set-mouse-color'\n
;; :COLOR-LIST
`defined-colors'
`xw-defined-colors'
`list-colors-display'
`list-colors-duplicates'
`list-colors-print'
`x-colors'                ;<VARIABLE>
`color-name-rgb-alist'    ;<CONSTANT>
`ansi-color-map'          ;<VARIABLE>\n
;; :COLOR-ON-DISPLAY
`display-backing-store'
`display-color-cells'
`display-planes'
`display-visual-class'
`x-display-planes'
`x-display-visual-class'
`x-display-backing-store'\n
;; :COLOR-PREDICATES
`color-defined-p'
`xw-color-defined-p'
`xw-display-color-p'
`tty-display-color-p'
`display-color-p'
`display-graphic-p'
`display-grayscale-p'
`x-display-grayscale-p'\n
;; :COLOR-FILE.lisp.term.tty-colors
`tty-color-off-gray-diag'
`tty-color-approximate'
`tty-color-standard-values' 
`tty-color-values'
`tty-defined-color-alist' ;<VARIABLE>
;; :COLOR-W32
`w32-color-map'
;; :COLOR-MON-LOCAL
`mon-color-mix'
`mon-defined-colors-without-duplicates'
`mon-rgb-to-hsv'
`mon-list-colors-key'
`mon-get-ebay-css-pp'
`mon-get-ebay-css-pp-region-to-file'
`mon-get-ebay-img-css'
`mon-insert-css-colors'
`mon-cln-img-magic-hex'
\n
:NOTE Following from commented code for `color-distance' in: :FILE xfaces.c\n
 This formula is from a paper title `Colour metric' by Thiadmer Riemersma.
 Quoting from that paper:\n
   This formula has results that are very close to L*u*v* (with the
   modified lightness curve) and, more importantly, it is a more
   even algorithm: it does not have a range of colours where it
   suddenly gives far from optimal results.
:SEE (URL `http://www.compuphase.com/cmetric.htm')\n
:SEE :FILE xfaces.c xfns.c etc/rgb.txt lisp/term/common-win.el
:SEE :FILE w23fns.c struct colormap_t w32_color_map.\n
:SEE-ALSO `mon-help-color-chart'.\n►►►"
  (interactive "i\np")
  (if (or insertp intrp)
      (mon-help-function-spit-doc 'mon-help-color-functions :insertp t)
      (message "Pass non-nil for optional arg INTRP")))
;;
;;; :TEST-ME (mon-help-color-functions t)
;;;: TEST-ME (describe-function 'mon-help-color-functions)

;;; ==============================
;;; :CREATED <Timestamp: Tuesday June 02, 2009 @ 12:09.40 PM - by MON KEY>
(defun mon-help-color-chart (&optional insertp intrp)
  "Chart of Netscape Color Names with their Color Values.\n
       ______________
      |              |                                                          
      | :COLOR-CHART |                                                          
 _____|______________|_______________________________________________________80.
|                                                                              |
| ,-+ :NETSCAPE-NAME                                                           |
| |                   ,-+ :HEX-TRIPLET                                         |
| |                   |       ,-+ :RGB-VALUE                                   |
| |                   |       |            ,-+ :DIRECTOR-MAC-SYS-APPROX        |
| |                   |       |            |    ,-+ :DIRECTOR-WIN-SYS-APPROX   |
| |                   |       |            |    |    ,-+ :SUPERCARD-APPROX     |
| |                   |       |            |    |    |    ,-+ :HEX-APPROX      |
| |                   |       |            |    |    |    |        :RGB-APPROX |
| |                   |       |            |    |    |    |       |            |
| aliceblue           F0F8FF  240,248,255  000  000  001  FFFFFF  255,255,255  |
| antiquewhite        FAEBD7  250,235,215  001  -    002  FFFFCC  255,255,204  |
| aquamarine          7FFFD4  127,255,212  009  016  110  66FFCC  102,255,204  |
| azure               F0FFFF  240,255,255  000  000  001  FFFFFF  255,255,255  |
| beige               F5F5DC  245,245,220  001  -    002  FFFFCC  255,255,204  |
| bisque              FFE4C4  255,228,196  001  -    002  FFFFCC  255,255,204  |
| black               000000  0,0,0        255  255  256  000000  0,0,0        |
| blanchedalmond      FFEBCD  255,235,205  001  -    002  FFFFCC  255,255,204  |
| blue                0000FF  0,0,255      210  003  211  0000FF  0,0,255      |
| blueviolet          8A2BE2  138,43,226   097  097  098  9933CC  153,51,204   |
| brown               A52A2A  165,42,42    100  100  101  993333  153,51,51    |
| burlywood           DEB887  222,184,135  44   44   045  CCCC99  204,204,153  |
| cadetblue           5F9EA0  95,158,160   122  122  123  669999  102,153,153  |
| chartreuse          7FFF00  127,255,0    113  113  114  66FF00  102,255,0    |
| chocolate           D2691E  210,105,30   058  058  059  CC6633  204,102,51   |
| coral               FF7F50  255,127,80   021  023  022  FF6666  255,102,102  |
| cornflowerblue      6495ED  100,149,237  120  120  121  6699FF  102,153,255  |
| cornsilk            FFF8DC  255,248,220  001  -    002  FFFFCC  255,255,204  |
| cyan                00FFFF  0,255,255    180  001  181  00FFFF  0,255,255    |
| darkgoldenrod       B8860B  184,134,11   053  053  054  CC9900  204,153,0    |
| darkgreen           006400  0,100,0      203  201  204  006600  0,102,0      |
| darkkhaki           BDB76B  189,183,107  045  045  046  CCCC66  204,204,102  |
| darkolivegreen      556B2F  85,107,47    130  130  131  666633  102,102,51   |
| darkorange          FF8C00  255,140,0    017  019  018  FF9900  255,153,0    |
| darkorchid          9932CC  153,50,204   097  097  098  9933CC  153,51,204   |
| darksalmon          E9967A  233,150,122  015  -    016  FF9966  255,153,102  |
| darkseagreen        8FBC8F  143,188,143  080  080  081  99CC99  153,204,153  |
| darkslateblue       483D8B  72,61,139    170  170  171  333399  51,51,153    |
| darkslategray       2F4F4F  47,79,79     165  165  166  336666  51,102,102   |
| darkturquoise       00CED1  0,206,209    187  185  188  00CCCC  0,204,204    |
| darkviolet          9400D3  148,0,211    103  103  104  9900CC  153,0,204    |
| deeppink            FF1493  255,20,147   032  033  033  FF0099  255,0,153    |
| deepskyblue         00BFFF  0,191,255    186  184  187  00CCFF  0,204,255    |
| dimgray             696969  105,105,105  129  129  130  666666  102,102,102  |
| dodgerblue          1E90FF  30,144,255   156  156  157  3399FF  51,153,255   |
| firebrick           B22222  178,34,34    100  100  101  993333  153,51,51    |
| floralwhite         FFFAF0  255,250,240  000  000  001  FFFFFF  255,255,255  |
| forestgreen         228B22  34,139,34    160  160  161  339933  51,153,51    |
| gainsboro           DCDCDC  220,220,220  043  043  044  CCCCCC  204,204,204  |
| ghostwhite          F8F8FF  248,248,255  000  000  001  FFFFFF  255,255,255  |
| gold                FFD700  255,215,0    011  -    012  FFCC00  255,204,0    |
| goldenrod           DAA520  218,165,32   052  052  053  CC9933  204,153,51   |
| gray                808080  128,128,128  086  086  087  999999  153,153,153  |
| green               008000  0,128,0      197  195  198  009900  0,153,0      |
| greenyellow         ADFF2F  173,255,47   076  076  077  99FF33  153,255,51   |
| honeydew            F0FFF0  240,255,240  000  000  001  FFFFFF  255,255,255  |
| hotpink             FF69B4  255,105,180  019  021  020  FF66CC  255,102,204  |
| indianred           CD5C5C  205,92,92    057  057  058  CC6666  204,102,102  |
| ivory               FFFFF0  255,255,240  000  000  001  FFFFFF  255,255,255  |
| khaki               F0E68C  240,230,140  002  244  003  FFFF99  255,255,153  |
| lavender            E6E6FA  230,230,250  000  000  001  FFFFFF  255,255,255  |
| lavenderblush       FFF0F5  255,240,245  000  000  001  FFFFFF  255,255,255  |
| lawngreen           7CFC00  124,252,0    113  113  114  66FF00  102,255,0    |
| lemonchiffon        FFFACD  255,250,205  001  -    002  FFFFCC  255,255,204  |
| lightblue           ADD8E6  173,216,230  078  078  079  99CCFF  153,204,255  |
| lightcoral          F08080  240,128,128  014  240  015  FF9999  255,153,153  |
| lightcyan           E0FFFF  224,255,255  036  036  037  CCFFFF  204,255,255  |
| lightgoldenrod      EEDD82  238,221,130  008  -    009  FFCC99  255,204,153  |
| lightgldnrodyellow  FAFAD2  250,250,210  001  -    002  FFFFCC  255,255,204  |
| lightgray           D3D3D3  211,211,211  043  043  044  CCCCCC  204,204,204  |
| lightpink           FFB6C1  255,182,193  007  -    008  FFCCCC  255,204,204  |
| lightsalmon         FFA07A  255,160,122  015  -    016  FF9966  255,153,102  |
| lightseagreen       20B2AA  32,178,170   160  160  161  339933  51,153,153   |
| lightskyblue        87CEFA  135,206,250  078  078  079  99CCFF  153,204,255  |
| lightslate          8470FF  132,112,255  090  090  091  9966FF  153,102,255  |
| lightslategray      778899  119,136,153  122  122  123  669999  102,153,153  |
| lightsteelblue      B0C4DE  176,196,222  078  078  079  99CCFF  153,204,255  |
| lightyellow         FFFFE0  255,255,224  000  000  001  FFFFFF  255,255,255  |
| limegreen           32CD32  50,205,50    154  154  155  33CC33  51,204,51    |
| linen               FAF0E6  250,240,230  000  000  001  FFFFFF  255,255,255  |
| magenta             FF00FF  255,0,255    030  031  031  FF00FF  255,0,255    |
| maroon              B03060  176,48,96    107  107  108  990000  153,0,0      |
| mediumaquamarine    66CDAA  102,205,170  116  116  117  66CC99  102,204,153  |
| mediumblue          0000CD  0,0,205      211  208  212  0000CC  0,0,204      |
| mediumorchid        BA55D3  186,85,211   055  055  056  CC66CC  204,102,204  |
| mediumpurple        9370DB  147,112,219  091  091  092  9966CC  153,102,204  |
| mediumseagreen      3CB371  60,179,113   153  153  154  33CC66  51,204,102   |
| mediumslateblue     7B68EE  123,104,238  11126126  127  6666FF  102,102,255  |
| mediumspringgreen   00FA9A  0,250,154    182  181  183  00FF99  0,255,153    |
| mediumturquoise     48D1CC  72,209,204   15   151  152  33CCCC  51,204,204   |
| mediumviolet        C71585  199,21,133   068  068  069  CC0099  204,0,153    |
| midnightblue        191970  25,25,112    213  210  214  000066  0,0,102      |
| mintcream           F5FFFA  245,255,250  000  000  001  FFFFFF  255,255,255  |
| mistyrose           FFE4E1  255,228,225  000  000  001  FFFFFF  255,255,255  |
| moccasin            FFE4B5  255,228,181  007  -    008  FFCCCC  255,204,204  |
| navajowhite         FFDEAD  255,222,173  009  -    009  FFCC99  255,204,153  |
| navy                000080  0,0,128      212  209  213  000099  0,0,153      |
| oldlace             FDF5E6  253,245,230  000  000  001  FFFFFF  255,255,255  |
| olivedrab           6B8E23  107,142,35   124  124  125  669933  102,153,51   |
| orange              FFA500  255,165,0    017  019  018  FF9900  255,153,0    |
| orangered           FF4500  255,69,0     029  002  030  FF3300  255,51,0     |
| orchid              DA70D6  218,112,214  055  055  056  CC66CC  204,102,204  |
| palegoldenrod       EEE8AA  238,232,170  002  244  003  FFFF99  255,255,153  |
| palegreen           98FB98  152,251,152  074  074  075  99FF99  153,255,153  |
| paleturquoise       AFEEEE  175,238,238  072  072  073  99FFFF  153,255,255  |
| palevioletred       DB7093  219,112,147  056  056  057  CC6699  204,102,153  |
| papayawhip          FFEFD5  255,239,213  001  -    002  FFFFCC  255,255,204  |
| peachpuff           FFDAB9  255,218,185  007  -    008  FFCCCC  255,204,204  |
| peru                CD853F  205,133,63   052  052  053  CC9933  204,153,51   |
| pink                FFC0CB  255,192,203  007  -    008  FFCCCC  255,204,204  |
| plum                DDA0DD  221,160,221  049  049  050  CC99CC  204,153,204  |
| powderblue          B0E0E6  176,224,230  078  078  079  99CCFF  153,204,255  |
| purple              A020F0  160,32,240   096  096  097  9933FF  153,51,255   |
| red                 FF0000  255,0,0      035  035  036  FF0000  255,0,0      |
| rosybrown           BC8F8F  188,143,143  050  050  051  CC9999  204,153,153  |
| royalblue           4169E1  65,105,225   163  163  164  3366CC  51,102,204   |
| saddlebrown         8B4513  139,69,19    101  101  102  993300  153,51,0     |
| salmon              FA8072  250,128,114  015  -    016  FF9966  255,153,102  |
| sandybrown          F4A460  244,164,96   015  -    016  FF9966  255,153,102  |
| seagreen            2E8B57  46,139,87    159  159  160  339966  51,153,102   |
| seashell            FFF5EE  255,245,238  000  000  001  FFFFFF  255,255,255  |
| sienna              A0522D  160,82,45    094  094  095  996633  153,102,51   |
| skyblue             87CEEB  135,206,235  078  078  079  99CCFF  153,204,255  |
| slateblue           6A5ACD  106,90,205   127  127  128  6666CC  102,102,204  |
| slategray           708090  112,128,144  086  086  087  999999  153,153,153  |
| snow                FFFAFA  255,250,250  000  000  001  FFFFFF  255,255,255  |
| springgreen         00FF7F  0,255,127    183  182  184  00FF66  0,255,102    |
| steelblue           4682B4  70,130,180   157  157  158  3399CC  51,153,204   |
| tan                 D2B48C  210,180,140  044  044  045  CCCC99  204,204,153  |
| thistle             D8BFD8  216,191,216  043  043  044  CCCCCC  204,204,204  |
| tomato              FF6347  255,99,71    022  024  023  FF6633  255,102,51   |
| turquoise           40E0D0  64,224,208   151  151  152  33CCCC  51,204,204   |
| violet              EE82EE  238,130,238  012  -    013  FF99FF  255,153,255  |
| violetred           D02090  208,32,144   062  062  063  CC3399  204,51,153   |
| wheat               F5DEB3  245,222,179  007  -    008  FFCCCC  255,204,204  |
| white               FFFFFF  255,255,255  000  000  001  FFFFFF  255,255,255  |
| whitesmoke          F5F5F5  245,245,245  000  000  001  FFFFFF  255,255,255  |
| yellow              FFFF00  255,255,0    005  004  006  FFFF00  255,255,0    |
| yellowgreen         9ACD32  154,205,50   082  082  083  99CC33  153,204,51   |
|____________________________________________________________________________80^
\n:COURTESY Tay Vaughan, July, 1996. Timestream, Inc.\n
:SEE \(URL `http://www.timestream.com/mmedia/graphics/colors/ns3names.txt'\).
:SEE :FILE w23fns.c struct colormap_t w32_color_map.\n
:SEE-ALSO `mon-help-color-functions'.\n►►►"
  (interactive "i\nP")
  (if (or insertp intrp)
      (mon-help-function-spit-doc 'mon-help-color-chart :insertp t)
    (message "Pass non-nil for optional arg INTRP")))
;;
;;; :TEST-ME (mon-help-color-chart)
;;; :TEST-ME (mon-help-color-chart t)
;;; :TEST-ME (describe-function 'mon-help-color-chart)
;;; :TEST-ME (apply 'mon-help-color-chart '(t))

;;; ==============================
;;; :CREATED <Timestamp: Wednesday June 17, 2009 @ 05:36.08 PM - by MON KEY>
(defun mon-help-easy-menu (&optional insertp intrp)
"Following is a mapping for building a menu with easy-menu's `easy-menu-define'.\n
    ____________
   |            |                                                              
   | :EASY-MENU |          :SEE info node `(elisp)Defining Menus'               
 __|____________|____________________________________________________________79.
|                                                                              |
|                      ,-+ :MENU-ROOT                                          |
| [SYMBOL MAPS DOC MENU                                                        |
.                  |                      ,-+ :MENU-CHILD                      |
.                  + (NAME CALLBACK ENABLE                                     |
.                  | ...... NAME ;string                                       |
.                  | ...... CALLBACK ;command|List                             |
.                  | ...... ENABLE ;Expression                                 |
.                  :        | ... :filter . FUNCTION ;Function                 |
.                  :        | ... :visible . INCLUDE ;Expression               |
.                  :        | ... :active . ENABLE ;Expression                 |
.                  |  )                                                        |
.                  :__________.                      ,-+ :MENU-CHILD-ELEMENTS  |
.                             | [NAME CALLBACK ENABLE                          |
.                             |___.                                            |
.                             :   | ... :filter . FUNCTION ;Function           |
.                             :   | ... :visible . INCLUDE ;Expression         |
.                             :   | ... :active . ENABLE ;Expression           |
.                             :   | ... :label . FORM ;Expression              |
.                             :   | ... :keys . KEYS ;String                   |
.                             :   | ... :key-sequence . KEYS ;String|Vector    |
.                             :   | ... :help . HELP ;String                   |
.                             :   | ... :selected . SELECTED ;Expression       |
.                             :   | ... :style . STYLE ;SYMBOL                 |
.                             :   :            |... toggle: radio: button:     |
.                             | ]                                              |
| ]                                                                            |
|____________________________________________________________________________79.\n
:SEE-ALSO `mon-help-custom-keywords', `mon-help-widgets',
`mon-help-plist-functions', `mon-help-color-chart',
`mon-help-faces', `mon-help-faces-basic', `mon-help-faces-themes',
`mon-help-eieio-defclass', `mon-help-eieio-functions',
`mon-help-eieio-methods'.\n►►►"
(interactive "i\nP")
(if (or insertp intrp)
    (mon-help-function-spit-doc 'mon-help-easy-menu :insertp t)
  (message "Pass non-nil for optional arg INTRP")))
;;
;;; :TEST-ME (mon-help-easy-menu)
;;; :TEST-ME (mon-help-easy-menu t)
;;; :TEST-ME (describe-function 'mon-help-easy-menu)
;;; :TEST-ME (apply 'mon-help-easy-menu '(t))

;;; ==============================
;;; :CREATED <Timestamp: Friday June 19, 2009 @ 02:20.35 PM - by MON KEY>
(defun mon-help-widgets (&optional insertp intrp)
"Help table for the widget interface.\n
 __________________________                                                  
|                          | :SEE info node `(widget)Introduction'.
| :WIDGET-TYPE-SYNTAX-OF   |                                                 
|__________________________|______________________________________________77.
|                                                                           |
| NAME ::= (NAME [KEYWORD ARGUMENT] ... ARGS)                               |
|            |       |        |          |                                  |
|      widget-name   |        |          + widget-specific                  |
|                    |        + prop-val                                    |
|                    |                                                      |
|    .---------------+ prop-key                                             |
|    |                                                                      |
|    |--+ format                                                            |
|    |                                                                      |
|    |   `%[  %]' | `%{  %}' |  `%v',   `%d', `%h', `%t', `%%'              |
|    |      ^          ^                  ^     ^     ^                     |
|    |......|..........|..................|.....|.....|                     |
|           |          |                  |     |     |                     |
|           |          |--+ :sample-face  ._____.     |--+ :tag|:tag-glyph  |
|           |                                |                              |
|           |--+ :button-face                |--+ :doc                      |
|                                            |                              |
|                                            |--+ :documentation-property   |
|--+ :value          ;init-arg                                              |
|                                                                           |
|--+ :button-prefix  ;nil|<STRING>|<SYMBOL>                                 |
|                                                                           |
|--+ :button-suffix  ;nil|<STRING>|<SYMBOL>                                 |
|                                                                           |
|--+ :help-echo      ;{widget-forward|widget-backward}                      |
|                    ;String|[Function Arg]|[widget String]                 |
|                                                                           |
|--+ :follow-link    ;<mouse-1>                                             |
|                                                                           |
|--+ :indent         ;<INTEGER>                                             |
|                                                                           |
|--+ :offset         ;<INTEGER>                                             |
|                                                                           |
|--+ :extra-offset   ;<INTEGER>                                             |
|                                                                           |
|--+ :notify         ;[Function arg1 &optional arg2]                        |
|                                                                           |
|--+ :menu-tag       ;:tag                                                  |
|                                                                           |
|--+ :menu-tag-get   ;[Function (:menu-tag|:tag|:value)]                    |
|                                                                           |
|--+ :match          ;[widget value]                                        |
|                                                                           |
|--+ :validate       ;widget_._`widget-children-validate'_.                 |
|                            |                            |                 |
|                            |                            |--+ :children    |
|                            |--+ :error ;<STRING>                          |
|                                                                           |
|--+ :tab-order      ;{widget-forward|widget-backward}                      |
|                                                                           |
|--+ :parent         ;{`menu-choice item' | `editable-list element'}        |
|                                                                           |
|--+ :sibling-args   ;{radio-button-choice' `checklist'}                    |
|___________________________________________________________________________|
|  __________________   ___________________       ____________________      |
| |                  | |                   |     |                    |     |
| | :WIDGET-BUTTONS  | | :WIDGET-FUNCTIONS |     | :WIDGET-NAVIGATION |     |
| |__________________| |___________________|  ___|____________________|___  |
| |                  | |                   | |                            | |
| |  Option|Field    | | `widget-value'    | | <TAB> | M-<TAB> | S-<TAB>  | |
| |                  | | `widget-create'   | |    -------------------     | |
| |   [INS]|[DEL]    | | `widget-delete'   | |     `widget-forward'       | |
| |                  | | `widget-insert'   | |     `widget-backward'      | |
| |     [ ]|[X]      | | `widget-setup'    | |    -------------------     | |
| |                  | | `widget-get'      | |____________________________| |
| |    Embedded      | | `widget-put'      |        ____________________    |
| |                  | |___________________|       |                    |   |
| |     ( )|(*)      |     _______________         | :WIDGET-BUTTON-ACT |   |
| |                  |    |               |      __|____________________|_  |
| |  [Apply Form]    |    | :WIDGET-FACES |     |                         | |
| |                  |   _|_______________|__   |     <RET> | Mouse-2     | |
| |  [Reset Form]    |  |                    |  |  ---------------------  | |
| |__________________|  | widget-mouse-face  |  |  `widget-button-press'  | |
|  ___________________  | widget-field-face  |  |  `widget-button-click'  | |
| |                   | | widget-button-face |  |  ---------------------  | |
| | :WIDGET-VARIABLES | |____________________|  |_________________________| |
| |___________________|______________________                               |
| |                                          |                              |
| |  `widget-keymap'                         |                              |
| |  `widget-global-map'                     |                              |
| |  `widget-glyph-directory'  ;<DIRECTORY>  |                              |
| |  `widget-glyph-enable'     ;nil|t        |                              |
| |  `widget-button-prefix'    ;<STRING>     |                              |
| |  `widget-button-suffix'    ;<STRING>     |                              |
| |__________________________________________|                              |
|_________________________________________________________________________77.\n
:SEE-ALSO `mon-help-easy-menu', `mon-help-key-functions', 
`mon-help-custom-keywords', `mon-help-plist-functions', `mon-help-color-chart',
`mon-help-faces', `mon-help-faces-basic', `mon-help-faces-themes',
`mon-help-eieio-defclass', `mon-help-eieio-functions',
`mon-help-eieio-methods'.\n►►►"
(interactive "i\nP")
(if (or insertp intrp)
    (mon-help-function-spit-doc 'mon-help-widgets :insertp t)
  (message "Pass non-nil for optional arg INTRP")))
;;
;;; :TEST-ME (mon-help-widgets)
;;; :TEST-ME (mon-help-widgets t)
;;; :TEST-ME (describe-function 'mon-help-widgets)
;;; :TEST-ME (apply 'mon-help-widgets '(t))

;;; ==============================
;;; :CREATED <Timestamp: #{2010-02-26T13:00:54-05:00Z}#{10085} - by MON KEY>
(defun mon-help-custom-keywords (&optional insertp intrp)
  "Keywords used with defcustom, degroup, customize facilities.\n
:SEE 
;; :CUSTOM-COMMON-KEYWORDS
:link 
                 ¦ \(custom-manual        \"\(info-node\)Section\"\)
                 ¦ \(info-link            \"\(info-node\)Section\"\)
                 ¦ \(url-link              <STRING>\)
                 ¦ \(emacs-commentary-link <STRING>\)
                 ¦ \(file-link             <STRING>\)
                 ¦ \(function-link         <STRING>\)
                 ¦ \(file-link             <STRING>\)
                 ¦ \(variable-link         <VARIABLE>\)
                 ¦ \(custom-group-link     <SYMBOL>\)\n
:tag             <STRING>
:group           <SYMBOL>
:load            <STRING>
:require         <SYMBOL>
:version         <STRING>
:prefix          <STRING>              ; :NOTE `defgroup' only
:package-version \(<SYMBOL> . <STRING>\)\n
;; :DEFCUSTOM-KEYWORDS
:options         <LIST>
:set             <SYMBOL>
:get             <SYMBOL>
:risky           <PROPERTY-VALUE>
:safe            <PROPERTY-VALUE>
:set-after       <SYMBOL>
:intialize       <SYMBOL>
                 ¦ custom-initialize-set
                 ¦ custom-initialize-default
                 ¦ custom-initialize-reset
                 ¦ custom-initialize-changed
                 ¦ custom-initialize-safe-set
                 ¦ custom-initialize-safe-default\n
;; :CUSTOM-TYPES-SIMPLE
:type            <TYPE>
                 ¦ sexp           <FORM>
                 ¦ integer        <INTEGER>
                 ¦ number         <NUMBER> 
                 ¦ float          <FLOAT>
                 ¦ symbol         <SYMBOL>
                 ¦ string         <STRING>
                 ¦ regexp         <STRING>
                 ¦ character      <CHAR-CODE>
                 ¦ file           <STRING>
                 ¦ directory      <STRING>
                 ¦ hook           <LIST>
                 ¦ alist          <CONSED-LIST>
                 ¦ plist          <KEY-VALUE-PAIR>
                 ¦ function       <SYMBOL>
                 ¦ variable       <SYMBOL>
                 ¦ face           <SYMBOL>
                 ¦ boolean        <T-OR-NIL>
                 ¦ coding-system  <SYMBOL>
                 ¦ color          <STRING>|<RGB-HEX-VALUE>\n
;; :CUSTOM-TYPES-CONSTRUCTORS
list             <ELT-TYPES>
group            <ELT-TYPES>
vector           <ELT-TYPES>
radio            <ELT-TYPES>
choice           <ALT-TYPES>
const            <VAL-TYPEs>
other            <VAL-TYPES>
function-item    <FUNCTION>
cons             \(<CAR-TYPE> <CDR-TYPE>\)\n
:SEE-ALSO `mon-help-widgets', `mon-help-easy-menu',
`mon-help-plist-functions', `mon-help-color-chart',
`mon-help-key-functions', `mon-help-package-keywords',
`mon-help-faces', `mon-help-faces-basic', `mon-help-faces-themes',
`mon-help-eieio-defclass', `mon-help-eieio-functions',
`mon-help-eieio-methods'.\n►►►"
(interactive "i\nP")
  (if (or insertp intrp)
      (mon-help-function-spit-doc 'mon-help-custom-keywords :insertp t)
    (message "Pass non-nil for optional arg INTRP")))
;;
;;; :TEST-ME (mon-help-custom-keywords)
;;; :TEST-ME (mon-help-custom-keywords t)
;;; :TEST-ME (describe-function 'mon-help-custom-keywords)
;;; :TEST-ME (apply mon-help-custom-keywords '(t))

;;; ==============================
;;; Map mon-insert-uniccode to -> (ucs-insert "12C")
(defun mon-help-diacritics (&optional insertp intrp)
  "Insert commonly used diacritics and their keymaps at point.\n►►►\n
;; :CX8-DIACRITIC-SYMBOLS-E\n
à À - C-x 8 ` a
á Á - C-x 8 ' a
ã Ã - C-x 8 ~ a
å Å - C-x 8 / a
â Â - C-x 8 ^ a
ä Ä - C-x 8 \" a
ă Ă - (ucs-insert \"103\") (ucs-insert \"102\")
æ Æ - C-x 8 / e\n
;; :CX8-DIACRITIC-SYMBOLS-E
è È - C-x 8 ` e
é É - C-x 8 ' e
ë Ë - C-x 8 \" e
ê Ê - C-x 8 ^ e
ĕ Ĕ - (ucs-insert \"115\") (ucs-insert \"114\")\n
;; :CX8-DIACRITIC-SYMBOLS-I
í Í - C-x 8 ' i
ì Ì - C-x 8 ` i
ï Ï - C-x 8 \" i
î Î - C-x 8 ^ i
ĭ Ĭ - (ucs-insert \"12D\") (ucs-insert \"12C\")\n
;; :CX8-DIACRITIC-SYMBOLS-O
ó Ó - C-x 8 ' o
ò Ò - C-x 8 ` o
ø Ø - C-x 8 / o
ö Ö - C-x 8 \" o
ô Ô - C-x 8 ^ o
õ Õ - C-x 8 ~ o
ŏ Ŏ - (ucs-insert \"14F\") (ucs-insert \"14E\")
œ Œ - (ucs-insert \"153\") (ucs-insert \"152\")\n
;; :CX8-DIACRITIC-SYMBOLS-U
ú Ú - C-x 8 ' u
ù Ù - C-x 8 ` u
ü Ü - C-x 8 \" u
û Û - C-x 8 ^ u
ů Ů - (ucs-insert \"16F\") (ucs-insert \"16E\")
ŭ Ŭ - (ucs-insert \"16D\") (ucs-insert \"16C\")\n
;; :CX8-DIACRITIC-SYMBOLS-NON-VOWEL
ý Ý - C-x 8 ' y
ÿ   - C-x 8 \" y
ç Ç - C-x 8 , c
č Č - (ucs-insert \"10D\") (ucs-insert \"10C\")
ñ Ñ - C-x 8 ~ n
ň Ň - (ucs-insert \"148\") (ucs-insert \"147\")
ß   - C-x 8 \" s
ř Ř - (ucs-insert \"159\") (ucs-insert \"158\")
š Š - (ucs-insert \"161\") (ucs-insert \"160\")
ź Ź - (ucs-insert \"17A\") (ucs-insert \"179\")
ž Ž - (ucs-insert \"17E\") (ucs-insert \"17D\")
þ Þ - C-x 8 ~ t
ð Ð - C-x 8 ~ d\n
;; :CX8-DIACRITIC-SYMBOLS-CURRENCY
£ - C-x 8 L
¶ - C-x 8 P
§ - C-x 8 S
¥ - C-x 8 Y
¢ - C-x 8 c\n
;; :CX8-DIACRITIC-SYMBOLS-MATH
÷ - C-x 8 / /
¬ - C-x 8 ~ ~
× - C-x 8 x
¤ - C-x 8 $
± - C-x 8 +
\173 - C-x 8    ;SOFT-HYPHEN
· - C-x 8 .
¯ - C-x 8 =
µ - C-x 8 m
° - C-x 8 o     ; DEGREE
º - C-x 8 _ o   ; ORDINAL
µ - C-x 8 u
¾ - C-x 8 3 / 4
½ - C-x 8 1 / 2
¼ - C-x 8 1 / 4
¹ - C-x 8 ^ 1   ; SUPERSCRIPT-1
² - C-x 8 ^ 2   ; SUPERSCRIPT-2
³ - C-x 8 ^ 3   ; SUPERSCRIPT-3\n
;; :CX8-DIACRITIC-SYMBOLS
 « - C-x 8 <
 » - C-x 8 >
© - C-x 8 C
® - C-x 8 R
¡ - C-x 8 !
¿ - C-x 8 ?
¦ - C-x 8 |
ª - C-x 8 _ a
' - C-x 8 ' SPC
´ - C-x 8 ' '
¨ - C-x 8 \" \"
¸ - C-x 8 , ,
\xa0 - C-x 8 * SPC ; NO-BREAK-SPACE
► - (ucs-insert \"25BA\")\n\n;;; ==============================\n
;;; The Unicode latin scripts are found in several Unicode-Blocks, namely:
;;; U+0000 - U+007F -> Controls and Basic Latin;
;;; :SEE \(URL `http://www.decodeunicode.org/en/basic_latin'\)\n
;;; U+0080 - U+009F -> Controls and Latin-1;
;;; :SEE \(URL `http://www.decodeunicode.org/en/latin-1_supplement'\)\n
;;; U+0100 - U+017F -> Latin Extended-A;
;;; :SEE \(URL `http://www.decodeunicode.org/en/latin_extended-a'\)\n
;;; U+0180 - U+024F -> Latin Extended-B;
;;; :SEE \(URL `http://www.decodeunicode.org/en/latin_extended-b'\)\n
;;; Character table for reverting ISO_8859-1 bytes -> UTF-8
;;; :SEE \(URL `http://en.wikipedia.org/wiki/ISO_8859-1'\)\n
;;; :SEE \(URL `http://en.wikipedia.org/wiki/ISO/IEC_8859'\)\n
;;; :SEE (URL `http://unicode.coeurlumiere.com/').\n
:SEE-ALSO `mon-help-key-functions', `mon-help-char-representation',
`mon-help-char-functions', `mon-help-print-functions', `mon-help-read-functions'
`mon-help-char-ascii', `mon-help-char-iso-8859-1', `mon-help-char-ecma-48',
`mon-help-char-ecma-35'.\n►►►"
(interactive "i\nP")
(if (or insertp intrp)
  (save-excursion
    (let* ((test-llm (and (buffer-local-value longlines-mode (current-buffer))))
	   (is-on (and test-llm))
	   (llm-off))
    (progn
      (if (buffer-local-value 'longlines-mode (current-buffer))
	  (prog1
	      (longlines-mode nil)
	    (setq test-llm 'loc-buff-is-ll))
	(setq test-llm 'loc-buff-not-ll))
      (mon-help-function-spit-doc 'mon-help-diacritics :insertp t)
      (cond ((eq test-llm 'loc-buff-not-ll)
	     (setq test-llm nil))
	    ((eq test-llm 'loc-buff-is-ll)
	     (prog1
		 (longlines-mode t)	;
	       (setq test-llm nil)))))))
      (message "Pass non-nil for optional arg INTRP")))
;;
;;; :TEST-ME (mon-help-diacritics)
;;; :TEST-ME (mon-help-diacritics t)
;;; :TEST-ME (describe-function 'mon-help-diacritics)

;;; ==============================
;;; :CREATED <Timestamp: #{2010-02-25T17:33:41-05:00Z}#{10084} - by MON KEY>
(defun mon-help-char-functions (&optional insertp intrp)
"A list of functions and vars related to chars.\n
:SEE info node `(elisp)Basic Char Syntax'\n
;; :CHAR-CONVERSION                      ______________________      
`char-to-string'                        |                      |     
`get-byte'                              | :CHAR-PROPERTIES-OF  |     
`multibyte-char-to-unibyte'           __|______________________|____ 
`unibyte-char-to-multibyte'          |                              |
`string-to-char'                     | `bidi-class'                 |
`string-to-multibyte'                | `canonical-combining-class'  |
                                     | `decimal-digit-value'        |
;; :CHAR-READERS                     | `decomposition'              |
`read-char'                          | `digit'                      |
`read-char-exclusive'                | `general-category'           |
`read-char-by-name'                  | `iso-10646-comment'          |
`read-quoted-char'                   | `lowercase'                  |
`read-quoted-char-radix' ;<VARIABLE> | `mirrored'                   |
`quoted-insert'                      | `name'                       |
`ucs-insert'                         | `numeric-value'              |
                                     | `old-name'                   |
;; :CHAR-DESCRIPTORS                 | `titlecase'                  |
`characterp'                         | `uppercase'                  |
`max-char'                           |____________________________68^
`text-char-description'     
`single-key-description'
`printable-chars'

;; :CHAR-PROPERTIES      :SEE info node `(elisp)Character Properties'
`charset-plist'
`char-code-property-description'
`get-char-code-property'
`put-char-code-property'\n
;; CHAR-ENCODING
`auto-coding-alist'
`find-file-literally'
`recode-file-name'
`insert-file-contents-literally'
`insert-file-literally'
\n
:SEE-ALSO `mon-help-read-functions', `mon-help-print-functions', 
`mon-help-key-functions', `mon-help-char-representation',
`mon-help-binary-representation', `mon-help-char-raw-bytes',
`mon-help-char-functions', `mon-help-char-representation',
`mon-help-diacritics', `mon-help-char-ascii', `mon-help-char-iso-8859-1',
`mon-help-char-ecma-35', `mon-help-char-ecma-48'.\n►►►"
(interactive "i\nP")
  (if (or insertp intrp)
      (mon-help-function-spit-doc 'mon-help-char-functions :insertp t)
    (message "Pass non-nil for optional arg INTRP")))
;;
;;; :TEST-ME (mon-help-char-functions)
;;; :TEST-ME (mon-help-char-functions t)
;;; :TEST-ME (describe-function 'mon-help-char-functions)
;;; :TEST-ME (apply 'mon-help-char-functions '(t))

;;; ==============================
;;; :CREATED <Timestamp: #{2009-12-28T16:25:12-05:00Z}#{09531} - by MON KEY>
(defun mon-help-char-representation (&optional insertp intrp)
  "Help for working with Emacs character representations.\n
:SEE info node `(elisp)Basic Char Syntax'\n
;; :CHAR-REPRESNTATION-DECIMAL
225
?\\á
\"\\341\"
\(identity ?\\\á\)        ;=> 225
\(identity \"\\341\")     ;=> \"á\"
\(char-to-string ?\\á)  ;=> \"á\"
\(char-to-string 225)  ;=> \"á\"\n
;; :CHAR-REPRESENTATION-OCTAL
#o341 
?\\341
\(identity #o341\)       ;=> 225
\(identity ?\\341\)       ;=> 225
\(char-to-string ?\\341\) ;=> á\n 
;; :CHAR-REPRESENTATION-HEX
#xe1 
\"\\xe1\" 
?\\xe1
\(identity \"\\xe1\"\)      ;=> \"á\"
\(identity #xe1\)        ;=> 225
\(identity ?\\xe1\)       ;=> 225
\(char-to-string ?\\xe1\) ;=> \"á\"\n
;; :CHAR-REPESENTATION-UNICODE
\"\\u25BA\"
?\\u25BA
\(identity ?\\u25BA\)       ;=> 9658
\(identity \"\\u25BA\"\)      ;=> \"►\"
\(char-to-string ?\\u25BA) ;=> \"►\"\n
;; :CHAR-REPESENTATION-BINARY             :SEE info node `(elisp)Integer Basics'
#b000 -> 0
#b001 -> 1
#b010 -> 2 
#b011 -> 3
#b100 -> 4\n
;; :CHAR-REPESENTATION-RADIX
#2r101010 ;=> 42          ; Radix  2 - Binary in #2r<INTEGER> notation
#b101010  ;=> 42          ; Radix  2 - Binary in #b<INTEGER> notation
#8r52     ;=> 42          ; Radix  8 - Octal in #8r<INTEGER> notation
#o52      ;=> 42          ; Radix  8 - Octal in #o<INTEGER> noatation
#16r2A    ;=> 42          ; Radix 16 - Hexadecimal in #16r<INTEGER> notation
#x2a      ;=> 42          ; Radix 16 - Hexadecimal in #x<INTEGER> notation
#28r1E    ;=> 42          ; Radix 28 - Ocotovigesimal in #28r<INTEGER> notation
#32r1A    ;=> 42          ; Radix 32 - Duotrigesimal in #32r<INTEGER> notation 
#36r16    ;=> 42          ; Radix 36 - Hexatrigesimal in #36r<INTEGER> notation\n
;; :CHAR-CONVERSION-IDIOMS
`format'
\(format \(concat \"\\x09 <- HERE BE A `%s'\\n\"
                  \"And which be control char: `%s'\\n\"
                  \"And which be decimal char: `%s'\\n\"
                  \"And which be octal char: `#o%o'\\nWhich is also being hex char: `#x%x'\"\)
        \(single-key-description ?\\x09\)
        \(text-char-description ?\\x09\)
        \(string-to-char \(format \"%s\" \"\\x09\"\)\) ?\\x9 ?\\11\)\n
`string'
\(apply 'string `(?/ ?a ?b ?c ?d ?e ?f ?g ?h ?i ?j ?k ?l ?m ?n ?o ?p ?q ?r ?s ?t
                 ?u ?v ?w ?x ?y ?z ?A ?B ?C ?D ?E ?F ?G ?H ?I ?J ?K ?L ?M ?N ?O
                 ?P ?Q ?R ?S ?T ?U ?V ?W ?X ?Y ?Z ?0 ?1 ?2 ?3 ?4 ?5 ?6 ?7 ?8 ?9
                 ?- ?_ ?. ?! ?~ ?* ?' ?\( ?\)))
 ;=> \"/abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-_.!~*'()\"\n
:SEE-ALSO `mon-help-char-functions', `mon-help-key-functions',
`mon-help-binary-representation', `mon-help-char-raw-bytes',
`mon-help-diacritics', `mon-help-char-ascii', `mon-help-char-iso-8859-1',
`mon-help-char-ecma-35', `mon-help-char-ecma-48',
`mon-help-read-functions', `mon-help-print-functions'.\n►►►"
(interactive "i\nP")
  (if (or insertp intrp)
      (mon-help-function-spit-doc 'mon-help-char-representation :insertp t)
    (message "Pass non-nil for optional arg INTRP")))
;;
;;; :TEST-ME (mon-help-char-representation)
;;; :TEST-ME (mon-help-char-representation t)
;;; :TEST-ME (describe-function 'mon-help-char-representation)

;;; ==============================
;;; :CREATED <Timestamp: #{2010-04-25T13:18:17-04:00Z}#{10167} - by MON>
(defun mon-help-binary-representation (&optional insertp intrp)
  "Table enumerating binary representations.\n
:SEE info node `(elisp)Bitwise Operations'\n
;; :BIT1-TO-BIT9
 ----------------------------------- 
¦256¦128¦ 64¦ 32¦ 16¦ 8 ¦ 4 ¦ 2 ¦ 1 ¦
 ----------------------------------- 
¦ 0 ¦ 0 ¦ 0 ¦ 0 ¦ 0 ¦ 0 ¦ 0 ¦ 0 ¦ 0 ¦ ;=> 0   #b000000000 #x0   #o0 \(lsh \(lognot 0\) -29\)
¦ 0 ¦ 0 ¦ 0 ¦ 0 ¦ 0 ¦ 0 ¦ 0 ¦ 0 ¦ 1 ¦ ;=> 1   #b000000001 #x1   #o1   \(lsh 1 0\)  
¦ 0 ¦ 0 ¦ 0 ¦ 0 ¦ 0 ¦ 0 ¦ 0 ¦ 1 ¦ 0 ¦ ;=> 2   #b000000010 #x2   #o2   \(lsh 1 1\)  
¦ 0 ¦ 0 ¦ 0 ¦ 0 ¦ 0 ¦ 0 ¦ 1 ¦ 0 ¦ 0 ¦ ;=> 4   #b000000100 #x4   #o4   \(lsh 2 1\)  
¦ 0 ¦ 0 ¦ 0 ¦ 0 ¦ 0 ¦ 1 ¦ 0 ¦ 0 ¦ 0 ¦ ;=> 8   #b000001000 #x8   #o10  \(lsh 4 1\)  
¦ 0 ¦ 0 ¦ 0 ¦ 0 ¦ 1 ¦ 0 ¦ 0 ¦ 0 ¦ 0 ¦ ;=> 16  #b000010000 #x10  #o20  \(lsh 8 1\)  
¦ 0 ¦ 0 ¦ 0 ¦ 1 ¦ 0 ¦ 0 ¦ 0 ¦ 0 ¦ 0 ¦ ;=> 32  #b000100000 #x20  #o40  \(lsh 16 1\) 
¦ 0 ¦ 0 ¦ 1 ¦ 0 ¦ 0 ¦ 0 ¦ 0 ¦ 0 ¦ 0 ¦ ;=> 64  #b001000000 #x40  #o100 \(lsh 32 1\) 
¦ 0 ¦ 1 ¦ 0 ¦ 0 ¦ 0 ¦ 0 ¦ 0 ¦ 0 ¦ 0 ¦ ;=> 128 #b010000000 #x80  #o200 \(lsh 64 1\) 
¦ 1 ¦ 0 ¦ 0 ¦ 0 ¦ 0 ¦ 0 ¦ 0 ¦ 0 ¦ 0 ¦ ;=> 256 #b100000000 #x100 #o400 \(lsh 128 1\)
 -----------------------------------\n 
;; :BIT-OCTET-BYTE-BIT
 ------------------------------------------------------------
¦Octet-2                            ¦Octet-1                 ¦
 ------------------------------------------------------------
¦byte-4               ¦byte-3       ¦byte-2          ¦byte-1 ¦ \(8 bits per byte\)
 ------------------------------------------------------------
¦bit 13-16            ¦bit 9-12     ¦bit 5-8         ¦bit 1-4¦
 ------------------------------------------------------------
¦32768¦16384¦8192¦4096¦2048¦1024¦512¦256¦128¦64¦32¦16¦8¦4¦2¦1¦
¦    0¦    0¦   0¦   0¦   0¦   0¦  0¦  0¦  0¦ 0¦ 0¦ 0¦0¦0¦0¦0¦
 ------------------------------------------------------------\n
;; :BIT-HEX-BIN-OCT
 --------------------------------------                                        
¦ HEX ¦ DEC  ¦ BINARY ¦ OCTAL ¦ BINARY ¦                                       
¦--------------------------------------¦                                       
¦  0  ¦  0   ¦  0000  ¦   0   ¦  000   ¦  :OCTAL->BINARY                       
¦  1  ¦  1   ¦  0001  ¦   1   ¦  001   ¦  #o17 => #10r15                       
¦  2  ¦  2   ¦  0010  ¦   2   ¦  010   ¦     1 -> 001                          
¦  3  ¦  3   ¦  0011  ¦   3   ¦  011   ¦              \\__ #b001111            
¦  4  ¦  4   ¦  0100  ¦   4   ¦  100   ¦              /   (eq #b001111 #o17)   
¦  5  ¦  5   ¦  0101  ¦   5   ¦  101   ¦     7 -> 111                                                              
¦  6  ¦  6   ¦  0110  ¦   6   ¦  110   ¦                                       
¦  7  ¦  7   ¦  0111  ¦   7   ¦  111   ¦                                       
¦  8  ¦  8   ¦  1000  ¦       ¦        ¦                                       
¦  9  ¦  9   ¦  1001  ¦       ¦        ¦  :HEX->BINARY                         
¦  A  ¦  10  ¦  1010  ¦       ¦        ¦  #xA7 => #10r167                      
¦  B  ¦  11  ¦  1011  ¦       ¦        ¦     A -> 1010                         
¦  C  ¦  12  ¦  1100  ¦       ¦        ¦               \\__ #b10100111          
¦  D  ¦  13  ¦  1101  ¦       ¦        ¦               /   (eq #b10100111 #xA7)
¦  E  ¦  14  ¦  1110  ¦       ¦        ¦     7 -> 0111                         
¦  F  ¦  15  ¦  1111  ¦       ¦        ¦                                       
 --------------------------------------\n
;; :BIT-29
\(let \(\(gthr '\(1\)\)\)
  \(dotimes \(i 28 \(setq gthr \(nreverse gthr\)\)\)
    \(push \(* \(car gthr\) 2\) gthr\)\)
  \(setq gthr `\(,@gthr \(,\(length gthr\) ,\(reduce '+ gthr\)\)\)\)\)\n
#b11111111111111111111111111111    ;=> 536870911 \(#o3777777777, #x1fffffff\)\n
`most-positive-fixnum'             ;=> 536870911          ;:NOTE On 32bit machine\n
\(eq #b11111111111111111111111111111 most-positive-fixnum\)\n
`most-negative-fixnum'             ;=> -536870912 \(#o4000000000, #x20000000\)\n
\(lsh 536870911 29\)                 ;=> -536870912 \(#o4000000000, #x20000000\)\n
\(eq \(lsh #b11111111111111111111111111111 29\) most-negative-fixnum\)\n
\(lognot \(lsh #b11111111111111111111111111111 29\)\)\n
:SEE-ALSO `mon-help-char-functions', `mon-help-char-raw-bytes',
`mon-help-char-functions', `mon-help-char-representation',
`mon-help-key-functions', `mon-help-diacritics', `mon-help-char-ascii',
`mon-help-char-iso-8859-1', `mon-help-char-ecma-35',
`mon-help-char-ecma-48', `mon-help-read-functions', `mon-help-print-functions'.\n►►►"
  (interactive "i\nP")
  (if (or insertp intrp)
      (mon-help-function-spit-doc 'mon-help-binary-representation :insertp t)
      (message "Pass non-nil for optional arg INTRP")))
;;
;;; :TEST-ME (describe-function 'mon-help-binary-representation)
;;; :TEST-ME (mon-help-binary-representation t)
;;; :TEST-ME (apply 'mon-help-binary-representation nil '(t))

;;; ==============================
;;; :CREATED <Timestamp: #{2010-04-25T12:42:19-04:00Z}#{10167} - by MON>
(defun mon-help-char-raw-bytes (&optional intrp)
  "Return raw-bytes 200-377 in buffer named \"*RAW-BYTES*\".\n
:NOTE char 4194303 is `max-char'.
:SEE info node `(elisp)Text Representations'\n
:SEE-ALSO `string-to-unibyte', `unibyte-char-to-multibyte',
`multibyte-char-to-unibyte', `string-to-multibyte'
`mon-help-binary-representation', `mon-help-char-functions',
`mon-help-char-representation', `mon-help-key-functions', `mon-help-diacritics',
`mon-help-char-ascii', `mon-help-char-iso-8859-1', `mon-help-char-ecma-35',
`mon-help-char-ecma-48', `mon-help-print-functions',
`mon-help-read-functions'.\n►►►"
  (interactive "p")
  (with-current-buffer (get-buffer-create "*RAW-BYTES*")
    (erase-buffer)
    (save-excursion
      (dolist (raw-byte (number-sequence 4194176 4194303))
        (insert (format "%c <-%d #o%o #x%x\n"raw-byte raw-byte raw-byte raw-byte) )))
    (insert 
     (mapconcat 'identity
      '(";; The raw-bytes for character codepoints in the range:"
        ";; :OCTAL       #8r17777600 - #8r17777777"
        ";; :DECIMAL     #10r4194176  - #10r4194303"
        ";; :HEXADECIMAL #16r3FFF80 -   #16r3FFFFF"
        ";; :NOTE Unicode tops out at #8r4177777 #10r1114111 #16r10FFFF"
        ";;       The character code 4194303 is `max-char'."
        ";;       Internally Emacs codepoints are 22-bit integers."
        ";;\n") "\n"))
    (display-buffer (current-buffer) t)))
;;
;;; :TEST-ME (mon-help-char-raw-bytes)

;;; ==============================
;;; :RENAMED `mon-help-ASCII-chars' -> `mon-help-char-ascii'
;;; :CREATED <Timestamp: #{2009-09-01T17:34:29-04:00Z}#{09362} - by MON KEY>
(defun mon-help-char-ascii (&optional insertp intrp)
  "ASCII Character Tables.\n
    _____________
   |             |                                                      
   | :CHAR-ASCII |                                                      
 __|_____________|______________________________________________67.
|                                                                 |
| 000 NUL|001 SOH|002 STX|003 ETX|004 EOT|005 ENQ|006 ACK|007 BEL |
| 010 BS |011 HT |012 NL |013 VT |014 NP |015 CR |016 SO |017 SI  |
| 020 DLE|021 DC1|022 DC2|023 DC3|024 DC4|025 NAK|026 SYN|027 ETB |
| 030 CAN|031 EM |032 SUB|033 ESC|034 FS |035 GS |036 RS |037 US  |
| 040 SP |041  ! |042  \" |043  # |044  $ |045  % |046  & |047  '  |
| 050  ( |051  ) |052  * |053  + |054  , |055  - |056  . |057  /  |
| 060  0 |061  1 |062  2 |063  3 |064  4 |065  5 |066  6 |067  7  |
| 070  8 |071  9 |072  : |073  ; |074  < |075  = |076  > |077  ?  |
| 100  @ |101  A |102  B |103  C |104  D |105  E |106  F |107  G  |
| 110  H |111  I |112  J |113  K |114  L |115  M |116  N |117  O  |
| 120  P |121  Q |122  R |123  S |124  T |125  U |126  V |127  W  |
| 130  X |131  Y |132  Z |133  [ |134  \\ |135  ] |136  ^ |137  _  |
| 140  ` |141  a |142  b |143  c |144  d |145  e |146  f |147  g  |
| 150  h |151  i |152  j |153  k |154  l |155  m |156  n |157  o  |
| 160  p |161  q |162  r |163  s |164  t |165  u |166  v |167  w  |
| 170  x |171  y |172  z |173  { |174  | |175  } |176  ~ |177 DEL |
|_________________________________________________________________|
|                                                                 |
| 00 NUL| 01 SOH| 02 STX| 03 ETX| 04 EOT| 05 ENQ| 06 ACK| 07 BEL  |
| 08 BS | 09 HT | 0A NL | 0B VT | 0C NP | 0D CR | 0E SO | 0F SI   |
| 10 DLE| 11 DC1| 12 DC2| 13 DC3| 14 DC4| 15 NAK| 16 SYN| 17 ETB  |
| 18 CAN| 19 EM | 1A SUB| 1B ESC| 1C FS | 1D GS | 1E RS | 1F US   |
| 20 SP | 21  ! | 22  \" | 23  # | 24  $ | 25  % | 26  & | 27  '   |
| 28  ( | 29  ) | 2a  * | 2b  + | 2c  , | 2d  - | 2e  . | 2f  /   |
| 30  0 | 31  1 | 32  2 | 33  3 | 34  4 | 35  5 | 36  6 | 37  7   |
| 38  8 | 39  9 | 3a  : | 3b  ; | 3c  < | 3d  = | 3e  > | 3f  ?   |
| 40  @ | 41  A | 42  B | 43  C | 44  D | 45  E | 46  F | 47  G   |
| 48  H | 49  I | 4a  J | 4b  K | 4c  L | 4d  M | 4e  N | 4f  O   |
| 50  P | 51  Q | 52  R | 53  S | 54  T | 55  U | 56  V | 57  W   |
| 58  X | 59  Y | 5a  Z | 5b  [ | 5c  \\ | 5d  ] | 5e  ^ | 5f  _   |
| 60  ` | 61  a | 62  b | 63  c | 64  d | 65  e | 66  f | 67  g   |
| 68  h | 69  i | 6a  j | 6b  k | 6c  l | 6d  m | 6e  n | 6f  o   |
| 70  p | 71  q | 72  r | 73  s | 74  t | 75  u | 76  v | 77  w   |
| 78  x | 79  y | 7a  z | 7b  { | 7c  | | 7d  } | 7e  ~ | 7f DEL  |
|_________________________________________________________________|
|                                                                 |
|  0 NUL|  1 SOH|  2 STX|  3 ETX|  4 EOT|  5 ENQ|  6 ACK|  7 BEL  |
|  8 BS |  9 HT | 10 NL | 11 VT | 12 NP | 13 CR | 14 SO | 15 SI   |
| 16 DLE| 17 DC1| 18 DC2| 19 DC3| 20 DC4| 21 NAK| 22 SYN| 23 ETB  |
| 24 CAN| 25 EM | 26 SUB| 27 ESC| 28 FS | 29 GS | 30 RS | 31 US   |
| 32 SP | 33  ! | 34  \" | 35  # | 36  $ | 37  % | 38  & | 39  '   |
| 40  ( | 41  ) | 42  * | 43  + | 44  , | 45  - | 46  . | 47  /   |
| 48  0 | 49  1 | 50  2 | 51  3 | 52  4 | 53  5 | 54  6 | 55  7   |
| 56  8 | 57  9 | 58  : | 59  ; | 60  < | 61  = | 62  > | 63  ?   |
| 64  @ | 65  A | 66  B | 67  C | 68  D | 69  E | 70  F | 71  G   |
| 72  H | 73  I | 74  J | 75  K | 76  L | 77  M | 78  N | 79  O   |
| 80  P | 81  Q | 82  R | 83  S | 84  T | 85  U | 86  V | 87  W   |
| 88  X | 89  Y | 90  Z | 91  [ | 92  \\ | 93  ] | 94  ^ | 95  _   |
| 96  ` | 97  a | 98  b | 99  c |100  d |101  e |102  f |103  g   |
|104  h |105  i |106  j |107  k |108  l |109  m |110  n |111  o   |
|112  p |113  q |114  r |115  s |116  t |117  u |118  v |119  w   |
|120  x |121  y |122  z |123  { |124  | |125  } |126  ~ |127 DEL  |
|_______________________________________________________________67.\n
:SEE-ALSO `mon-help-char-representation', `mon-help-char-functions',
`mon-help-diacritics', `mon-help-char-iso-8859-1',`mon-help-char-ecma-35',
`mon-help-char-ecma-48', `mon-help-binary-representation',
`mon-help-char-raw-bytes', `mon-help-read-functions', `mon-help-print-functions'.\n►►►"
  (interactive "i\nP")
  (if (or insertp intrp)
      (mon-help-function-spit-doc 'mon-help-char-ascii  :insertp t)
    (message "Pass non-nil for optional arg INTRP")))
;;
(defalias 'mon-help-ascii-chars 'mon-help-char-ascii) 
;;
;;; :TEST-ME (mon-help-char-ascii)
;;; :TEST-ME (mon-help-char-ascii t)
;;; :TEST-ME (describe-function 'mon-help-char-ascii)
;;; :TEST-ME (documentation 'mon-help-char-ascii)
;;; :TEST-ME (apply 'mon-help-char-ascii '(t))

;;; ==============================
;;; :RENAMED `mon-help-char-iso-8859-1' -> `mon-help-char-iso-8859-1'
;;; :CREATED <Timestamp: #{2009-09-01T17:34:24-04:00Z}#{09362} - by MON KEY>
(defun mon-help-char-iso-8859-1 (&optional insertp intrp)
"ISO-8859-1 Character Table.\n
                      __________________                                  
                     |                  |                                 
                     | :CHAR-ISO-8859-1 |                                 
 ____________________|__________________|______________________________73.
|                                                                        |
|   0 NU    16 DL     32 SP    48 0     64 At   80 P      96 '!   112 p  |
|   1 SH    17 D1     33 !     49 1     65 A    81 Q      97 a    113 q  |
|   2 SX    18 D2     34 \"     50 2     66 B    82 R      98 b    114 r  |
|   3 EX    19 D3     35 Nb    51 3     67 C    83 S      99 c    115 s  |
|   4 ET    20 D4     36 DO    52 4     68 D    84 T     100 d    116 t  |
|   5 EQ    21 NK     37 %     53 5     69 E    85 U     101 e    117 u  |
|   6 AK    22 SY     38 &     54 6     70 F    86 V     102 f    118 v  |
|   7 BL    23 EB     39 '     55 7     71 G    87 W     103 g    119 w  |
|   8 BS    24 CN     40 (     56 8     72 H    88 X     104 h    120 x  |
|   9 HT    25 EM     41 )     57 9     73 I    89 Y     105 i    121 y  |
|  10 LF    26 SB     42 *     58 :     74 J    90 Z     106 j    122 z  |
|  11 VT    27 EC     43 +     59 ;     75 K    91 <(    107 k    123 (! |
|  12 FF    28 FS     44 ,     60 <     76 L    92 //    108 l    124 !! |
|  13 CR    29 GS     45 -     61 =     77 M    93 )>    109 m    125 !) |
|  14 SO    30 RS     46 .     62 >     78 N    94 '>    110 n    126 '? |
|  15 SI    31 US     47 /     63 ?     79 O    95 _     111 o    127 DT |
|________________________________________________________________________|
|                                                                        |
| 128 PA   144 DC   160 NS   176 DG   192 A!   208 D-   224 a!   240 d-  |
| 129 HO   145 P1   161 !I   177 +-   193 A'   209 N?   225 a'   241 n?  |
| 130 BH   146 P2   162 Ct   178 2S   194 A>   210 O!   226 a>   242 o!  |
| 131 NH   147 TS   163 Pd   179 3S   195 A?   211 O'   227 a?   243 o'  |
| 132 IN   148 CC   164 Cu   180 ''   196 A:   212 O>   228 a:   244 o>  |
| 133 NL   149 MW   165 Ye   181 My   197 AA   213 O?   229 aa   245 o?  |
| 134 SA   150 SG   166 BB   182 PI   198 AE   214 O:   230 ae   246 o:  |
| 135 ES   151 EG   167 SE   183 .M   199 C,   215 *X   231 c,   247 -:  |
| 136 HS   152 SS   168 ':   184 ',   200 E!   216 O/   232 e!   248 o/  |
| 137 HJ   153 GC   169 Co   185 1S   201 E'   217 U!   233 e'   249 u!  |
| 138 VS   154 SC   170 -a   186 -o   202 E>   218 U'   234 e>   250 u'  |
| 139 PD   155 CI   171 <<   187 >>   203 E:   219 U>   235 e:   251 u>  |
| 140 PU   156 ST   172 NO   188 14   204 I!   220 U:   236 i!   252 u:  |
| 141 RI   157 OC   173 --   189 12   205 I'   221 Y'   237 i'   253 y'  |
| 142 S2   158 PM   174 Rg   190 34   206 I>   222 TH   238 i>   254 th  |
| 143 S3   159 AC   175 'm   191 ?I   207 I:   223 ss   239 i:   255 y:  |
|______________________________________________________________________73.\n
:SEE-ALSO `mon-help-char-representation', `mon-help-char-functions',
`mon-help-diacritics', `mon-help-char-ascii', `mon-help-char-ecma-35',
`mon-help-char-ecma-48',`mon-help-binary-representation',
`mon-help-char-raw-bytes', `mon-help-read-functions',
`mon-help-print-functions'.\n►►►"
  (interactive "i\nP")
  (if (or insertp intrp)
        (mon-help-function-spit-doc 'mon-help-char-iso-8859-1 :insertp t)
    (message "Pass non-nil for optional arg INTRP")))
;;
;;; :TEST-ME (mon-help-char-iso-8859-1)
;;; :TEST-ME (mon-help-char-iso-8859-1 t)
;;; :TEST-ME (describe-function 'mon-help-char-iso-8859-1)
;;; :TEST-ME (documentation 'mon-help-char-iso-8859-1)
;;; :TEST-ME (describe-function 'mon-help-char-iso-8859-1)
;;; :TEST-ME (apply 'mon-help-char-iso-8859-1 '(t))


;;; ==============================
;;; :RENAMED `mon-help-cntl->hex->ecma-48' -> `mon-help-char-ecma-48'
;;; :COURTESY Micah Cowan  :HIS teseq.info of GNU Teseq VERSION: 1.0.0
;;; :CREATED <Timestamp: 2009-08-13-W33-4T16:30:22-0400Z - by MON KEY>
(defun mon-help-char-ecma-48 (&optional insertp intrp)
  "For reference, here's a table of the control characters (plus DEL). It
is based on the information from Table 1 of ECMA-48 /ISO/IEC 6429 
\(the control-key representation has been added\).\n
                       _______________                
                      |               |               
                      | :CHAR-ECMA-48 |               
 _____________________|_______________|____________53.
|                                                    |
| :HEX   :KEY    :NAME          :HEX    :KEY   :NAME |
|____________________________________________________|
|                                                    |
| x00     ^@      NUL            x10     ^P      DLE |
| x01     ^A      SOH            x11     ^Q      DC1 |
| x02     ^B      STX            x12     ^R      DC2 |
| x03     ^C      ETX            x13     ^S      DC3 |
| x04     ^D      EOT            x14     ^T      DC4 |
| x05     ^E      ENQ            x15     ^U      NAK |
| x06     ^F      ACK            x16     ^V      SYN |
| x07     ^G      BEL            x17     ^W      ETB |
| x08     ^H      BS             x18     ^X      CAN |
| x09     ^I      TAB            x19     ^Y      EM  |
| x0A     ^J      LF             x1A     ^Z      SUB |
| x0B     ^K      VT             x1B     ^[      ESC |
| x0C     ^L      FF             x1C     ^\\      IS4 |
| x0D     ^M      CR             x1D     ^]      IS3 |
| x0E     ^N      SO             x1E     ^^      IS2 |
| x0F     ^O      SI             x1F     ^_      IS1 |
| x7F     ^?      DEL                                |
|__________________________________________________53.\n
:SEE-ALSO `mon-help-char-representation', `mon-help-char-functions',
`mon-help-diacritics', `mon-help-char-ascii', `mon-help-char-iso-8859-1',
`mon-help-char-ecma-35',`mon-help-binary-representation',
`mon-help-char-raw-bytes', `mon-help-read-functions',
`mon-help-print-functions'.\n►►►"
  (interactive "i\nP")
  (if (or insertp intrp)
        (mon-help-function-spit-doc 'mon-help-char-ecma-48 :insertp t)
    (message "Pass non-nil for optional arg INTRP")))
;;
(defalias 'mon-help-ecma-48-chars-cntl->hex 'mon-help-char-ecma-48)
;;
;;; :TEST-ME (mon-help-char-ecma-48)
;;; :TEST-ME (mon-help-char-ecma-48 t)
;;; :TEST-ME (describe-function 'mon-help-char-ecma-48)
;;; :TEST-ME (documentation 'mon-help-char-ecma-48)
;;; :TEST-ME (describe-function 'mon-help-char-ecma-48)
;;; :TEST-ME (apply 'mon-help-char-ecma-48 '(t))

;;; ==============================
;;; :RENAMED `mon-help-cntl->hex->ecma-35' -> `mon-help-char-ecma-35' 
;;; :COURTESY Micah Cowan :HIS teseq.info of GNU Teseq :VERSION 1.0.0
;;; :CREATED <Timestamp: 2009-08-13-W33-4T16:30:22-0400Z - by MON>
(defun mon-help-char-ecma-35 (&optional insertp intrp)
  "The ECMA-35/ISO/IEC 2200 standard defines an escape sequence to be a
sequence of characters beginning with ESC, with a final byte in the
range 'x30'-'x7E', and any number \(including zero\) of intermediate
bytes in the range 'x20'-'x2F'.  The following table has been provided
as a reference for finding which characters match which codes.\n
               _______________                
              |               |               
              | :CHAR-ECMA-35 |               
 _____________|_______________|____________45.
|      |                                     |
|      |  x2X   x3X   x4X   x5X   x6X   x7X  |
|______|_____________________________________|
|      |                                     |
| xX0  |  SPC    0     @     P     `     p   |
| xX1  |   !     1     A     Q     a     q   |
| xX2  |   \"     2     B     R     b     r   |
| xX3  |   #     3     C     S     c     s   |
| xX4  |   $     4     D     T     d     t   |
| xX5  |   %     5     E     U     e     u   |
| xX6  |   &     6     F     V     f     v   |
| xX7  |   '     7     G     W     g     w   |
| xX8  |   (     8     H     X     h     x   |
| xX9  |   )     9     I     Y     i     y   |
| xXA  |   *     :     J     Z     j     z   |
| xXB  |   +     ;     K     [     k     {   |
| xXC  |   ,     <     L     \\     l     |   |
| xXD  |   -     =     M     ]     m     }   |
| xXE  |   .     >     N     ^     n     ~   |
| xXF  |   /     ?     O     _     o    DEL  |
|__________________________________________45.\n
:SEE-ALSO `mon-help-char-representation', `mon-help-char-functions',
`mon-help-diacritics', `mon-help-char-ascii', `mon-help-char-iso-8859-1',
`mon-help-char-ecma-48', `mon-help-binary-representation',
`mon-help-char-raw-bytes', `mon-help-read-functions',
`mon-help-print-functions'.\n►►►"
  (interactive "i\nP")
  (if (or insertp intrp)
    	(mon-help-function-spit-doc 'stan-help-cntl->hex->ecma-35 :insertp t)
    (message "Pass non-nil for optional arg INTRP")))
;;
(defalias 'mon-help-cntl->hex->ecma-35' 'mon-help-char-ecma-35) 
;;
;;; :TEST-ME (mon-help-char-ecma-35)
;;; :TEST-ME (mon-help-char-ecma-35 t)
;;; :TEST-ME (describe-function 'mon-help-char-ecma-35)
;;; :TEST-ME (documentation 'mon-help-char-ecma-35)
;;; :TEST-ME (describe-function 'mon-help-char-ecma-35)
;;; :TEST-ME (apply 'mon-help-char-ecma-35 '(t))

;;; ==============================
;;; :NOTE `¦' -> BROKEN BAR (ucs-insert #xa6)
;;; :CREATED <Timestamp: #{2009-12-11T11:44:07-05:00Z}#{09505} - by MON KEY>
(defun mon-help-ipv4-header (&optional insertp intrp)
  "The IPv4 header as per RFC-791 \(more or less\).
:SEE (URL `http://tools.ietf.org/rfc/rfc791.txt')\n
:BYTE-OFFSET                                                                 80.
`--> |0      ¦       ¦    1          ¦        2      ¦            3  |          
     |-------¦-------¦---------------¦---------------¦---------------|========  
  00 |VERSION|  :IHL |  :TOS         |         :TOTAL-LENGTH         |  ¦    ¦  
     |-------¦---------------------------------------¦---------------|  20   ¦    
  04 |       |  :IDENTIFICATION      |:FLAG|   :FRAGMENT-OFFSET      | Bytes ¦  
     |-------¦-------¦---------------¦---------------¦---------------|  ¦    ¦  
  08 | :TIME-TO-LIVE |  :PROTOCOL    |         :HEADR-CHECKSUM       |  ¦ IHL¦  
     |-------¦-------¦---------------¦---------------¦---------------|  ¦ Intrnt
  12 |       ¦       |  :SOURCE-ROUTE-LOCATOR        |               |  ¦ Header
     |-------¦-------¦---------------¦---------------¦---------------|  ¦ Length
  16 |       ¦       |  :DESTINATION-ROUTING-LOCATOR |               |  ¦    ¦  
     |-------¦-------¦---------------¦---------------¦---------------|====   ¦  
  20 |       ¦       |  :OPTIONS     |               |   :PADDING    |       ¦  
     |-------¦-------¦---------------¦---------------¦---------------|========  
:BIT |0 1 2 3¦4 5 6 7¦8 9 0 1 2 3 4 5¦6 7 8 9 0 1 2 3¦4 5 6 7 8 9 0 1|          
     |  Nib  ¦ Byte  ¦                     Word                      |          
                                                                             80^
:VERSION                      -> 4-bit. Version field.\n
:IHL \(Internet Header Length\) -> 4-bit. Number of 32-bit words in header.\n
:DS  \(Differentiated Service\) -> :SEE RFC-2474 & RFC-3168\n
:TOS \(Type of Service\)        -> 8-bit.\n
           0     1     2     3     4     5     6     7
        +-----+-----+-----+-----+-----+-----+-----+-----+
        |                 |     |     |     |     |     |
        |   :PRECEDENCE   |  D  |  T  |  R  |  0  |  0  |
        |                 |     |     |     |     |     |
        +-----+-----+-----+-----+-----+-----+-----+-----+\n
        o bits_0–2 -> :TOS-PRECEDENCE
                      111 -> Network Control 
                      110 -> Internetwork Control
                      101 -> CRITIC/ECP
                      100 -> Flash Override
                      011 -> Flash
                      010 -> Immediate
                      001 -> Priority
                      000 -> Routine\n
        o bit-3         0 -> Normal Delay
                        1 -> Low Delay\n
        o bit-4         0 -> Normal Throughput
                        1 -> High Throughput\n
        o bit-5         0 -> Normal Reliability 
                        1 -> High Reliability\n
        o bit-6         0 -> Normal Cost 
                        1 -> Minimize Monetary Cost :SEE RFC-1349\n
        o bit-7           -> undefined\n
:TOTAL-LENGTH   -> 16-bit. Define datagram size.\n
:IDENTIFICATION -> Identify fragments of original IP datagram.\n
:FLAG           -> 3-bit. Control or identify fragments.\n
                     0   1   2
                   +---+---+---+
                   |   | D | M |
                   | 0 | F | F |
                   +---+---+---+\n
                   :FLAG-ORDER-HIGH->LOW\n
                   bit-0 -> Reserved, must be zero.\n
                   bit-1 -> :DF-DO-NOT-FRAGMENT 
                             0 -> May Fragment
                             1 -> Don't Fragment\n
                   bit-2 -> :MF-MORE-FRAGMENTS
                             0 -> Last Fragment
                             1 -> More Fragments\n
:FRAGMENT-OFFSET    -> 13-bit in 8-byte blocks. 
                       Fragment offset rel. orig. unfragmented IP datagram.\n
:TTL (Time to Live) -> 8-bit. Limit datagram lifetime.\n
:PROTOCOL           -> Define protocol of IP datagram's data.\n
:HEADER-CHECKSUM    -> 16-bit. Checksum.\n
:SOURCE-ROUTING-LOCATOR -> 32-bit as 4-octet group. IPv4 address packet source.\n
:DESTINATION-ROUTING-LOCATOR -> As above, IPv4 packet reciever.\n
:SEE (URL `http://tools.ietf.org/rfc/rfc1349.txt')
:SEE (URL `http://tools.ietf.org/html/rfc2474.txt')
:SEE (URL `http://tools.ietf.org/rfc/rfc3168.txt')
:SEE (URL `http://en.wikipedia.org/wiki/IPv4')\n
:SEE-ALSO `*mon-iptables-alst*'.\n►►►"
(interactive "i\nP")
  (if (or insertp intrp)
      (mon-help-function-spit-doc 'mon-help-ipv4-header :insertp t)
    (message "Pass non-nil for optional arg INTRP")))
;;
;;; :TEST-ME (mon-help-ipv4-header )
;;; :TEST-ME (mon-help-ipv4-header t)
;;; :TEST-ME (describe-function 'mon-help-ipv4-header)
;;; :TEST-ME (apply 'mon-help-ipv4-header '(t))


;;; ==============================
;;; :CREATED <Timestamp: #{2010-03-31T17:51:05-04:00Z}#{10133} - by MON KEY>
;;;(defun mon-help-url-functions-usage ((&optional insertp intrp)
;;;(url-copy-file "http://www.w3.org/TR/CSS21/propidx.html" 
;;;                (concat temporary-file-directory"./test"))
;;;(url-insert-file-contents "http://www.w3.org/TR/CSS21/propidx.html")
;;; ==============================

;;; ==============================
;;; :CREATED <Timestamp: #{2009-09-27T06:39:21-04:00Z}#{09397} - by MON>
;;;###autoload
(defun mon-help-nclose-functions (&optional insertp intrp)
  "Functions for working with nclosemacs.
:SEE info node `(nclosemacs)Top'\n►►►\n
;; :NCLOSE-KNOWCESSING
`*nclose-suggest*'
`*nclose-volunteer*'
`*nclose-knowcess*'
`*nclose-reset-session*'
`*nclose-reset-globales*'
`*nclose-reset-signs*'\n
;; :NCLOSE-PRINT-OBJECTS-ENCYCLOPAEDIA
`*nclose-print-wm*'
`*nclose-print-hypos*'
`*nclose-print-object*'
`*nclose-print-instances*'\n
;; :NCLOSE-ADD-TO-KB-MACRO
 (`add-to-kb'
   (`@LHS'= <PATTERN-LISP-FORM>)
   (`@hypo' <HYPOTHESIS>)
  [(`@RHS'= [*RHS-lisp-form*]+) *string-documentation*])               \n
<PATTERN-LISP-FORM> - (form which yields a boolean)
  ,---------.
  |`all-in' |
  |`some-in'|>----<'CLASS-NAME INTEGER 'AND-OR-ELISP-FORM>
  |`oone-in'|                           |  ,-------------------------.
  |`none-in'|                           |  | string= string< string> |
  `---------'                           `--| eq eql equal            |
                                           | < > = /= >= <= + - * /  |
                                           | and or not null '()     |
                                           | memq memql member       |
                                           | yes no                  |
                                           `------------------------70
<HYPOTHESIS> - an hypothesis for the rule.\n
<RHS-LISP-FORM> - right-hand side actions+
  ,----
  | `@SET'
  |  |--+ `prop-in'
  |  |    (OBJECT-NAME PROPERTY-NAME [SCALAR-VALUE|LISP-FORM])
  |  |
  |  |--+ `member-in'
  |       (CLASS-NAME INTEGER PROPERTY-NAME [SCALAR-VALUE|LISP-FORM])
  `----\n
<STRING-DOCUMENTATION>\n"
  (interactive "i\nP")
  (if (or insertp intrp)
      (mon-help-function-spit-doc 'mon-help-nclose-functions :insertp t)
    (message "Pass non-nil for optional arg INTRP")))
;;
;;; :TEST-ME (mon-help-nclose-functions)
;;; :TEST-ME (mon-help-nclose-functions t)
;;; :TEST-ME (describe-function 'mon-help-nclose-functions)

;;; ==============================
;;; :CREATED <Timestamp: Wednesday July 29, 2009 @ 11:57.11 AM - by MON KEY>
(defun mon-help-iso-8601 (&optional insertp intrp)
  "The full, extended format of ISO 8601 is as follows:\n
    1999-10-11T11:10:30,5-07:00\n
;; :ISO-8601-ELEMENTS\n
   1. the year with four digits
   2. a hyphen \(omitted in the basic format\)
   3. the month with two digits
   4. a hyphen \(omitted in the basic format\)
   5. the day of month with two digits
   6. the letter T to separate date and time
   7. the hour in the 24-hour system with two digits
   8. a colon \(omitted in the basic format\)
   9. the minute with two digits
  10. a colon \(omitted in the basic format\)
  11. the second with two digits
  12. a comma
  13. the fraction of the second with unlimited precision
  14. a plus sign or hyphen \(minus\) to indicate sign of time zone
  15. the hours of the time zone with two digits
  16. a colon \(omitted in the basic format\)
  17. the minutes of the time zone with two digits\n
:EXAMPLE\n
------------------------------
      2  4  6  8 10 12 14 16
      |  |  |  |  |  | |  |
      |  |  |  |  |  | |  |
  1999-10-11T11:10:30,5-07:00
   |    |  |  |  |  | |  |  |
   |    |  |  |  |  | |  |  |
   1    3  5  7  9 1113  15 17
------------------------------\n
;; :ISO-8601-OMISSION-RULES
The rules for omission of elements are quite simple. Elements from the time of
day may be omitted from the right and take their immediately preceding delimiter
with them. Elements from the date may be omitted from the left, but leave the
immediately following delimiter behind. When the year is omitted, it is replaced
by a hyphen. Elements of the date may also be omitted from the left, provided no
other elements follow, in which case they take their immediately preceding
delimiter with them. The letter T is omitted if the whole of the time of day or
the whole of the date are omitted. If an element is omitted from the left, it is
assumed to be the current value. \(In other words, omitting the century is really
dangerous, so I have even omitted the possibility of doing so.\) If an element is
omitted from the right, it is assumed to cover the whole range of values and
thus be indeterminate.\n
Every element in the time specification needs to be within the normal
bounds. There is no special consideration for leap seconds, although some might
want to express them using this standard.\n
A duration of time has a separate notation entirely, as follows:\n
    P1Y2M3DT4H5M6S>
    P7W\n
;; :ISO-8601-DURATION-ELEMENTS\n
   1. the letter P to indicate a duration
   2. the number of years
   3. the letter Y to indicate years
   4. the number of months
   5. the letter M to indicate months
   6. the number of days
   7. the letter D to indicate days
   8. the letter T to separate dates from times
   9. the number of hours
  10. the letter H to indicate hours
  11. the number of minutes
  12. the letter M to indicate minutes
  13. the number of seconds
  14. the letter S to indicate seconds\n
Or, for the second form, usually used alone\n
   1. the letter P to indicate a duration
   2. the number of weeks
   3. the letter W to indicate weeks\n
Any element \(number\) may be omitted from this specification and if so takes its
following delimited with it. Unlike the absolute time format, there is no
requirement on the number of digits, and thus no requirement for leading zeros.\n
A period of time is indicated by two time specifications, at least one of which
has to be absolute, separated by a single solidus \(slash\), and has the general
forms as follows:\n
:EXAMPLE
    start/end
    start/duration
    duration/end\n
the end form may have elements of the date omitted from the left with the
assumption that the default is the corresponding value of the element from the
start form. Omissions in the start form follow the normal rules.\n
The standard also has specifications for weeks of the year and days of the week,
but these are used so rarely and are aesthetically displeasing so are gracefully
elided from the presentation.\n
:SOURCE Erik Naggum's \"The Long, Painful History of Time\"
:SEE \(URL `http://naggum.no/lugm-time.html'\).
:SEE-ALSO `mon-help-cl:local-time'.\n►►►"
  (interactive "i\nP")
  (if (or insertp intrp)
      (mon-help-function-spit-doc 'mon-help-iso-8601 :insertp t)
    (message "Pass non-nil for optional arg INTRP")))
;;
;;; :TEST-ME (mon-help-iso-8601)
;;; :TEST-ME (mon-help-iso-8601 t)
;;; :TEST-ME (describe-function 'mon-help-iso-8601)
;;; :TEST-ME (apply 'mon-help-iso-8601 '(t))

;;; ==============================
;;; <Timestamp: Saturday May 23, 2009 @ 04:03.59 PM - by MON KEY>
(defun mon-help-info-incantation (&optional insertp intrp)
  "To reference an info node in a docstring use the idiom:\n
\"info node `\(elisp\)Documentation Tips\'\" <- Without the \"_\" dbl-quotes.\n
To jump to an info node with an elisp expression:
\(info \"\(elisp\)Documentation Tips\"\) <- With the \" \" dbl-quotes!.
:SEE-ALSO `mon-help-tar-incantation', `mon-help-rename-incantation',
`mon-help-unix-commands'.\n►►►"
  (interactive "i\nP")
  (if (or insertp intrp)
      (mon-help-function-spit-doc 'mon-help-info-incantation :insertp t)
    (message "Pass non-nil for optional arg INTRP")))
;;
;;; :TEST-ME (mon-help-info-incantation t)
;;; :TEST-ME (mon-help-info-incantation)
;;; :TEST-ME (describe-function 'mon-help-info-incantation)
;;; :TEST-ME (apply 'mon-help-info-incantation '(t))


;;; ==============================
;;; :CHANGESET 1737 <Timestamp: #{2010-05-17T07:48:29-04:00Z}#{10201} - by MON KEY>
(defun mon-help-tar-incantation (&optional insertp intrp)
  "To help me remember how to do a tar.gz on a directory.
Because I never can remember tar's flags.
:NOTE\nOn w32 with gnuwin32 to unzip use `gzip.exe -d'
On w32 with gnuwin32 to pipe a tar to gz on w32 use `bsdtar.exe xvzf'.\n

:TAR-INCANTATION

 tar -czvf dir-name.tar.gz dir-name

Make an exclude file list, and get tar to use it:

 find ./<SOME-PATH>/<THING(S)-TO-FIND> > what-we-found
 tar -cvf <SOME-PATH-TARRED>.tar ./<SOME-PATH> -X what-we-found

Move the entire directory as an archive do:

 (cd <PATH-FROM> && tar Scpf <PATH-TO><TAR-FILE-NAME>.tar .)

Or, if you prefer, following is equivalent to above:
 tar -C <from-mount-point> -Scpvf <to-mount-point><TAR-FILE-NAME>.tar .

:SEE-ALSO `mon-help-rename-incantation', `mon-help-info-incantation'
`mon-help-unix-commands'.\n►►►"
(interactive "i\nP")
(if (or insertp intrp)
    (mon-help-function-spit-doc 'mon-help-tar-incantation :insertp t)
  (message "Pass non-nil for optional arg INTRP")))
;;
;;; :TEST-ME (mon-help-tar-incantation t)
;;; :TEST-ME (mon-help-tar-incantation)
;;; :TEST-ME (describe-function 'mon-help-tar-incantation)
;;; :TEST-ME (apply 'mon-help-tar-incantation '(t))

;;; ==============================
(defun mon-help-rename-incantation (&optional insertp intrp)
  "Insert the rename idiom for BASH renaming.
# :RENAME-IDIOM
# for f in *FILENAME; do
#  base=`basename $f *FILENAME` #<-- note backtick!
# mv $f $base.NEWNAME
# done

# :EXAMPLE
for f in *.html.tmp; do
 base=`basename $f .html.tmp`
 mv $f $base.html
done 

:SEE-ALSO `mon-help-tar-incantation', `mon-help-info-incantation',
`mon-help-unix-commands'.\n►►►"
(interactive "i\nP")
(if (or insertp intrp)
    (mon-help-function-spit-doc 'mon-help-rename-incantation :insertp t)
  (message "Pass non-nil for optional arg INTRP")))
;;
;;; :TEST-ME (mon-help-rename-incantation t)
;;; :TEST-ME (mon-help-rename-incantation)
;;; :TEST-ME (describe-function 'mon-help-rename-incantation)
;;; :TEST-ME (apply 'mon-help-rename-incantation '(t))

;;; ==============================
;;; :CREATED <Timestamp: #{2009-11-30T16:39:56-05:00Z}#{09491} - by MON KEY>
(defvar *regexp-clean-du-flags* nil
  "*Alist of short and long flags for the `du' command.
:SEE-ALSO `mon-help-du-incantation', `mon-async-du-dir'\n►►►")
;;
(eval-when (compile load)
  (unless (bound-and-true-p *regexp-clean-du-flags*)
    (setq *regexp-clean-du-flags*
          '(("-a" . "--all")
            ("--apparent-size")
            ("-b" . "--bytes")
            ("-B" . "--block-size")     ;SIZE & =SIZE
            ("-c" . "--total")
            ("-D" . "--dereference-args")
            ("--files0-from")           ;=FILE
            ("-h" . "--human-readable")
            ("-H")
            ("-k")
            ("-l" . "--count-links")
            ("-L" . "--dereference")
            ("-P" . "--no-dereference")
            ("--max-depth")             ;=DEPTH
            ;; ("-0" . "--null")
            ("--si")
            ("-s" . "--summarize")
            ("-S" . "--separate-dirs")
            ("-x" . "--one-file-system")
            ("--exclude")               ;=PATTERN
            ("-X" . "--exclude-from"))  ;FILE & =FILE)
          )))
;;
;;; :TEST-ME *regexp-clean-du-flags*
;;
;;; (progn (makunbound '*regexp-clean-du-flags*)(unintern '*regexp-clean-du-flags*))

;;; ==============================
;;; :CREATED <Timestamp: #{2009-11-30T16:31:20-05:00Z}#{09491} - by MON KEY>
(defun mon-help-du-incantation (&optional insertp intrp)
  ""
(interactive "i\nP")
  (if (or insertp intrp)
      (mon-help-function-spit-doc 'mon-help-du-incantation :insertp t)
    (message "Pass non-nil for optional arg INTRP")))
;;
;; Now, tack the var list onto the docstring.
(eval-when-compile
(let (put-flags)
  (setq put-flags "")
  (mapc #'(lambda (x) (setq put-flags 
                            (concat (format "`%s' %s\n" 
                                            (car x) 
                                            (if (cdr x) 
                                                (concat "`" (cdr x) "'")
                                                ""))
                                    put-flags)))
        (reverse (symbol-value '*regexp-clean-du-flags*)))
  (mon-help-put-var-doc-val->func 'put-flags  'mon-help-du-incantation
                                  (concat 
                                   "Short and long flags to the du command.\n\n"
                                   ";; :DU-FLAGS\n")
                                   nil 
                                   (concat
                                   "\n:EXAMPLE\n shell> du -s --si <DIR>\n\n"
                                   ":SEE-ALSO `*regexp-clean-du-flags*'\n►►►"))))
;;
;;; :TEST-ME (mon-help-du-incantation )
;;; :TEST-ME (mon-help-du-incantation t)
;;; :TEST-ME (describe-function 'mon-help-du-incantation)
;;; :TEST-ME (apply 'mon-help-du-incantation '(t))
;;
;;; (progn (fmakunbound 'mon-help-du-incantation) (unintern 'mon-help-du-incantation))

;;; ==============================
;;; :CREATED <Timestamp: Sunday May 31, 2009 @ 04:35.09 PM - by MON KEY>
(defun mon-help-install-info-incantation (&optional insertp intrp)
  "Insert the install-info incantation.
Esp. needed on w32 as I can never remember it.
M-x cygwin-shell\install-info  info-file  /\\\"Program Files\\\"/Emacs/emacs/info/dir
M-x shell\install-info  info-file  \"/usr/info/dir\".\n►►►"
  (interactive "i\nP")
  (if (or insertp intrp)
    (let ((info-incantation
           (cond
            (IS-MON-P-W32
             "M-x cygwin-shell install-info info-file /\"Program Files\"/Emacs/emacs/info/dir")
            (IS-MON-P-GNU
             "M-x shell\install-info  info-file  \"/usr/info/dir\"")
          ((eq system-type 'windows-nt)
             "\nM-x cygwin-shell install-info info-file /\"Program Files\"/Emacs/emacs/info/dir")
          ((or (eq system-type 'gnu/linux)  (eq system-type 'linux))
           "\nM-x shell\install-info  info-file  \"/usr/info/dir\"")
          (t "\nM-x shell\install-info  info-file  \"/path/to/info/dir\""))))
      (princ info-incantation (current-buffer)))
    (message "Pass non-nil for optional arg INTRP")))
;;
;;; :TEST-ME (mon-help-install-info-incantation t)
;;; :TEST-ME (mon-help-install-info-incantation t)
;;; :TEST-ME (describe-function 'mon-help-tar-incantation)
;;; :TEST-ME (apply 'mon-help-tar-incantation '(t))

;;; ==============================
;;; :CREATED <Timestamp: #{2009-11-04T16:26:50-05:00Z}#{09453} - by MON KEY>
(defun mon-help-hg-archive (insertp intrp)
  "Idiom for creating an HG archive of a specific revision.
Lifted straight from the `hg' man page.\n
hg archive [OPTION]... DEST\n
By default, the revision used is the parent of the working directory.
Use -r/--rev to specify a different revision.\n
To specify the type of archive to create, use -t/--type.\n
;; :VALID-TYPES\n
\"files\" \(default\): a directory full of files
\"tar\": tar archive, uncompressed
\"tbz2\": tar archive, compressed using bzip2
\"tgz\": tar archive, compressed using gzip
\"uzip\": zip archive, uncompressed
\"zip\": zip archive, compressed using deflate\n
The exact name of the destination archive or directory is given using a format
string; :SEE 'hg help export' for details.\n
Each member added to an archive file has a directory prefix prepended.
Use -p/--prefix to specify a format string for the prefix.
The default is the basename of the archive, with suffixes removed.\n
;; :HG-ARCHIVE-OPTIONS
--no-decode 	do not pass files through decoders
-p, --prefix 	directory prefix for files in archive
-r, --rev 	revision to distribute
-t, --type 	type of distribution to create
-I, --include 	include names matching the given patterns
-X, --exclude 	exclude names matching the given patterns\n
:SEE (URL `http://mercurial.selenic.com/quickstart/')
:SEE (URL `http://mercurial.selenic.com/guide/')
:SEE (URL `http://hgbook.red-bean.com/read/')\n►►►"
  (interactive "i\nP")
  (if (or insertp intrp)
      (mon-help-function-spit-doc 'mon-help-hg-archive :insertp t)
      (message "Pass non-nil for optional arg INTRP")))
;;
;;; :TEST-ME (mon-help-hg-archive)
;;; :TEST-ME (mon-help-hg-archive t)
;;; :TEST-ME (describe-function 'mon-help-hg-archive)
;;; :TEST-ME (apply 'mon-help-hg-archive '(t))

;;; ==============================
;;; :CREATED <Timestamp: #{2009-11-07T19:33:41-05:00Z}#{09457} - by MON KEY>
(defun mon-help-crontab (&optional insertp intrp)
  "Help for the crontab tool.\n
;; :CRONTAB-ELEMENTS
MINUTE HOUR DOM MONTH DOW USER CMD\n
minute  This controls what minute of the hour the command will run on,
        and is between '0' and '59'\n
hour    This controls what hour the command will run on, and is specified in
        the 24 hour clock, values must be between 0 and 23 (0 is midnight)\n
dom     This is the Day of Month, that you want the command run on, e.g. to
        run a command on the 19th of each month, the dom would be 19.\n
month   This is the month a specified command will run on, it may be specified
        numerically (0-12), or as the name of the month (e.g. May)\n
dow     This is the Day of Week that you want a command to be run on, it can
        also be numeric (0-7) or as the name of the day (e.g. sun).\n
user    This is the user who runs the command.
        :NOTE User is not needed when editing your own user crontab.\n
cmd     This is the command that you want run. This field may contain
        multiple words or spaces.\n
 __________________________
|                          |
|  :FIELD         :VALUES  |
|   -----          ------  |
|  minute          0-59    |
|  hour            0-23    |
|  day of month    0-31    |
|  month           0-12    |
|  day of week     0-7     |
|__________________________|\n
 _________________________________________________________________
|                                                                 |
|  *     *     *     *     *    :COMMAND-TO-BE-EXECUTED           |
|  |     |     |     |     |                                      |
|  |     |     |     |     `----- day of week (0 - 6) (Sunday=0)  |
|  |     |     |     `------- month (1 - 12)                      |
|  |     |     `--------- day of month (1 - 31)                   |
|  |     `----------- hour (0 - 23)                               |
|  `------------- min (0 - 59)                                    |
|_________________________________________________________________|\n
 _____________________________________________________________________________
|                                                                             |
| :MIN | :HR | :DAY | :DOM | :DOW | :EXECUTION-TIME                           |
| 30      0     1    1,6,12   *   -> 00:30 Hrs on 1st of Jan, June & Dec.     |
| 0       20    *     10      1-5 -> 8.00 PM weekdays (Mon-Fri) in Oct.       |
| 0       0    1,15   *       *   -> Midnight on 1st & 15th of month.         |
| 5,10    0     10    *       1   -> 12.05,12.10 every Mon & 10th each month. |
|_____________________________________________________________________________|\n
 _____________________________________________________________________________
|                                                                             |
|  $crontab -e  ;Edit your crontab file, or create if doesn't already exist.  |
|  $crontab -l  ;Display your crontab file.                                   |
|  $crontab -r  ;Remove your crontab file.                                    |
|  $crontab -v  ;Display the last time you edited your crontab file.          |
|_____________________________________________________________________________|\n\n
:NOTE It is _VERY_IMPORTANT_ to make sure your .bashrc has the following:\n
  export EDITOR=emacs\n
Some users mistakenly put `export EDITOR=vi'. Never do this. It causes headaches,
user-error, and may even make your CPU to stop working! (Hint just use `:q')\n►►►"
  (interactive "i\nP")
  (if (or insertp intrp)
      (mon-help-function-spit-doc 'mon-help-crontab :insertp t)
      (message "Pass non-nil for optional arg INTRP")))
;;
;;; :TEST-ME (mon-help-crontab)
;;; :TEST-ME (mon-help-crontab t)
;;; :TEST-ME (describe-function 'mon-help-crontab)
;;; :TEST-ME (apply 'mon-help-crontab '(t))

;;; ==============================
;;; :CREATED <Timestamp: #{2009-12-28T16:21:30-05:00Z}#{09531} - by MON KEY>

;;; ==============================
;;; :CREATED <Timestamp: #{2009-11-16T14:03:44-05:00Z}#{09471} - by MON KEY>
(defun mon-help-permissions (&optional insertp intrp)
  "Emacs permission functions and tables for chown, chmod, chattr, umask, etc.\n
;; :EMACS-PERMISSIONS-FUNCTIONS
`file-attributes'
`file-modes-symbolic-to-number'
`file-modes-char-to-who'
`file-modes-char-to-right'
`file-modes-rights-to-number'
`mon-help-unix-commands'
`read-file-modes'
`set-file-modes'
`set-default-file-modes'\n
 _____________________  __________________________________________________77.
|                     ||                                                    | 
|     :UGOA           ||              :TRIPLET                              |
|_____________________||____________________________________________________|         
|                     ||                                                    |
| U - First  - Owner  || First        Second       Third                    |
| G - Second - Group  || r: readable  w: writable  x: executable            |
| O - Third  - Others ||                           s: executable + setuid   |
| A -        - All    ||                           S: setuid not executable |
|_____________________||____________________________________________________|
                                                                             
          _____________                      _________________________       
         |             |                    |                         |      
         | :OPERATORS  |                    | :TRIPLES-SYM->OCT->BIN  |      
 ________|_____________|_____________   ____|_________________________|_____ 
|                                    | |                                    |
|  ugoa  :WHO   usr grp other all    | |  --- --- --- : 000 : 000 000 000   |
|  +     :DO    Add permission       | |  --x --x --x : 111 : 001 001 001   |
|  -     :DO    Remove permission    | |  -w- -w- -w- : 222 : 010 010 010   |
|  =     :DO    Permission equal to  | |  -wx -wx -wx : 333 : 011 011 011   |
|  r     :SET   Read                 | |  r-- r-- r-- : 444 : 100 100 100   |
|  w     :SET   Write                | |  r-x r-x r-x : 555 : 101 101 101   |
|  x     :SET   Exectute             | |  rw- rw- r-w : 666 : 110 110 110   |
|  t     :SET   Sticky bit           | |  rwx rwx rwx : 777 : 111 111 111   |
|  s     :SET   UID or GID           | |                                    |
|____________________________________| |____________________________________|
                                                                              
             ___________________________________________________             
            |         |                           |             |            
            | :OCTAL  |        :SYMBOLIC          |   :BINARY   |            
            |_________|___________________________|_____________|            
            |                                                   |            
            |  0       --- no permission               0: 000   |            
            |  1       --x execute                     1: 001   |            
            |  2       -w- write                       2: 010   |            
            |  3       -wx write and execute           3: 011   |            
            |  4       r-- read                        4: 100   |            
            |  5       r-x read and execute            5: 101   |            
            |  6       rw- read and write              6: 110   |            
            |  7       rwx read, write and execute     7: 111   |            
            |___________________________________________________|            
                                                                             
                             _________________                               
                            |                 |                              
                            |  :USER-7-TABLE  |                              
 ___________________________|_________________|____________________________ 
|                                                                          | 
|  rwx rwx rwx :777                                                        | 
|  rwx rwx rw- :776  rwx rw- rw- :766                                      | 
|  rwx rwx r-x :775  rwx rw- r-x :765  rwx r-x r-x :755                    | 
|  rwx rwx r-- :774  rwx rwx r-- :764  rwx r-x r-- :754  rwx r-- r-- :744  | 
|  rwx rwx -wx :773  rwx rwx -wx :763  rwx r-x -wx :753  rwx r-- -wx :743  | 
|  rwx rwx -w- :772  rwx rwx -w- :762  rwx r-x -w- :752  rwx r-- -w- :742  | 
|  rwx rwx --x :771  rwx rwx --x :761  rwx r-x --x :751  rwx r-- --x :741  | 
|  rwx rwx --- :770  rwx rwx --- :760  rwx r-x --- :750  rwx r-- --- :740  | 
|                                                                          | 
|  rwx -wx -wx :733                                                        | 
|  rwx -wx -w- :732  rwx -w- -w- :722                                      | 
|  rwx -wx --x :731  rwx -w- --x :721  rwx --x --x :711                    | 
|  rwx -wx --- :730  rwx -w- --- :720  rwx --x --- :710  rwx --- --- :700  | 
|__________________________________________________________________________| 
                                                                          77^
:SEE info node `(coreutils)File permissions'\n►►►"
(interactive "i\nP")
  (if (or insertp intrp)
      (mon-help-function-spit-doc 'mon-help-permissions :insertp t)
    (message "Pass non-nil for optional arg INTRP")))
;;
;;; :TEST-ME (mon-help-permissions)
;;; :TEST-ME (mon-help-permissions t)
;;; :TEST-ME (describe-function 'mon-help-permissions)
;;; :TEST-ME (apply 'mon-help-permissions '(t))

;;; ==============================
;;; :CREATED <Timestamp: #{2009-11-16T12:36:57-05:00Z}#{09471} - by MON KEY>
(defun mon-help-unix-commands (&optional insertp intrp)
  "Unix command line programs and builtins.\n
;; :FILE-SYSTEM-INFO-MAN-NODES
cd        ; :SEE info node `(coreutils)cp invocation'
chattr    ;
cksum     ; :SEE info node `(coreutils)cksum invocation'
cmp       ; :SEE info node `(coreutils) '
cp        ; :SEE info node `(coreutils)cp invocation'
cpio      ; :SEE info node `(cpio)'
dd        ; :SEE info node `(coreutils)dd invocation'
df        ; :SEE info node `(coreutils)df invocation'
dir       ; :SEE info node `(coreutils)dir invocation'
dircolors ; :SEE info node `(coreutils)dircolors invocation'
du        ; :SEE info node `(coreutils)du invocation'
find      ; :SEE info node `(find)'
fsck      ; :SEE info node `(coreutils) '
fuser     ; :SEE info node `(coreutils) '
gzip      ; :SEE info node `(gzip)'
install   ; :SEE info node `(coreutils)install invocation'
ln        ; :SEE info node `(coreutils)ln invocation'
ls        ; :SEE info node `(coreutils)'
lsattr    ; :SEE info node `(coreutils) '
lsof      ; :SEE info node `(coreutils) '
md5sum    ; :SEE info node `(coreutils)md5sum invocation'
mkdir     ; :SEE info node `(coreutils)mkdir invocation'
mknod     ; :SEE info node `(coreutils)mknod invocation'
mkfifo    ; :SEE info node `(coreutils)mkfifo invocation'
mount     ; :SEE info node `(coreutils) '
mv        ; :SEE info node `(coreutils)mv invocation'
pwd       ; :SEE info node `(coreutils)pwd invocation'
readlink  ; :SEE info node `(coreutils)readlink invocation'
rm        ; :SEE info node `(coreutils)rm invocation'
rmdir     ; :SEE info node `(coreutils)rmdir invocation'
shred     ; :SEE info node `(coreutils)shred invocation'
size      ; :SEE info node `(binutils)size'
sync      ; :SEE info node `(coreutils)sync invocation'
stat      ; :SEE info node `(coreutils)stat invocation'
sum       ; :SEE info node `(coreutils)sum invocation'
tar       ; :SEE info node `(tar)'
touch     ; :SEE info node `(coreutils)touch invocation'
unlink    ; :SEE info node `(coreutils)unlink invocation'
umask     ; :SEE info node `(coreutils)'
updatedb  ; :SEE info node `(find)Invoking updatedb'
vdir      ; :SEE info node `(coreutils)vdir invocation'\n
;; :PROCESSES-INFO-MAN-NODES
at        ; (woman \"at\")
chroot    ; :SEE info node `(coreutils)chroot invocation'
cron      ; :SEE (woman \"crontab\") :SEE-ALSO `mon-help-crontab'
exit      ; :SEE info node `(coreutils) '
kill      ; :SEE info node `(coreutils)kill invocation'
killall   ; :SEE info node `(coreutils) '
nice      ; :SEE info node `(coreutils)nice invocation'
nohup     ; :SEE info node `(coreutils)nohup invocation'
tty       ; :SEE info node `(coreutils)tty invocation'
ps        ; :SEE (woman \"ps\")
sleep     ; :SEE info node `(coreutils)sleep invocation'
stty      ; :SEE info node `(coreutils)stty invocation'
tee       ; :SEE info node `(coreutils)tee invocation'
time      ; :SEE info node `(coreutils)'
top       ; :SEE (woman \"top\")
wait\n
;; :USER-ENVIRONMENT-INFO-MAN-NODES
chmod     ; :SEE info node `(coreutils)chmod invocation' :SEE-ALSO `mon-help-permissions'
chown     ; :SEE info node `(coreutils)chown invocation'
chgrp     ; :SEE info node `(coreutils)chgrp invocation'
env       ; :SEE info node `(coreutils)env invocation'
finger
hostid    ; :SEE info node `(coreutils)hostid invocation'
id        ; :SEE info node `(coreutils)id invocation'
logname   ; :SEE info node `(coreutils)logname invocation'
printenv  ; :SEE info node `(coreutils)printenv invocation'
mesg
passwd
su        ; :SEE info node `(coreutils) '
sudo      ; :SEE (woman \"sudo\")
uptime
w
wall
write
uname     ; :SEE info node `(coreutils)uname invocation'
groups    ; :SEE info node `(coreutils)groups invocation'
users     ; :SEE info node `(coreutils)users invocation'
who       ; :SEE info node `(coreutils)who invocation'
whoami    ; :SEE info node `(coreutils)whoami invocation'\n
;; :TEXT-PROCESSING-INFO-MAN-NODES
awk      ; :SEE info node `(gawk)Invoking Gawk'
cmp      ; :SEE info node `(diff)Invoking cmp'
comm     ; :SEE info node `(coreutils)comm invocation'
cat      ; :SEE info node `(coreutils)cat invocation'
cut      ; :SEE info node `(coreutils)cut invocation'
csplit   ; :SEE info node `(coreutils)csplit invocation'
diff     ; :SEE info node `(diff)'
ex
expand   ; :SEE info node `(coreutils)expand invocation'
fmt      ; :SEE info node `(coreutils)fmt invocation'
fold     ; :SEE info node `(coreutils)fold invocation'
head     ; :SEE info node `(coreutils)head invocation'
iconv    ; :SEE info node `() '
join     ; :SEE info node `(coreutils)join invocation'
less
more
nl       ; :SEE info node `(coreutils)nl invocation'
objdump  ; :SEE info node `(binutils)objdump'
od       ; :SEE info node `(coreutils)od invocation'
patch    ; :SEE info node `(diff)Invoking patch'
paste    ; :SEE info node `(coreutils)paste invocation'
ptx      ; :SEE info node `(coreutils)ptx invocation'
ed       ; :SEE info node `(ed)'
sed      ; :SEE info node `(sed)'
sort     ; :SEE info node `(coreutils)sort invocation'
split    ; :SEE info node `(coreutils)split invocation'
strings  ; :SEE info node `(binutils)strings'
strip    ; :SEE info node `(binutils)strip'
tsort    ; :SEE info node `(coreutils)tsort invocation'
tac      ; :SEE info node `(coreutils)tac invocation'
tail     ; :SEE info node `(coreutils)tail invocation'
tr       ; :SEE info node `(coreutils)tr invocation'
unexpand ; :SEE info node `(coreutils)unexpand'
uniq     ; :SEE info node `(coreutils)uniq invocation'
wc       ; :SEE info node `(coreutils)wc invocation'\n
;; :SHELL-PROGRAMMING-INFO-MAN-NODES
alias
bash      ; :SEE info node `(bash)'
basename  ; :SEE info node `(coreutils)basename invocation'
dirname   ; :SEE info node `(coreutils)dirname invocation'
pathchk   ; :SEE info node `(coreutils) pathchk invocation'
unset     ; :SEE info node `(coreutils)'
echo      ; :SEE info node `(coreutils)echo invocation'
printf    ; :SEE info node `(coreutils)printf invocation'
yes       ; :SEE info node `(coreutils)yes invocation'
expr      ; :SEE info node `(coreutils)expr invocation'
false     ; :SEE info node `(coreutils)false invocation'
test      ; :SEE info node `(coreutils)test invocation'
true      ; :SEE info node `(coreutils)true invocation'
xargs     ; :SEE info node `(find)Multiple Files'\n
;; :NETWORKING-INFO-MAN-NODES
host
netstat
ping      ; :SEE (woman \"ping\")
netcat    ; :SEE (woman \"netcat\")
traceroute ; :SEE (woman \"traceroute\")
;; :SEARCHING-INFO-MAN-NODES
find      ; :SEE info node `(find)Invoking find'
grep      ; :SEE info node `(grep)'
locate    ; :SEE info node `(find)Invoking locate'
whereis   ; :SEE (woman \"whereis\")
which     ; :SEE (woman \"which\")\n
;; :MISCELLANEOUS-INFO-MAN-NODES
apropos   ; :SEE (woman \"apropos\")
banner    ; :SEE (woman \"\")
bc
cal
clear     ; :SEE (woman \"clear\")
date      ; :SEE info node `(coreutils)date invocation'
file
help
history   ; :SEE info node `(bash)Bash History Builtins'
info      ; :SEE info node `(info)'
lp
man       ; :SEE (woman \"man\")
pax
size      ; :SEE (woman \"size\")
tput
type
uname     ; :SEE info node `(coreutils)uname invocation'
whatis\n►►►"
  (interactive "i\nP")
  (if (or insertp intrp)
      (mon-help-function-spit-doc 'mon-help-unix-commands :insertp t)
      (message "Pass non-nil for optional arg INTRP")))
;;
;;; :TEST-ME (mon-help-unix-commands)
;;; :TEST-ME (mon-help-unix-commands t)
;;; :TEST-ME (describe-function 'mon-help-unix-commands)
;;; :TEST-ME (apply 'mon-help-unix-commands '(t))

;;; ==============================
;;; :CREATED <Timestamp: Tuesday June 23, 2009 @ 11:37.05 AM - by MON KEY>
(defun mon-help-format-width (&optional insertp intrp)
  "Invoking `format' control string to specify padding using the width flag.\n
:SEE info node `(elisp)Formatting Strings'\n
:EXAMPLE
  \(let \(\(x 'test\) \(y \"\"\)\)
     \(format \"This is a %-9s.\\nThis is a %9s.\\nThis is a %s %4s.\" x x x y\)\)\n
 =>This is a test     .\n   This is a      test.\n   This is a test     .\n
\(format \"%4c%s%4cbubba2\" 32 'bubba1 32\)\n
 =>    bubba1    bubba2\n
:SEE-ALSO `mon-help-read-functions', `mon-help-print-functions',
`mon-help-char-representation', `format', `mon-string-justify-left',
`mon-string-fill-to-col', `mon-line-indent-from-to-col',
`mon-line-strings-pipe-to-col'.\n►►►"
(interactive "i\nP")
(if (or insertp intrp)
    (mon-help-function-spit-doc 'mon-help-format-width :insertp t)
  (message "Pass non-nil for optional arg INTRP")))
;;
;;; :TEST-ME (mon-help-format-width t)
;;; :TEST-ME (mon-help-format-width)
;;; :TEST-ME (describe-function 'mon-help-format-width)
;;; :TEST-ME (apply 'mon-help-format-width '(t))

;;; ==============================
;;; :FIXME This function works... though it is ugly as hell... sorry Andy.
;;; :NOTE This fails: (elisp-index-search "elisp-index-search")
;;; :COURTESY Andy Stewart <lazycat.manatee@gmail.com>
;;; :SEE (URL `http://www.emacswiki.org/emacs/lazycat-toolkit.el')
;;; :MODIFICATIONS <Timestamp: #{2009-08-26T17:36:47-04:00Z}#{09353} - by MON KEY>
(defun mon-index-elisp-symbol ()
  "Find TOPIC in the indices of the Emacs Lisp Reference Manual.\n
:EXAMPLE\n\(elisp-index-search \"setq\")\n
:SEE-ALSO `finder-by-keyword',`mon-help-unix-commands'.\n►►►"
  (interactive)
  (let ((topic (symbol-name (symbol-at-point))))
    (setq topic (read-string (format "Subject to look up <%s>: " topic) nil nil topic))
    (info "elisp")
    (Info-index topic)))
;;
;;; :TEST-ME (elisp-index-search "setq")

;;; ==============================
;;; :CREATED <Timestamp: #{2010-04-06T14:38:14-04:00Z}#{10142} - by MON KEY>
(defun mon-help-w32-functions (&optional insertp intrp)
  "A list of W32 related functions and variables.\n  
;; :W32-DISPLAY-FUNCTIONS
`w32-define-rgb-color'
`w32-default-color-map'
`w32-window-exists-p'
;; :W32-DISPLAY-VARIABLES
`w32-strict-painting'
`w32-enable-palette'
`w32-enable-synthesized-fonts'
`w32-bdf-filename-alist'
`w32-strict-fontnames'\n
;; :W32-SYSTEM
`w32-shell-execute'
`w32-send-sys-command'
`w32-battery-status'\n
;; :W32-KEYS-FUNCTIONS
`w32-register-hot-key'
`w32-unregister-hot-key'
`w32-registered-hot-keys'
`w32-reconstruct-hot-key'
`w32-toggle-lock-key'\n
;; :W32-KEYS-VARIABLES
`w32-alt-is-meta'
`w32-pass-alt-to-system'
`w32-quit-key'
`w32-phantom-key-code'
`w32-enable-num-loc'
`w32-enable-caps-lock'
`w32-scroll-lock-modifier'
`w32-apps-modifier'
`w32-mouse-button-tolerance'
`w32-mouse-move-interval'
`w32-pass-extra-mouse-buttons-to-system'
`w32-pass-multimedia-buttons-to-system'
`w32-pass-rwindow-to-system'
`w32-pass-lwindow-to-system'
`w32-rwindow-modifier'
`w32-pass-multimedia-buttons-to-system'
`x-cut-buffer-max'                     ;<VARIABLE>\n
:SEE-ALSO `*w32-env-variables-alist*', `mon-help-w32-cmd-commands',
`mon-help-w32-env', `mon-help-w32-shell-execute', `mon-help-key-functions'.\n"
  (interactive "i\nP")
  (if (or insertp intrp)
      (mon-help-function-spit-doc 'mon-help-w32-functions :insertp t)
      (message "Pass non-nil for optional arg INTRP")))
;;
;;; :TEST-ME (mon-help-w32-functions)
;;; :TEST-ME (mon-help-w32-functions t)
;;; :TEST-ME (describe-function 'mon-help-w32-functions)
;;; :TEST-ME (apply mon-help-w32-functions nil '(t))

;;; ==============================
;;; :MODIFICATIONS <Timestamp: #{2009-10-01T22:22:37-04:00Z}#{09405} - by MON KEY>
;;; :CREATED <Timestamp: Thursday July 02, 2009 @ 11:50.50 AM - by MON KEY>
(eval-and-compile
(defvar *w32-env-variables-alist*
  '((ALLUSERSPROFILE %ALLUSERSPROFILE%
     "Local returns the location of the All Users Profile.")
    (APPDATA %APPDATA%
     "Local returns the location where applications store data by default.")
    (CD %CD%
     "Local returns the current directory string.")
    ;;(CLIENTNAME %CLIENTNAME% "")
    (CMDCMDLINE %CMDCMDLINE%
     "Local returns the exact command line used to start the current cmd.exe")
    (CMDEXTVERSION %CMDEXTVERSION%
     "System returns the version number of the current Command Processor Extensions.")
    ;; (COMMONPROGRAMFILES %COMMONPROGRAMFILES% ""
    (COMPUTERNAME %COMPUTERNAME%
     "System returns the name of the computer.")
    (COMSPEC %COMSPEC%
     "System returns the exact path to the command shell executable.")
    (DATE %DATE%
     "System returns the current date. This variable uses the same format as the date /t command. Cmd.exe generates this variable. For more information about the date command, see the Date command.")
    (ERRORLEVEL %ERRORLEVEL%
     "System returns the error code of the most recently used command. A non-0 value usually indicates an error.")
    ;; (FP_NO_HOST_CHECK  %FP_NO_HOST_CHECK% "" ;Consensus seems to be this is a frontpage related thing.
    (HOMEDRIVE %HOMEDRIVE%
     "System returns which local workstation drive letter is connected to the user's home directory. This variable is set based on the value of the home directory. The user's home directory is specified in Local Users and Groups.")
    (HOMEPATH %HOMEPATH%
     "System returns the full path of the user's home directory. This variable is set based on the value of the home directory. The user's home directory is specified in Local Users and Groups.")
    (HOMESHARE %HOMESHARE%
     "System returns the network path to the user's shared home directory. This variable is set based on the value of the home directory. The user's home directory is specified in Local Users and Groups.")
    (LOGONSERVER %LOGONSERVER% ;; :SEE (URL `http://support.microsoft.com/kb/183495')
     "Local returns the name of the domain controller that validated the current logon session.")
    (NUMBER_OF_PROCESSORS %NUMBER_OF_PROCESSORS%
     "System specifies the number of processors installed on the computer.")
    (OS %OS%
     "System returns the OS name. Windows XP and Windows 2000 display the OS as Windows_NT.")
    (PATH %PATH%
     "System specifies the search path for executable files")
    (PATHEXT %PATHEXT%
     "System returns a list of the file extensions that the OS considers to be executable.")
    (PROCESSOR_ARCHITECTURE %PROCESSOR_ARCHITECTURE%
     "System returns the processor's chip architecture. Values: x86, IA64.")
    (PROCESSOR_IDENTIFIER %PROCESSOR_IDENTIFIER%
     "System returns a description of the processor.")
    (PROCESSOR_LEVEL %PROCESSOR_LEVEL%
     "System returns the model number of the computer's processor.")
    (PROCESSOR_REVISION %PROCESSOR_REVISION%
     "System returns the revision number of the processor.")
    (PROMPT %PROMPT%
     "Local returns the command-prompt settings for the current interpreter. Cmd.exe generates this variable.")
    (RANDOM %RANDOM%
     "System returns a random decimal number between 0 and 32767. Cmd.exe generates this variable.")
    ;;(SESSIONNAME %SESSIONNAME%  "")
    (SYSTEMDRIVE %SYSTEMDRIVE%
     "System returns the drive containing the Windows root directory (i.e., the system root.")
    (SYSTEMROOT %SYSTEMROOT%
     "System returns the location of the Windows root directory.")
    (TEMP %TEMP%
     "System and User return the default temporary directories for applications that are available to users who are currently logged on. Some applications require TEMP and others require TMP.")
    (TMP %TMP%
     "System and User return the default temporary directories for applications that are available to users who are currently logged on. Some applications require TEMP and others require TMP.")
    (TIME %TIME%
     "System returns the current time. This variable uses the same format as the time /t command. Cmd.exe generates this variable. For more information about the time command. :SEE-ALSO the Time command.")
    (USERDOMAIN %USERDOMAIN%
     "Local returns the name of the domain that contains the user's account.")
    (USERNAME %USERNAME%
     "Local returns the name of the user currently logged on.")
    (USERPROFILE %USERPROFILE%
     "Local returns the location of the profile for the current user.")
    (WINDIR %WINDIR%
     "System returns the location of the OS directory.")
    (PROGRAMFILES %PROGRAMFILES%
     "Returns the location of the default install directory for applications."))
  "*List of environment variables available in w32.
:CALLED-BY `mon-help-w32-env'."))
;;
;;; :TEST-ME (assoc 'TMP *w32-env-variables-alist*)
;;; :TEST-ME (car (assoc 'TMP *w32-env-variables-alist*))
;;; :TEST-ME (cadr (assoc 'TMP *w32-env-variables-alist*))
;;; :TEST-ME (caddr (assoc 'TMP *w32-env-variables-alist*))
;;; :TEST-ME (assoc "Program Files" *w32-env-variables-alist*)
;;; :TEST-ME (mapcar (lambda (x) (car x))*w32-env-variables-alist*)
;;
;;;(progn (makunbound '*w32-env-variables-alist*) (unintern '*w32-env-variables-alist*) )

;;; ==============================
;;; :REQUIRES `mon-string-justify-left'
;;; :MODIFICATIONS <Timestamp: #{2010-01-08T18:51:29-05:00Z}#{10015} - by MON KEY>
;;; :MODIFICATIONS <Timestamp: #{2009-10-01T22:22:37-04:00Z}#{09405} - by MON KEY>
;;; :CREATED <Timestamp: Thursday July 02, 2009 @ 11:50.50 AM - by MON KEY>
(eval-and-compile
(defun mon-help-w32-env (&optional insertp intrp)
  (interactive "i\nP")
  (if (or insertp intrp)
      (mon-help-function-spit-doc 'mon-help-w32-env :insertp t)
    (message "Pass non-nil for optional arg INTRP"))))
;; Now we tack on a docstring using.
(eval-when-compile
  (let ((tt-doc *w32-env-variables-alist*))
    (put 'tt-doc 'variable-documentation
         (concat 
          "Environment variables available in w32.\n"
          "Called interactively with Prefix arg non-nil prints to current-buffer.\n\n---\n"
          "Alist of W32 Environmental variables in var `*w32-env-variables-alist*':\n\n"
          (mapconcat #'(lambda (x)
                         (let* ((k (car x))
                                (v (cdr (assoc k tt-doc)))
                                (v-var (car v))
                                (v-doc (mon-string-justify-left (cadr v) 68 3)))
                           (format "-\n%s %s \n%s" k v-var v-doc)))
                     tt-doc "\n")
          "\n\n:EXAMPLE\n\n(assoc 'WINDIR *w32-env-variables-alist*)\n\n"
          ":EXAMPLE\n\n"
          "Open a cmd prompt and type echo %appdata% which should return\n"
          "the full path to your profile's Application Data directory.\n"
          "If calling from a batch file remember to quote the thusly %variable%\n"
          "or: set VARIABLE=value.\n\n"
          ":SOURCE\n:SEE \(URL `http://windowsitpro.com/article/articleid/23873/')\n"
          ":SEE \(URL `http://technet.microsoft.com/en-us/library/bb490954.aspx'\)\n"
          ":SEE-ALSO `mon-help-w32-env', `mon-help-w32-functions'. \n►►►\n"))
    (put 'mon-help-w32-env 'function-documentation
         (documentation-property 'tt-doc 'variable-documentation)))
);; :CLOSE eval-when

;;; :WAS
;;; (eval-when (compile eval)
;;; (mon-help-put-var-doc-val->func
;;;    '*w32-env-variables-alist*
;;;    'mon-help-w32-env
;;;   ;; PRE-V-STR
;;; "Environment variables available in w32.
;;; Called interactively with Prefix arg non-nil prints to current-buffer.\n\n---
;;; alist of W32 Environmental variables in var `*w32-env-variables-alist*':\n\n"
;;; ;; CUT-V-STR
;;; "\*List of environment variables available in w32.
;;; :CALLED-BY `mon-help-w32-env'."
;;; ;; PST-V-STR
;;; "\n\n:EXAMPLE\n(assoc 'WINDIR *w32-env-variables-alist*)\n
;;; :EXAMPLE
;;; Open a cmd prompt and type echo %appdata% which should return
;;; the full path to your profile's Application Data directory.
;;; If calling from a batch file remember to quote the thusly %variable%
;;; or: set VARIABLE=value.\n
;;; :SOURCE\n:SEE \(URL `http://windowsitpro.com/article/articleid/23873/')
;;; :SEE \(URL `http://technet.microsoft.com/en-us/library/bb490954.aspx'\)\n►►►"))
;;
;;; :TEST-ME (mon-help-w32-env t)
;;
;;;(progn (fmakunbound 'mon-help-w32-env)(unintern 'mon-help-w32-env) )

;;; ==============================
;;; :COURTESY Aaaron Hawley :HIS
;;; :SEE (URL `http://www.emacswiki.org/emacs/Reference_Sheet_by_Aaron_Hawley_source')
;;; :MODIFICATIONS <Timestamp: #{2010-02-26T14:21:58-05:00Z}#{10085} - by MON KEY>
;;; :MODIFICATIONS <Timestamp: #{2009-11-20T16:48:11-05:00Z}#{09475} - by MON KEY>
;;; :MODIFICATIONS <Timestamp: Wednesday June 17, 2009 @ 11:31.47 AM - by MON KEY>
(defvar *mon-help-reference-keys* nil)
;;
(unless (bound-and-true-p *mon-help-reference-keys*)
  (setq *mon-help-reference-keys*
"#:START:REFERENCE-SHEET#

;; :OPEN-KEY-BINDINGS
emacs& RET -- or click a graphical icon
emacs -nw RET -- open in terminal, not in a window
q -- clear splash screen

;; :EXIT-KEY-BINDINGS
C-x C-c -- save buffers and quit
C-] -- recursive edit

;; :CANCEL-KEY-BINDINGS
C-g -- a command
C-M-c -- recursive edit
M-x `top-level' -- all recursive edits

;; :RECURSIVE-EDIT-KEY-BINDINGS
C-] -- exit recursive edit
C-M-c -- cancel recursive edit
M-x top-level -- cancel all recursive edits

;; :CUSTOMIZE-KEY-BINDINGS
C-x C-f ~/.emacs RET -- Emacs initialization file
M-x `customize' -- main menu
M-x `customize-variable' -- variable
M-x `customize-apropos' -- search
M-x `customize-mode' -- mode
M-x `global-set-key' -- define key binding
M-x `local-set-key' -- define key binding for current buffer
M-x `display-time' -- show clock, system load and email flag in mode line
M-x `display-battery-mode' -- show system power
M-x `size-indication-mode' -- show size in mode line
M-x `column-number-mode' -- show column number in mode line
M-x `ruler-mode' -- add a ruler to the current buffer's window
M-x `auto-revert-mode' -- update file if changes on disk
M-x `global-auto-revert-mode' -- update any buffer's file
M-x `menu-bar-mode' -- toggle existence of drop-down menu
M-x `tool-bar-mode' -- toggle existence of clickable tool bar
M-x `scroll-bar-mode' -- toggle scroll bar
M-x `toggle-scroll-bar' -- toggle scroll bar in current frame
M-x `blink-cursor-mode' -- toggle blinking of cursor

;; :MENU-KEY-BINDINGS
M-` -- text interaction with drop-down menu
F10 -- same as previous
M-x `menu-bar-mode' -- toggle existence of drop-down menu
M-x `tool-bar-mode' -- toggle existence of clickable tool bar

;; :HELP-KEY-BINDINGS
C-h ? -- menu
C-h C-h -- menu
SPC -- scroll down menu
DEL -- scroll up menu
q -- close menu
C-h t -- tutorial
C-h r -- Emacs info manual :SEE :INFO-HELP-KEY-BINDINGS
C-h F -- Emacs FAQ
C-h c <KEY> -- what is command for KEY
C-h k <KEY> -- describe command for KEY
C-h w <COMMAND> RET -- where is key binding for COMMAND
C-h m -- show current modes
C-h b -- show current key bindings
C-h a <SEARCH> <TERMS> RET -- list commands matching SEARCH TERMS
C-h f <FUNCTION> RET -- describe FUNCTION
C-h v <VARIABLE> RET -- describe and show values for VARIABLE
TAB -- forward to cross-reference link
M-TAB -- backward cross-reference link
S-TAB -- backward cross-reference link
RET -- follow cross-reference
C-c C-c -- follow cross-reference
C-c C-b -- go back
q -- quit

;; :INFO-HELP-KEY-BINDINGS
C-h i -- open directory of manuals
C-h r -- open Emacs manual
q -- close
t -- table of contents \(menu\)
d -- back to directory
m <ENTRY> -- visit menu ENTRY in table of contents
TAB -- forward to cross-reference link
M-TAB -- backward cross-reference link
S-TAB -- backward cross-reference link
RET -- follow link
l -- back to last visited page
r -- forward to last visited page
C-v -- scroll down
SPC -- scroll down
M-v -- scroll up
DEL -- scroll up
b -- scroll up
n -- next node
p -- previous node
i <WORD> RET -- look for WORD in current manual's index
i RET -- go to index node
s <PATTERN> -- search forward for regular expression PATTERN
S <PATTERN> -- case-insensitive search for regular expression PATTERN
C-s <SEARCH> -- forward to SEARCH :SEE :SEARCH-KEY-BINDINGS
C-r <SEARCH> -- reverse to SEARCH
M-n -- make a duplicate buffer in other window :SEE :WINDOW-KEY-BINDINGS

;; :MINIBUFFER-KEY-BINDINGS
M-p -- previous input
M-n -- recent input
TAB -- complete name of buffer, file, symbol :SEE :COMPLETION-KEY-BINDINGS
C-i -- same as previous
M-r -- search for previous input
M-s -- search for previous input
C-h e -- show recently echoed messages
C-g -- exit

;; :COMPLETION-KEY-BINDINGS
TAB -- complete name of buffer, file, function, variable, ...
SPC -- completion, unless a file
? -- list completions
M-v -- go to \"completions\" buffer
<right> -- next completion
<left> -- previous completion
RET -- select completion
ESC ESC ESC -- exit back to minibuffer

;; :MODE-KEY-BINDINGS
C-h m -- help with current :SEE :HELP-KEY-BINDINGS
M-x `text-mode' -- for writing
M-x `fundamental-mode' -- a simple default
M-x `normal-mode' -- change back to what Emacs thought it was
M-x `customize-mode' -- customize current :SEE :CUSTOMIZE-KEY-BINDINGS

;; :FILE-KEY-BINDINGS
C-x C-f -- open
C-x C-f -- new
M-x `make-directory' RET RET -- including parent directories
C-x C-v -- close current and open another
C-x C-s -- save
C-x s -- prompt to save any buffer that has been modified
C-x C-f M-p RET -- open previously saved or opened
C-x C-w <PATH> RET -- save current to PATH
C-x C-w <DIRECTORY> RET -- save to DIRECTORY using file or buffer name
C-x C-q -- toggle as read only
C-x C-f archive.tar RET -- list contents of archive
C-x C-f file.gz RET -- open compressed Gzip
C-x C-f file.zip RET -- list contents of zip file
M-x `rename-file' -- rename current
M-x `view-file' -- view file :SEE :READ-ONLY-KEY-BINDINGS
<insert> -- change whether to use overwrite or switch back to insert mode
M-x `overwrite-mode' -- same as previous
M-x `binary-overwrite-mode' -- edit file as literal bytes
C-x d M-p RET R -- rename previously saved or opened
C-x i -- insert other file into current buffer
M-x `write-region' -- save region
C-x h M-x write-region -- save buffer once to alternate
M-x `find-file-at-point' -- open file name at point
M-x `revert-buffer' -- restore buffer with file on disk
M-x `recover-file' -- recover auto-save data after a crash
M-x `recover-session' -- recover all files with auto-save data
M-x `size-indication-mode' -- show size in mode line
M-x `auto-revert-mode' -- update file if changes on disk
M-x `global-auto-revert-mode' -- update any buffer's file
M-x `auto-revert-tail-mode' -- update end of file with changes on disk

;; :BUFFER-KEY-BINDINGS
M-< -- `beginning-of-buffer'
M-> -- end-of-buffer
C-x h -- mark
C-x k <BUFFER> RET -- kill BUFFER
C-x k RET -- kill current
C-x b RET -- switch to last buffer
C-x b <BUFFER> RET -- switch to BUFFER or make new BUFFER
C-x 4 b -- switch to a buffer in other window :SEE :WINDOW-KEY-BINDINGS
C-x 4 C-o -- show a buffer in other window :SEE :WINDOW-KEY-BINDINGS
C-x C-b -- list all :SEE :BUFFER-MENU-KEY-BINDINGS
M-x `bury-buffer' -- avoid switching to current buffer
C-x b M-p -- switch to previously switched buffer
C-x C-s -- save current contents to file on disk
C-x s -- save modified files
M-x `rename-buffer' RET <NAME> -- rename current to NAME
M-x `rename-uniquely' -- remove \"<X>\" suffix from buffer name if possible
M-x `revert-buffer' -- restore contents with file on disk :SEE :UNDO-KEY-BINDINGS
M-x `erase-buffer' -- delete everything :SEE :DELETE-KEY-BINDINGS
M-x `clone-indirect-buffer' -- open an indirect buffer based on current
C-x 4 c -- open an indirect buffer but in another window
C-h f car RET C-x o M-x clone-buffer RET C-h f cdr RET -- compare two functions

;; :READ-ONLY-KEY-BINDINGS
C-x C-r <FILE> RET -- open FILE as read only
C-x C-q -- toggle write status
M-x `view-mode' -- view mode for current buffer
M-x `view-file' <FILE> RET -- open FILE in view mode
M-x `view-buffer' -- view mode for other buffer
SPC -- `scroll-down'
DEL -- `scroll-up'
h -- view mode help
q -- turn off view mode
M-x `normal-mode' -- turn off `view-mode'

;; :WINDOW-KEY-BINDINGS
C-v -- scroll down
M-v -- scroll up
C-M-v -- scroll other window down
M-< -- `beginning-of-buffer'
M-> -- `end-of-buffer'
M-x `beginning-of-buffer-other-window' -- beginning of other buffer
M-x `end-of-buffer-other-window' -- end of other buffer
M-r -- move to first column of center line in display
C-0 M-r -- move to first column of first displayed line
M-- M-r -- move to first column of last displayed line
C-4 M-r -- move to first column of fourth displayed line
C-u - 3 M-r -- move to first column of third to last displayed line
C-x 2 -- `split-window-vertically' in two
C-x o -- `switch between-windows'
C-x 4 b -- switch to a buffer in other window
C-x 4 C-o -- show a buffer in other window
C-x 0 -- close current
C-x 1 -- close all others leaving current
C-x 4 f -- open file in other
C-x - -- shrink to fit text
C-x + -- equalize window heights
C-u 5 C-x ^ -- enlarge 5 lines taller
M- 5 C-x ^ -- shrink 5 lines shorter
C-x 3 -- split horizontally
C-u 5 C-x } -- enlarge 5 columns wider
M- 5 C-x } -- shrink 5 columns narrower
C-x < -- scroll horizontally right
C-x > -- scroll horizontally left
M-x `toggle-truncate-lines' -- change if long lines fold or are truncated

;; :BUFFER-MENU-KEY-BINDINGS
C-x C-b -- list
C-u C-x C-b -- list only buffers associated with files
SPC -- move down
n -- move down
C-n -- move down
p -- move up
C-p -- move up
% -- toggle current as read only :SEE :READ-ONLY-KEY-BINDINGS 
? -- show modes for current
g -- update list
T -- toggle list to buffers associated with files
C-o -- view current in other window :SEE :WINDOW-KEY-BINDINGS
RET -- view current in this window
e -- goto current in this window
f -- goto current in this window
1 -- goto current in only 1 window
2 -- goto current in only 1 window
V -- open current buffer in View mode :SEE :READ-ONLY-KEY-BINDINGS 
b -- bury current :SEE :BUFFER-KEY-BINDINGS 
m -- mark current and move down
C-d -- mark to delete current and move up
d -- mark to delete current and move down
k -- mark to delete current and move down
C-k -- mark to delete current and move down
x -- execute marks
q -- quit

;; :REDISPLAY-KEY-BINDINGS
C-l -- with line at center of window
C-0 C-l -- with current line at top of window
M-- C-l -- with current line at bottom of window
C-u -1 C-l -- same as previous
C-M-l -- try to make the top of the current function visible in the window
C-M-l C-M-l -- with current line at top of window

;; :COMMAND-KEY-BINDINGS
C-h l -- show recently typed keys
C-h e -- show recently echoed messages
C-x z -- repeat last command
C-x M-ESC -- edit and re-evaluate last command as Emacs Lisp
C-x M-: -- same as previous
M-x `command-history' -- show recently run commands
x -- run command at line in history

;; :ITERATIVE-COMMAND-KEY-BINDINGS
C-u -- repeat next command 4 times
M-- -- next command once in opposite direction
C-u 8 -- repeat next command 8 times
M-8 -- repeat next command 8 times
C-8 -- repeat next command 8 times
C-u 8 C-u -- repeat next command 8 times
C-8 -- repeat next command 8 times
M-- 3 -- repeat next command 3 times in opposite direction
C-u -3 -- repeat next command 3 times in opposite direction
C-u C-u -- repeat next command 16 times
C-u C-u C-u -- repeat next command 64 times
C-u 369 C-u 0 -- insert 369 zeros

;; :NON-ITERATIVE-COMMAND-KEY-BINDINGS
C-u -- toggle behavior of next command
M-- -- toggle behavior of next command with negative value

;; :MACRO-KEY-BINDINGS
C-x \( -- start recording macro
F3  -- same as previous
C-x \) -- finish recording macro
F4  -- same as previous
C-x e -- finish recording macro and run macro
C-x e -- run last macro
C-x C-k r -- go to each line in region and run last macro - `apply-macro-to-region-lines'
C-x C-k n -- name last macro
M-x <MACRO> -- run macro MACRO
C-x C-k b -- bind last macro to a key `kmacro-bind-to-key'
C-x C-k e -- edit last macro - `edit-kbd-macro'
C-x C-k e M-x <MACRO> -- edit named MACRO
C-x C-k e C-h l -- edit and make recently typed keys
C-x C-f ~/.emacs RET M-x insert-kbd-macro -- save macro

;; :KEYS-KEY-BINDINGS
C-h l -- show recently typed keys
M-x `global-set-key' -- set for all buffers
M-x `local-set-key' -- set for current buffer
C-q -- insert next character literally
C-q TAB -- insert literal tab character
C-q C-j -- insert literal newline
C-q C-m -- insert literal carriage return
C-q C-l -- insert literal form feed \(page delimiter\)
C-x @ c -- modify next key with Control
C-x @ m -- modify next key with Meta
C-x @ S -- modify next key with Shift
C-x @ h -- modify next key with Hyper
C-x @ s -- modify next key with Super
C-x @ a -- modify next key with Alt

;; :UNDO-KEY-BINDINGS
C-x u -- `undo', repeat to further undo
C-_ -- undo, repeat to further undo
C-/ -- undo, repeat to further undo
C-/ C-g C-/ -- undo, then redo
C-/ C-/ C-g C-/ C-/ -- undo, undo, then redo, redo
M-x `revert-buffer' -- restore buffer with file on disk
M-x `buffer-disable-undo' -- turn off for current buffer
M-x `buffer-enable-undo' -- turn on for current buffer

;; :SEARCH-KEY-BINDINGS
C-s <MATCH> -- forward to end of MATCH
C-r <MATCH> -- reverse to front of MATCH
C-r C-s <MATCH> -- forward to end of MATCH
C-s C-r <MATCH> -- reverse to front of MATCH
C-s <MATCH> C-s -- forward to end of second MATCH
C-r <MATCH> C-r -- reverse to front of second MATCH
DEL -- if not at first match, go to previous match
DEL -- if at first match, delete character from search string
C-M-w -- always delete character from search string
C-s <MATCH> C-s C-r -- forward to start of second MATCH
C-r <MATCH> C-r C-s -- reverse to end of second MATCH
C-s <MATCH> C-s C-s DEL -- forward to end of second MATCH
C-r <MATCH> C-r C-r DEL -- reverse to start of second MATCH
RET -- finish search
C-g -- cancel search if current search is successful
C-g -- undo search to last successful search
C-s C-j -- search for newline
C-s C-q C-m -- search for carriage return
C-s C-M-y -- search for current character
C-s C-M-y C-M-y -- search for next two characters
C-s C-M-y C-M-y DEL -- search for current character
C-s C-w -- search for rest of current word
C-s C-w C-w -- search for next two words
C-s C-w C-w DEL -- search for rest of current word
C-s C-y -- search for rest of current line
C-s C-y DEL -- undo search for rest of current line
C-s M-y -- search for last killed text :SEE :KILL-CUT-KEY-BINDINGS
C-s M-y -- search for last killed text :SEE :KILL-CUT-KEY-BINDINGS
C-s M-p -- show previous search
C-s M-n -- show oldest stored search
C-s M-TAB <BEGINNING>  -- complete for BEGINNING of stored searches
C-s C-s -- resume last search backward
C-r C-r -- resume last search forward
M-e -- edit search
M-r -- toggle regular expression search
M-c -- toggle case-sensitivity of search
M-% -- search, query, and replace :SEE :REPLACE-KEY-BINDINGS
C-s <SEARCH> M-% <REPLACE> -- interactive query SEARCH and REPLACE
M-x isearch-toggle-case-fold -- change case-sensitivity of all searches
C-h f isearch-forward RET -- help

;; :NON-INTERACTIVE-SEARCH-KEY-BINDINGS
C-s RET -- forward case-sensitive
C-r RET -- backward case-sensitive
C-s RET C-w -- forward word-based ignoring punctuation and whitespace
C-r RET C-w -- backward word-based ignoring punctuation and whitespace

;; :REGULAR-EXPRESSION-KEY-BINDINGS
C-M-s -- search forward
C-M-r -- search reverse
M-r -- toggle off regexp
C-M-s C-s -- repeat last regexp forward
C-M-r C-s -- repeat last regexp backward
C-r -- suspend replacement and editing buffer
C-M-c -- resume query and replace :SEE :RECURSIVE-EDIT-KEY-BINDINGS 
C-M-% -- regexp replace
C-M-s <SEARCH> M-% <REPLACE> -- interactive query replace :SEE :REPLACE-KEY-BINDINGS
M-x occur -- show matches in buffer
M-x count-matches -- count matches
M-x flush-lines -- delete matching lines
M-x keep-lines -- keep matching lines delete the rest

;; :REPLACE-KEY-BINDINGS
M-% -- search, query, and replace
C-M-% -- search regular expression, query, and replace
M-% RET -- resume last
C-M-% RET -- resume last as regexp
C-s <SEARCH> M-% <REPLACE> -- interactive
C-M-s <SEARCH> M-% <REPLACE> -- interactive with regexp
y -- replace one and go to next
SPC -- replace one and go to next
, -- replace but don't move
n -- skip
DEL -- skip
^ -- previous
! -- replace all
e -- edit replacement
C-r -- suspend to edit buffer
C-M-c -- finish edit and resume
RET -- stop
q -- stop
C-x d *.c RET Q int RET long -- replace \"long\" for \"int\" in .c files

;; :DELETE-KEY-BINDINGS
C-d -- current character
C-u C-d -- next 4 characters
C-u 8 C-d -- next 8 characters
C-u C-u -- next 16 characters
DEL -- character backwards \(backspace\)
M-- C-d -- same as previous
C-u C-u C-u DEL -- previous 64 characters
C-u 5 DEL -- previous 5 characters
M-x `delete-region' -- region
M-x `erase-buffer' -- entire buffer

;; :KILL-CUT-KEY-BINDINGS
C-SPC C-f C-w -- character
M-d -- word
C-k -- to end of line
C-0 C-k -- beginning of line
C-S-DEL -- entire line
C-1 C-k -- line including newline
M-- C-k -- to beginning of previous line
C-u C-k -- next 4 lines
M-k -- sentence :SEE :SENTENCE-KEY-BINDINGS
C-w -- region :SEE :REGION-KEY-BINDINGS
M-w -- region but don't delete \(copy\)
M-d -- word :SEE :WORD-KEY-BINDINGS
C-M-k -- sexp :SEE :SEXP-AND-PAREN-KEY-BINDINGS
M-DEL -- sexp backwards
C-M-w C-w -- append to next
C-M-w -- append to next
C-M-w C-w -- region appending to previous
C-M-w M-w -- region appending to previous, but don't delete \(copy\)
C-M-w C-k -- line appending to previous
C-M-w M-d -- word appending to previous
C-M-w M-k -- sentence appending to previous
C-M-w M-x `kill-paragraph' -- paragraph appending to previous
C-M-w C-M-k -- sexp appending to previous
C-M-w M-DEL -- sexp backward appending to previous
M-z -- delete everything to a character
C-1 M-z -- same as previous
M-- M-z -- delete everything to a character backwards
C-u -1 M-z -- same as previous
C-u 3 M-z -- delete everything to 3rd occurrence of a character

;; :YANK-PASTE-KEY-BINDINGS
C-y -- the last kill sequence
M-y -- the 2nd to last kill sequence

;; :MARK-KEY-BINDINGS
C-SPC -- set at current point
C-@ -- set at current point
C-x C-x -- toggle between current point and mark
C-x C-SPC -- move to last set mark
C-x C-@ -- move to last set mark
C-x h -- buffer
M-h -- paragraph
C-M-h -- function
C-x C-p -- page separated by form feed
M-@ -- word
C-M-@ -- sexp :SEE :SEXP-AND-PAREN-KEY-BINDINGS
C-M-SPC -- sexp
C-SPC C-SPC -- temporarily turn on transient mark mode
M-x `transient-mark-mode' -- turn on transient mark mode

;; :REGION-KEY-BINDINGS
C-SPC -- set end-point of region
C-@ -- set end-point of region
C-w -- kill
M-w -- kill but don't delete \(copy\)
M-= -- count lines and characters
C-x n n -- narrow
C-x n w -- widen

;; :WHITESPACE-KEY-BINDINGS
SPC -- insert space
TAB -- indent or insert tab :SEE :INDENT-KEY-BINDINGS
C-q TAB -- insert literal tab character
C-q C-l -- insert page separator
C-q 0 RET -- insert null
M-SPC -- remove all whitespace at point except one space
M-x `delete-trailing-whitespace' -- remove at end of all lines in buffer
C-a M-x `delete-whitespace-rectangle' -- remove at beginning of all lines in region
C-x h M-x `delete-whitespace-rectangle' -- remove at beginning of all lines

;; :INDENT-KEY-BINDINGS
TAB -- line with mode-specific rules
C-i -- line with mode-specific rules
M-m -- go to indentation at beginning of line
M-s -- center line
C-M-\\ -- region with mode-specific rules
C-x h C-M-\\ -- buffer
M-h C-M-\\ -- paragraph
C-M-h C-M-\\ -- defun
C-x C-p C-M-\\ -- page
C-M-SPC C-M-\\ -- sexp
C-x TAB -- region by one column
C-u 5 C-x TAB -- region by 5 columns
C-u - 2 C-x TAB -- region by 2 columns less
M-x `tabify' -- convert spaces to tabs

;; :NEWLINE-KEY-BINDINGS
RET -- one
C-m -- one
C-j -- one and indent
C-o -- one below current and indent
C-M-o -- keep text following point at same column
C-u 3 RET -- three
C-u 3 C-m -- three
C-u 3 C-j -- three and indent
C-u 3 C-o -- three below current and indent
C-u 3 C-M-o -- move text following point at same column three lines down

;; :LINE-KEY-BINDINGS
C-n -- next
C-p -- previous
C-a -- beginning
M-g g -- goto
M-g M-g -- goto
C-e -- end
C-k -- kill to end
C-0 C-k -- kill to beginning
C-a C-k -- kill from beginning to end
C-S-DEL -- kill from beginning to end including newline
C-a C-k C-k -- same as previous
C-1 C-k -- kill to end including newline
C-u C-k -- kill next 4
C-2 C-k -- kill next 2
M-- C-k -- kill to beginning of previous
M-^ -- merge current line with previous
C-u M-^ -- merge next line with current
C-x C-o -- when not empty line, remove all empty lines below current
C-x C-o -- when only empty line, remove all empty lines
C-x C-o -- when empty, remove all but one empty lines
M-= -- count lines in region
M-x occur -- show lines matches in buffer :SEE :OCCUR-KEY-BINDINGS
M-x `count-matches' -- count matches
M-x `flush-lines' -- delete matching lines
M-x `keep-lines' -- keep matching lines delete the rest
M-x `what-line' -- display number
C-x RET f unix RET -- change file to UNIX style line endings
C-x RET f dos RET -- change file to DOS
C-x RET f dos RET -- change file to Mac
M-x `line-number-mode' -- show line number in mode line
M-x `toggle-truncate-lines' -- change if long lines fold or are truncated

;; :CHAR-KEY-BINDINGS
C-f -- forward
C-b -- backward
C-d -- delete
M-SPC -- remove all whitespace at point except one space
M-x `describe-char' -- properties
C-q 0 RET -- insert null
C-q 40 RET -- insert space using octal value 40
M-x set-variable RET read-quoted-char-radix 16 -- use hex for C-q
C-q 20 RET -- insert space using hex value 20
M-x `set-variable' RET read-quoted-char-radix 10 -- use decimal for C-q
C-q 32 RET -- insert space using decimal value 32
C-u 8 C-q 0 RET -- insert 8 null characters

;; :WORD-KEY-BINDINGS
M-f -- forward
M-b -- backward
M-d -- kill forward
C-DEL -- kill backward
M-DEL -- kill backward
M-t -- transpose
M-@ -- mark
C-u 100 M-@ -- mark next 100
M-- 3 M-@ -- mark previous 3

;; :CAPITALIZATION-KEY-BINDINGS
M-l -- lowercase next word
M-- M-l -- lowercase previous word
C-u M-l -- lowercase next 4 words
M-u -- uppercase next word
M-- M-u -- uppercase previous word
C-u 2 M-l -- uppercase next 2
M-c -- capitalize next
M-- M-c -- capitalize previous
C-u 2 M-c -- capitalize next 2
C-x C-l -- lowercase region
C-x C-u -- uppercase region
M-x `capitalize-region' -- capitalize region

;; :SENTENCE-KEY-BINDINGS
M-a -- beginning
M-e -- end
M-k -- kill

;; :PARAGRAPH-KEY-BINDINGS
M-} -- forward
M-{ -- backward
M-h -- mark
M-g -- fill
C-u M-g -- fill and full justify
M-x `fill-region' -- fill all in region
C-u 72 C-x f -- set fill column to 72
M-x `kill-paragraph' -- kill to end
M-{ M-x kill-paragraph -- kill
M-x `transpose-paragraphs' -- transpose
M-S -- center
M-x `sort-paragraphs' -- alphabetically
M-x `reverse-region' -- sort
M-x `paragraph-indent-text-mode' -- expect leading space rather than empty lines
M-x `auto-refill-mode' -- automatically fill at the end of the line
M-x `refill-mode' -- automatically fill entire paragraph after each edit

;; :PAGE-KEY-BINDINGS
C-q C-l -- insert separator
C-x ] -- forward page
C-x l -- count lines
C-x n p -- narrow
C-x n w -- widen
M-x `sort-pages' -- alphabetically
M-x `what-page' -- display number

;; :SEXP-AND-PAREN-KEY-BINDINGS
M-\( -- insert opening and closing parentheses
C-M-f -- move to the next
C-M-b -- move backward
C-M-d -- move down into the expression
M-x up-list -- move forward and up and outside the current
C-M-k -- kill
C-M-DEL -- kill backward
C-M-@ -- `mark' 
C-M-t -- `transpose-sexps' - transpose S-exprressions
M-x `check-parens' -- match all open and closed parentheses in buffer

;; :COMMENT-KEY-BINDINGS
C-u M-; -- kill
C-SPC -- set end point of region
M-x `comment-region' -- comment the region
M-x `uncomment-region' -- uncomment the region 
M-x `comment-kill' -- kill
C-x ; -- set comments to start at point
M-- C-x ; -- kill comment on this line
C-u C-x ; -- insert and align or just align to column of previous comment

;; :OCCUR-KEY-BINDINGS
M-x `occur' -- show regexp match in buffer
C-u 3 M-x occur -- show matches with 3 lines of context
C-u - 3 M-x occur -- show matches with 3 lines before match

;; :SPELL-CHECK-KEY-BINDINGS
M-$ -- word
M-x `ispell-buffer' -- buffer
M-x `ispell-region' -- region
M-x `ispell-comments-and-strings' -- words and comments in source file
q -- quit
M-x `ispell-continue' -- resume suspended session
M-r -- edit word at point in buffer with recursive edit
C-M-c -- return to spell check by exiting recursive edit
4 -- use third suggested choice
0 -- use first suggested choice
? -- quick help
SPC -- continue
a -- accept for this session
A -- add to buffer local dictionary
r -- replace word with typed version
R -- replace every occurrence of word with typed version
X -- suspend
M-x `ispell-change-dictionary' -- change default dictionary

;; :TRANSPOSE-KEY-BINDINGS
C-t -- characters :SEE :CHAR-KEY-BINDINGS 
M-- C-t -- previous with its previous
C-u 3 C-t -- forward 3 characters
C-u C-t -- forward 4 characters
M-- 3 C-t -- backward 3 characters
C-u C-t -- backward 4 characters
M-t -- words :SEE :WORD-KEY-BINDINGS 
C-x C-t -- lines :SEE :LINE-KEY-BINDINGS 
M-x `transpose-paragraphs' -- paragraphs :SEE :PARAGRAPH-KEY-BINDINGS
C-M-t -- parenthetical expressions

;; :COMPOSITION-KEY-BINDINGS
C-\\ france-postfix RET -- set to French characters
C-\\ -- disable input method, subsequent re-enables
C-h C-\\ RET -- help with current input method
e ' -- insert a letter E acute
e ' ' -- insert a letter E and a quote character
a ` -- insert a letter A grave
e ` -- insert a letter E grave
u ` -- insert a letter U grave
a ^ -- insert a letter A circumflex
e ^ -- insert a letter E circumflex
i ^ -- insert a letter I circumflex
o ^ -- insert a letter O circumflex
u ^ -- insert a letter U circumflex
c , -- insert a letter C with cedilla
c , , -- insert a letter C and comma
e \" -- insert a letter E umlaut
i \" -- insert a letter I umlaut
u \" -- insert a letter U umlaut
< < -- insert an open quotation mark
> > -- insert a closed quotation mark
C-x RET C-\\ spanish-postfix RET -- change to Spanish characters
i ` -- insert a letter I grave
o ` -- insert a letter O grave
n ~ -- insert a letter N with tilde
C-x RET C-\\ german-postfix RET -- change to German characters
a e -- insert a letter A umlaut
a e e -- insert the letters A and E, no umlaut
o e -- insert a letter O umlaut
o e e -- insert the letters O and E, no umlaut
u e -- insert a letter U umlaut
u e e -- insert the letters U and E, no umlaut
s z -- insert the ligature eszett
s z z -- insert the letters S and Z

;; :TEXT-REGISTER-KEY-BINDINGS
C-x r s a -- store region as \"a\"
C-x r i a -- insert region stored in \"a\"
C-x r r a -- store rectangle as \"a\"

;; :POINT-REGISTER-KEY-BINDINGS
C-x r SPC a -- store current as \"a\"
C-x r j a -- move to point in \"a\"

;; :WINDOW-REGISTER-KEY-BINDINGS
C-x r w a -- store configuration of windows in frame
C-x r j a -- restore window configurations

;; :FRAME-REGISTER-KEY-BINDINGS
C-x r f a -- store window configuration for all frames
C-x r j a -- restore all window configurations

;; :NUMBER-REGISTER-KEY-BINDINGS
C-u 1 C-x r n a -- store 1 in \"a\"
C-u 1 C-x r + a -- add 1 to number in \"a\"
C-x r i a -- insert number in \"a\"

;; :POSITION-REGISTER-KEY-BINDINGS
C-x r m RET -- save default
C-x r m <NAME> RET -- save as NAME
C-x r b RET -- move to default
C-x r b <NAME> RET -- move to NAME
C-x r l -- list
M-x bookmark-save -- save positions to file

;; :COLUMN-KEY-BINDINGS
M-x `column-number-mode' -- show column number in mode line
C-u C-x C-n -- set column for line motion commands
C-x C-n -- unset goal column for line motion commands
M-x `ruler-mode' -- add a ruler to the current buffer's window

;; :RECTANGLE-KEY-BINDINGS
C-x r d -- delete, no kill
C-x r k -- kill
C-x r y -- `yank'
C-x r c -- blank out
C-x r t <STRING> -- replace each line with STRING
M-x `string-insert-rectangle' -- insert STRING at each line
M-x `delete-whitespace-rectangle' -- remove leading whitespace
C-x r r a -- store to register \"a\"

;; :TABLE-KEY-BINDINGS
M-x `table-recognize-table' -- activate table at point
C-u M-x `table-recognize-table' -- inactivate table at point
C-u 3 `table-insert-column' -- insert 3 columns
C-u 3 `table-delete-column' -- delete 3 columns

;; :DELIMITED-TEXT-KEY-BINDINGS
M-x `delimit-columns-customize' -- change settings
M-x `delimit-columns-rectangle' -- format rectangle
M-x `delimit-columns-region' -- format region

;; :ALIGN-KEY-BINDINGS

;; :DIRECTORY-KEY-BINDINGS
M-x cd -- change working
M-x `make-directory' RET <PATH> RET -- make PATH including any missing parents
C-x d RET -- list current
C-x C-f RET -- same as previous
C-x d .. RET -- list parent
C-x C-f .. RET -- same as previous
C-x C-d RET ^ -- same as previous
C-x C-d RET C-x C-j -- same as previous
C-x d <PATH> RET -- list PATH
C-x C-f <PATH> RET -- same as previous
M-x `dired-jump' RET -- go to current file in the listing
j -- move to file in listing
g -- reread the listing
C-s -- search listings :SEE :SEARCH-KEY-BINDINGS 
RET -- open file or directory
+ -- add new
i -- show listing of current subdirectory
> -- skip between directory listings
< -- skip between directory listings
C-x C-f <FILE> RET -- visit FILE :SEE :FILE-KEY-BINDINGS 
M o+r RET -- make current file world-readable
G <GROUP> RET -- change current file to GROUP
O <OWNER> RET -- change current file to OWNER
R <FILE> RET -- move current file to FILE
C <FILE> RET -- copy current file to file
P RET -- send current file to default printer
P RET M-DEL a2ps -- print current file in Postscript
P SPC -P SPC <PRINTER> -- send current file to <PRINTER>
T -- touch current file
H <FILE> RET -- hardlink current file to FILE
S <FILE> RET -- symlink current file to FILE
Y <FILE RET -- relative symlink current file to FILE
^ -- list parent
C-x C-j -- list parent
m -- mark current file
u -- unmark current file
d -- mark current file for deletion
t -- toggle marks
U -- unmark all files
C -- copy marked files to another directory
R -- move marked files to another directory
M-x `wdired-change-to-wdired-mode' -- manually edit listing with WDired
C-c C-c -- Exit WDired and commit the edits made to the listing

;; :TRAMP-KEY-BINDINGS
C-x C-f /HOST:DIR/FILE -- open FILE in DIR on remote HOST
C-x C-f /scp:HOST:DIR/FILE -- same but use secure copy \(SCP\)
C-x C-f /ssh:HOST:DIR/FILE -- same but demand the use of SSH
C-x C-f /ssh1:HOST:DIR/FILE -- same but demand version 1 of SSH
C-x C-f /HOST:DIR -- list contents of DIR on remote HOST
C-x d /HOST:DIR -- same as previous

;; :SHELL-KEY-BINDINGS
M-x `shell' -- new window
C-u M-x shell -- prompt for buffer name of new window
M-! -- run command
C-u M-! -- insert output of command
C-SPC -- set end point of region
M-| -- send region to command
C-u -- replace region with output of command
C-x C-w <FILE> RET -- save session transcript to FILE

;; :SHELL-SCRIPT-KEY-BINDINGS
C-x C-f file.sh RET -- start a script named file.sh
M-x `shell-script-mode' -- use shell script mode for current buffer
M-x `sh-mode' -- same as previous
C-c : -- specify shell and insert header
C-c C-x -- run the script
C-M-x -- execute region
M-a -- beginning of command
M-e -- end of command
C-M-a -- beginning of function
C-M-e -- end of function
TAB -- indent
C-j -- newline and indent
C-c < -- use indentation level of current line
C-c > -- analyze buffer's indentation and show inconsistencies
C-c = -- set indentation level for syntactic type at point
C-c ? -- show indentation level at point
C-c TAB -- insert if statement
C-c C-f -- insert for statement
C-c C-c -- insert case statement
C-c C-t -- insert syntax for temporary file
C-c \( -- insert syntax for function

;; :COMPILE-KEY-BINDINGS
M-x `compile' -- execute a compilation command
M-x `recompile' -- execute last compilation command
C-c C-k -- kill
RET -- go to source code for error specified at point
C-c C-c -- same as previous
M-n -- next error
M-p -- previous error
M-} -- errors for next file
M-{ -- errors for previous file
C-x ` -- go to source code for next error

;; :LISP-KEY-BINDINGS
C-M-a -- beginning of defun
C-M-e -- end of defun
C-M-n -- forward sexp
C-M-p -- backward sexp
C-M-u -- upward sexp
C-M-d -- down sexp
M-x `up-list' -- upward sexp and forward
M-\( -- insert parens for sexp
C-m-t -- transpose sexp
C-M-SPC -- mark sexp
C-c C-z -- run interpreter
C-M-x -- eval expression at point
M-; -- insert new comment
C-u M-; -- kill current comment

;; :EMACS-LISP-KEY-BINDINGS
C-x C-e -- evaluate expression before point
C-u C-x C-e -- evaluate expression and insert result at point
C-M-x -- evaluate current defun
M-: -- prompt for expression then evaluate
C-u M-: -- eval expression and insert result at point
TAB -- indent
C-M-q -- indent expression after point
M-TAB -- complete symbol at point
M-x `eval-region' -- evaluate expressions in region
M-x `eval-buffer' -- evaluate buffer
M-x `load-file' RET <FILE> RET -- load FILE
M-x `load-file' RET RET -- load current file
M-x `load-libary' -- load library
M-x `byte-compile-file' RET <FILE> RET -- byte compile current FILE
M-x `byte-compile-file' RET RET -- same as previous
M-x `byte-recompile-directory' RET -- byte compile every file, recursively
M-x `find-function' RET <FUNCTION> RET -- go to definition of FUNCTION
M-x `find-function' RET RET -- go to definition of function at point
M-x `find-variable' RET <VARIABLE> RET -- go to definition of VARIABLE
M-x `find-variable' RET RET -- go to definition of variable at point
M-x `find-library' <LIBRARY> -- go to LIBRARY
M-x `emacs-lisp-mode' -- start Emacs Lisp mode if not started
M-x `checkdoc' -- validate coding style
M-x `checkdoc-ispell' -- and spell check comments and documentation strings
M-x `set-variable' RET debug-on-error RET t RET -- enable debugger on error
M-x `set-variable' RET debug-on-quit RET t RET -- enable debugger on quit
M-x `set-variable' RET debug-on-error RET nil RET -- disable debugger on error
M-x `set-variable' RET debug-on-quit RET nil RET -- enable debugger on quit

;; :ELISP-INTERACTION-KEY-BINDINGS
M-x `lisp-interaction-mode' -- evaluate expressions interactively
C-j -- evaluate sexp before point and insert results on next line
C-M-x -- evaluate current defun :SEE :EMACS-LISP-KEY-BINDINGS 

;; :ELISP-DEBUG-KEY-BINDINGS
M-x `toggle-debug-on-error' -- change whether to start session on error
M-x `toggle-debug-on-quit' -- change whether C-g starts session
M-x `debug-on-entry' RET <FUNCTION> RET -- debug FUNCTION
h -- help
SPC -- move down
C-n -- move down
5 SPC -- move 5 down
- 2 SPC -- move 2 up
C-p -- move up
2 C-p -- backward 2 lines
TAB -- go up level in expression
S-TAB -- go down lower level
RET -- visit help or source location for thing at point
c -- complete evaluation level at current point
q -- quit
d -- step into
b -- set breakpoint
u -- unset breakpoint
j -- set breakpoint and continue
r -- prompt for return value then continue
e -- prompt for expression then evaluate
R -- prompt for expression then evaluate and record it
l -- list functions debugged on entry
M-x `cancel-debug-on-entry' <FUNCTION> RET -- don't debug FUNCTION
M-x cancel-debug-on-entry RET RET -- don't debug for any function

;; :SOURCE-LEVEL-DEBUGGER-KEY-BINDINGS
M-x `edebug-defun' -- turn on instrumentation for current function definition
C-u C-M-x -- same as previous
C-M-x -- turn off instrumentation for current function definition
SPC -- step expression in source
C-x X SPC -- from any buffer, step into expression in source
t -- slowly step
T -- step fast
S -- stop stepping
n -- step to next expression
i -- step in
o -- step out
f -- step forward
r -- show last result again in minibuffer
b -- set breakpoint
u -- unset breakpoint
C-c C-d -- unset breakpoint
x <EXPRESSION> RET -- set conditional break on result of EXPRESSION
B -- move to next breakpoint
g -- continue until next breakpoint
B -- continue to next breakpoint
c -- continue to breakpoints slowly
C -- continue to breakpoints fast
S -- stop continuing
G -- stop debugging and finish
P -- visit buffer before running Edebug
v -- visit buffer before running Edebug
p -- momentarily visit buffer before running Edebug
w -- move back to current point in source
C-c C-l -- move back to current point in source
C-x X w -- from any buffer, move back to current point in source
? -- help
e -- prompt for expression then evaluate
d -- show backtrace
= -- display frequencies in comments for each line for current function
a -- abort
C-] -- abort
q -- quit
Q -- quit

;; :FINDER-KEY-BINDINGS
C-h P -- list keywords
M-x `finder-commentary' RET <LIBRARY> RET -- Describe LIBRARY
? -- help
n -- move down
p -- move up
RET -- for keyword at point, list Emacs Lisp libraries
RET -- for package at point, show commentary for Emacs
f -- same as previous
SPC -- same as previous
d -- back to beginning of package directory
q -- quit

;; :C-KEY-BINDINGS

;; :ETAGS-KEY-BINDINGS
M-! etags *.[ch] -- index .c and .h files in current directory
C-u M-x `visit-tags-table' -- set index file for current buffer
M-x `visit-tags-table' -- globally set index file
M-. -- go to definition of symbol in index
C-M-. -- go to definition for a regular expression in index
C-u M-. -- go to next definition
M-- M-. -- go to previous definition
M-* -- return back to before you started
M-x `tags-search' -- go to entry for regular expression in index
M-, -- go to next entry in index
M-x `tags-query-replace' -- search and replace for regular expression
M-TAB -- complete tag at point
C-u M-TAB -- complete language symbol, avoid tags, at point

;; :GDB-KEY-BINDINGS

;; :DIFF-KEY-BINDINGS
M-x `diff' RET <OLD> RET <NEW> RET -- compare OLD file with NEW file
M-x diff RET RET -- same as previous
C-u M-x diff -- compare files but prompt for Diff switches
M-x `diff-buffer-with-file' -- compare buffer with file on disk
M-x `diff-backup' -- compare current file with backup on disk
M-x `diff-mode' -- start Diff Mode if not already started for a file
C-c C-c -- go to corresponding location in target \(new\) file
C-u C-c C-c -- go to corresponding location in source \(old\) file
C-u C-u C-c C-c -- always go to corresponding location in source file
C-c C-a -- apply current hunk
C-u C-c C-a -- revert current hunk
C-c C-t -- test current hunk
C-c C-t -- test current hunk in reverse
M-n -- move start of next hunk
M-p -- move to start of previous hunk
M-} -- move to start of next file in multiple file patch
M-{ -- move to start of previous file in multiple file patch
C-c C-n -- narrow to hunk
C-x n w -- widen
C-u C-c C-n -- narrow to file of multiple file patch
M-k -- kill the current hunk
M-K -- kill the current file in multiple file patch
C-c C-s -- split the hunk in two
C-c C-r -- reverse direction of entire patch
C-u C-c C-r -- reverse direction of patch in region
C-x 4 a -- new change log entry using context of current location
C-c C-u -- convert the entire buffer from unified to context format
C-u C-c C-u -- convert the entire buffer from context to unified format
C-c C-u -- convert the entire buffer
C-c C-e -- start ediff session

;; :VC-VERSION-CONTROL-KEY-BINDINGS
C-x v i -- register file
C-x v v -- check in or out, depending on the current state
C-c C-c -- finish editing log for check in
C-u C-x v v -- check in or out a specific revision
C-x v ~ -- open past revision in new window
C-x v = -- diff with current revision
C-u C-x v = -- diff with specific revision
C-x v l -- show log
C-x v u -- undo checkout
C-x v c -- delete the latest revision
C-x v g -- annotate file by each line showing when added and by whom
C-x v d -- show checked out files
C-x v s RET <NAME> RET -- tag all the files in directory with NAME
C-u C-x v s RET <NAME> RET -- tag files and create branch
C-x v r <NAME> -- recursively checkout files for a snapshot
C-x v a -- update ChangeLog :SEE :CHANGELOG-KEY-BINDINGS
C-x v m -- merge two revisions
C-x v h -- insert revision header keyword
M-x `vc-resolve-conflicts' -- start ediff-merge session on a file with conflict markers

;; :CHANGELOG-KEY-BINDINGS
C-x 4 a -- start new entry using context of current file
C-x 4 a -- start new entry in current log file
C-c C-p -- insert previous log from version control
M-q -- fill paragraph following syntax rules
M-x `change-log-merge' RET <FILE> RET -- merge current with log FILE
C-x v a -- generate entries from version control

;; :MERGE-CONFLICT-KEY-BINDINGS
M-x `smerge-mode' -- start Smerge Mode if not started
C-c ^ n -- move to next
C-c ^ p -- move to previous
C-c ^ b -- keep base
C-c ^ m -- keep mine
C-c ^ o -- keep other
C-c ^ RET -- keep what is under point
C-c ^ a -- keep all
C-c ^ c -- combine current with next
C-c ^ r -- auto resolve
M-x `smerge-resolve-all' -- auto resolve entire buffer

;; :GREP-KEY-BINDINGS
M-x `grep'  RET <REGEXP> SPC <FILES> RET -- show matches in FILES for REGEXP
M-x `lgrep' RET <REGEXP> RET <FILES> RET -- show matches in FILES for REGEXP
M-x lgrep RET <REGEXP> RET RET -- show matches in all C files
M-x lgrep RET <REGEXP> RET ch RET -- same as previous
M-x lgrep RET <REGEXP> RET c RET -- show matches in C source files
M-x lgrep RET <REGEXP> RET h RET -- show matches in header files
M-x lgrep RET <REGEXP> RET l RET -- show matches in ChangeLog files
M-x lgrep RET <REGEXP> RET m RET -- show matches in Make files
M-x lgrep RET <REGEXP> RET tex RET -- show matches in TeX files
M-x lgrep RET <REGEXP> RET *.html RET -- show matches in HTML files
M-x `egrep' RET <REGEXP> RET <FILES> RET -- extended regular expressions
M-x `igrep' RET <REGEXP> RET <FILES> RET -- case insensitive matching
M-x `grep-find' RET <REGEXP> RET -- show matches in entire directory tree
M-x `rgrep' RET <REGEXP> RET *.html RET RET -- same, but HTML files
M-x rgrep RET <REGEXP> RET RET RET -- same, but C files
M-x rgrep RET <REGEXP> RET el RET RET -- same, but Emacs Lisp files

;; :LOCATE-KEY-BINDINGS
M-x `locate' RET <PATTERN> RET -- show files matching PATTERN
M-x `locate-with-filter' RET <PATTERN> RET <REGEXP> -- same, but also match REGEXP
M-x locate-with-filter -- show
C-n -- next matched file
C-p -- previous matched file
RET -- visit current file at
C-o -- open file in other window
V -- open current file in dired :SEE :DIRECTORY-KEY-BINDINGS 

;; :CALENDAR-KEY-BINDINGS

;; :DIARY-KEY-BINDINGS

;; :ABBREV-KEY-BINDINGS

;; :DABBREV-KEY-BINDINGS

;; :AUTOINSERT-KEY-BINDINGS

;; :EDIFF-KEY-BINDINGS

;; :EMERGE-KEY-BINDINGS

;; :SORT-KEY-BINDINGS

;; :BROWSE-URL-KEY-BINDINGS

;; :EMAIL-KEY-BINDINGS

;; :HTML-KEY-BINDINGS
C-h m -- help
C-c C-v -- view current file in Web browser
C-c C-s -- toggle to view in Web browser on each save
C-c 8 -- toggle inserting of non-ASCII characters as entities
C-c TAB -- toggle invisibility of tags
M-x `html-imenu-index' -- add index menu to menu bar for current file
M-x `set-variable' RET `sgml-xml-mode' RET t -- turn on XHTML tags
C-c C-d -- delete current tag
C-c DEL -- delete current tag
C-u C-c C-d -- delete next 4 tags
C-c C-f -- skip forward tag
C-u 5 C-c C-f -- skip forward 5 tags
C-c C-f -- skip backward tag
C-u C-c C-f -- skip backward 4 tags
C-c C-t html RET <TITLE>  -- start file with TITLE
C-c 1 -- insert level one heading
C-c 2 -- insert level two heading
C-c 3 -- insert level three heading
C-c 4 -- insert level four heading
C-c 5 -- insert level five heading
C-c 6 -- insert level six heading
C-c RET -- insert paragraph tag
C-c / -- close paragraph tag
C-c C-j -- insert line break tag
C-c C-c - -- insert horizontal rule
C-c C-c h -- insert link
C-c C-c n -- insert page anchor
C-c C-c i -- insert image
C-c C-c o -- insert ordered list
C-c C-c u -- insert unordered list
C-c C-c i -- insert list-item
C-u M-o b -- insert bold tag
C-u M-o i -- insert italic tag
C-u M-o b -- insert bold tag
C-u M-o i -- insert italic tag
C-u M-o i -- insert underline tag
C-c C-a -- insert attributes to current tag
C-c C-t em RET -- insert emphasis tag
C-c C-t strong RET -- insert strong emphasis tag
C-c C-t code RET -- insert source code tag
C-c C-t dfn RET -- insert source code tag
C-c C-t kbd RET -- insert keyboard text tag
C-c C-t samp RET -- insert sample text tag
C-c C-t var RET -- insert sample text tag
C-c C-t pre RET -- insert preformatted text tag
C-c C-t span RET class RET <CLASS> RET -- insert span tag for text of CLASS
C-c C-t dl RET <TERM> RET RET -- insert definition list with TERM
C-c C-t table RET h RET d RET DEL RET -- insert 1-by-1 table
C-c C-t -- prompt for tag name and possible attributes, then insert
C-u 3 C-c C-t -- prompt for tag, and surround next 3 words with tag
C-1 C-c C-t -- prompt for tag, and surround next word with tag
M-- C-c C-t -- prompt for tag, and surround region with tag
C-c ? RET -- describe current tag
C-c C-n M-SPC -- insert non-breaking space entity
M-; -- insert comment
C-u M-; -- kill comment
M-x `sgml-show-context' -- display hierarchy of tags for point
M-x `sgml-validate' -- check markup with external tool

;; :OUTLINE-KEY-BINDINGS

;; :SQL-KEY-BINDINGS

;; :CALC-KEY-BINDINGS

;; :TIMECLOCK-KEY-BINDINGS
M-x `timeclock-in' -- start a project
M-x `timeclock-out' -- stop working on the current project
M-x `timeclock-when-to-leave-string' -- report time to leave
M-x `timeclock-visit-timelog' -- visit timelog file
M-x `timeclock-reread-log' -- reread timelog file after crash
M-x timeclock-reread-log -- reread timelog file after edited
M-x timeclock-reread-log -- reread timelog file after restarting emacs

;; :GAMES-KEY-BINDINGS
M-x `5x5' -- fill a 5-by-5 grid
M-x `blackbox' -- find balls in a box
M-x `doctor' -- psychoanalysis
M-x `dunnet' -- text adventure
M-x `gomoku' -- try to get 5 in a row
M-x `mpuz' -- multiplication puzzle
M-x `pong' -- classic video tennis
M-x `snake' -- eat dots but not yourself or the walls
M-x `tetris' -- stack blocks
M-x `type-break-mode' -- be told when to take breaks

;; :ANIMATION-KEY-BINDINGS
M-x `animate-birthday-present' RET <NAME> RET -- Birthday wishes to NAME
M-x `butterfly-mode' -- strike the drive platter and flip the desired bit
M-x `dissociated-press' -- scramble current text in another buffer
M-x `hanoi' -- towers of hanoi
M-x `life' -- the game of life
M-x `studlify-buffer' -- give text in buffer strange capitalization
M-x `studlify-region' -- give text in region strange capitalization
M-x `zone' -- display text tricks

#:END:REFERENCE-SHEET#")) ; :CLOSE unless
;;
;;; :TEST-ME (symbol-value '*mon-help-reference-keys*)
;;
(defvaralias '*reference-sheet-help-A-HAWLEY* '*mon-help-reference-keys*)
;;
;;;(progn (makunbound '*mon-help-reference-keys*)
;;;       (unintern '*mon-help-reference-keys*)
;;;       (makunbound '*reference-sheet-help-A-HAWLEY*)
;;;       (unintern '*reference-sheet-help-A-HAWLEY*) )

;; (assoc 'meta-tags *mon-help-mon-tags-alist*)


;;; ==============================
;;; Make variable `*mon-help-reference-keys*' self documenting.
;;; Concat the 'documentation header' onto 'doc string' snarfed from itself.
;;; Put that value as the variable-documentation property value.
;;; "I'm hungry. Maybe I'll vomit into my own mouth and eat that..."
;;; (food-p self-vomit) => t
;;; ==============================
(let ((self-puke *mon-help-reference-keys*))
  (dolist (i '(("^#:START:REFERENCE-SHEET#$" . "")
               ("^#:END:REFERENCE-SHEET#$" . "")))
    (setq self-puke (replace-regexp-in-string (car i) (cdr i) self-puke)))
  (setq self-puke
        (concat
         "*Other Emacs reference sheets fit on conveniently sized cards. This one won't.\n"
         "Instead it tries to tell you everything about doing things in Emacs.\n"
         ;; :WAS (symbol-value '*mon-help-reference-keys*)
         self-puke
         ;; :WAS *mon-help-reference-keys*
         "\n;; :TAGS-MON-LOCAL-FOR-KEY-BINDINGS\n\n"
         (mon-string-justify-left 
          (mapconcat #'identity 
                     (cadr (assoc 'meta-tags-keybindings *mon-help-mon-tags-alist*)) " ")
          68 2) 
         "\n\n:NOTE Use with `mon-help-keys-wikify' for rapid EmacsWiki-fication.\n" 
         "The list above can be kept properly escaped by evaluating:\n"
         "`mon-help-escape-for-ewiki' and `mon-help-unescape-for-ewiki' respectively.\n\n"
         ":SEE \(URL `http://www.emacswiki.org/emacs/Reference_Sheet_by_Aaron_Hawley')\n"
         ":SEE \(URL `http://www.emacswiki.org/emacs/Reference_Sheet_by_Aaron_Hawley_source'\).\n\n"
         ":SEE-ALSO `mon-help-keys', `mon-help-key-functions', `*mon-help-reference-keys*',\n"
         "`*mon-help-reference-keywords*'.\n►►►"))
    (put '*mon-help-reference-keys* 'variable-documentation self-puke))
;;
;;; :TEST-ME (describe-variable '*mon-help-reference-keys*)

;;; *mon-help-reference-keys*
;;; ==============================
;;; Function documents itself by snarfing from the variable-documentation
;;; property value of `*mon-help-reference-keys*' and putting that
;;; as the value for its own function-documentation prop.
;;; :CREATED <Timestamp: Thursday July 02, 2009 @ 05:59.17 PM - by MON KEY>
(defun mon-help-keys (&optional insertp intrp)
  (interactive "i\nP")
  (if (or insertp intrp)
      (mon-help-function-spit-doc 'mon-help-keys :insertp t)
    (message "Pass non-nil for optional arg INTRP")))
;;
(let ((mhk-put 
       (plist-get (symbol-plist '*mon-help-reference-keys*) 'variable-documentation)))
  ;; Knock of the leading var `*'.
  (setq mhk-put (substring mhk-put 1))
  (setq mhk-put (replace-regexp-in-string " `mon-help-keys',?" "" mhk-put))
  (put 'mon-help-keys 'function-documentation
       ;; :WAS (concat "" (plist-get (symbol-plist '*mon-help-reference-keys*) 'variable-documentation)))
       mhk-put))
;;
;;; :TEST-ME (mon-help-keys t)
;;; (fmakunbound 'mon-help-keys)

;;; ==============================
;;; :CREATED <Timestamp: #{2010-02-26T20:17:09-05:00Z}#{10086} - by MON KEY>
(defun mon-help-keys-wikify-anchors ()
  "Replace semicolon prefixed upcased keywords in buffer with eWiki anchored style.\n
Replaces the following:\n
  \"^;; :SOME-KEYWORD\"  -> \"||||'''[::SOME-KEYWORD]'''||\"
  \":SEE :SOME-KEYWORD\" -> \(See [[SOME-KEYWORD]]\)\n
Returns a list of the form:\n
 \(\(\":ANIMATION-KEY-BINDINGS\" \"[[ANIMATION-KEY-BINDINGS]]\"\) 
   { ... }
  \(\":TIMECLOCK-KEY-BINDINGS\" \"[[TIMECLOCK-KEY-BINDINGS]]\"\)\)\n
List is suitable for building xrefs and TOC's on emacs-wiki.\n
:NOTE These regexps create permanent visible anchors on the e-wiki. To prevent
erroneous instantiation of anchors you should map the car of return value
against symbols in the alist key mon-help-keys-keywords of
`*mon-help-reference-keywords*' to verify set union and xref consistency.\n
:CALLED-BY `mon-help-keys-wikify'\n
:SEE-ALSO `mon-help-keys-wikify', `mon-get-next-face-property-change',
`*mon-help-reference-keys*', `mon-help-escape-for-ewiki',
`mon-help-keys-wikify-anchors' `mon-help-unescape-for-ewiki', `mon-help-keys',
`mon-help-key-functions'.\n►►►"
  ;; :NOTE In loop below following regexp/replace pair works fine locally:
  ;;  ("^;; :\\([A-Z-]+\\)" . "||||'''[::" anch "]'''||")
  ;; However, calling fncn `mon-help-keys-wikify' has a regexp/replace pair:
  ;;  ("^\\(.+?\\)\\( -- \\(.*\\)\\)?$" . "||##\\1##||\\3||")
  ;; which clobbers the match pattern above. For our purposes here it is
  ;; easier to accomodate the clobbering of the latter than to pre-empt
  ;; it. What this means is we wind up performing an extra match/replace
  ;; loop over the entire set. Once with the no-op replacement in
  ;; `mon-help-keys-wikify' e.g the regexp/replace pair:
  ;;  ("^;; \\(:[A-Z-]+\\)" . ";; \\1") 
  ;; And a second time here to normalize damage done by the regexp/replace pair:
  ;;  ("^\\(.+?\\)\\( -- \\(.*\\)\\)?$" . "||##\\1##||\\3||")
  (let (mhrkk anch-ls)  
    (save-excursion
      (goto-char (buffer-end 0))
      (while (search-forward-regexp "^||##;; :\\([A-Z-]+\\)##||||" nil t)
        (let ((anch (match-string 1)))
          (progn (replace-match (concat "||||'''[::" anch "]'''||"))
                 (push  `(,(concat ":" anch)
                          ,(concat "[::" anch "]")
                          ,(concat "[[" anch "]]")) anch-ls))))
      (mapc #'(lambda (q)
                (push `(,(format " :SEE %s" q)
                         ,(format " (See [[%s]])" (substring (format "%s" q) 1)))
                      mhrkk))
            (cadr (assoc 'mon-help-keys-keywords *mon-help-reference-keywords*)))
      (setq mhrkk (nreverse mhrkk))
      (let ((case-fold-search nil))
        (dolist (see mhrkk)
          (goto-char (buffer-end 0))
          (while (search-forward-regexp (car see) nil t)
            (replace-match (cadr see) t))))
      anch-ls)))
;;
;;;  Manual:show-paren-mode
;;; [:HiddenAnchors] -> [[#HiddenAnchors]]

;;; ==============================
;;; :CREATED <Timestamp: #{2010-02-27T14:04:42-05:00Z}#{10086} - by MON KEY>
(defun mon-help-keys-wikify-heading (wikified-list heading-level heading-title)
  "Return a heading title and list of keys.
Return value is added to the head of list returned from `mon-help-keys-wikify'.
WIKIFIED-LIST is a list of the form
 (\"string\"
HEADING-LEVEL a number of the heading level depth to retrun.
HEADING-TITLE a string used for the title of the return heading.\n
:EXAMPLE\n\n(let (mhkwh `(,(
\(mon-help-keys-wikify-heading 2 \"Keybinding Table Sections\"\)\n
:SEE-ALSO .\n►►►"
  (let* ((wk-lst wikified-list)
         (lvl (if (> heading-level 4) ;; Clamp it to at most 4 levels deep.
                  (make-string 4 61) 
                  (make-string heading-level 61)))
         (hdng (concat lvl heading-title lvl "\n"))
         (key-lst (mapconcat #'(lambda (anchr-l)
                                 (concat "* " anchr-l))
                             (mapcar 'caddr (cadr wk-lst))
                             "\n")))
    (setq key-lst `(,(concat hdng key-lst)
                      ,(car wk-lst)
                      ,(cadr wk-lst)))))

;;; ==============================
;;; :COURTESY Aaaron Hawley
;;; :SEE (URL `http://www.emacswiki.org/emacs/Reference_Sheet_by_Aaron_Hawley_source')
;;; :MODIFICATIONS <Timestamp: Wednesday June 17, 2009 @ 11:31.47 AM - by MON KEY>
(defun mon-help-keys-wikify (&optional use-var insrtp intrp)
  "Return content between delimiters wikified for insertion/update to EmacsWiki.\n
Content should be delimited at top and bottom by:\n
#:START:REFERENCE-SHEET#\n
 { ... Reference-Sheet-by-Aaron-Hawley ... }\n
#:END:REFERENCE-SHEET#\n
When optional arg USE-VAR is non-nil wikifiy `*mon-help-reference-keys*' content
instead of contents of buffer from point.
When optional arg INSRTP is non-nil or called-interactively insert wikified
reference sheet at point replacing the existing region if found. When either
INSRTP or INTRP is non-nil and the delimiter can't be found use value of
`*mon-help-reference-keys*'.\n
Return value is a three elt list with the form:\n
\(\"== Some Appropiate Heading == 
  * [[SOME-KEYWORD]]
    { ... * <ANCHOR-XREF> ... }
  * [[SOME-KEYWORD-N]]\"
 \" { ... Big wikified Table sectioned by <VISIBLE-ANCHOR> ... } \"
 \(\":SOME-KEYWORD\" \"[::SOME-KEYWORD]\" \"[[SOME-KEYWORD]]\"\)
   { ... \(<KEY> <VISIBLE-ANCHOR> <ANCHOR-XREF>\) ... }
 \(\":SOME-KEYWORD-N\" \"[::SOME-KEYWORD-N]\" \"[[SOME-KEYWORD-N]]\"\)\)\n
:EXAMPLE\n\n\(mon-help-keys-wikify-TEST\)\n
:SEE (URL `http://www.emacswiki.org/emacs/Reference_Sheet_by_Aaron_Hawley_source')
:SEE (URL `http://www.emacswiki.org/emacs/PermanentAnchors')\n
:SEE-ALSO `mon-help-keys-wikify-anchors', `mon-help-keys-wikify-heading',
`*mon-help-reference-keywords*', `mon-get-next-face-property-change',
`mon-help-escape-for-ewiki', `mon-help-unescape-for-ewiki', `mon-help-keys',
`mon-help-key-functions'.\n►►►"
  (interactive "i\ni\np")
  (let (wikify-this start-at end-at in-bfr accum-anchors shw-msg)
    (save-excursion
      (unless use-var
        (search-forward-regexp "^\\(#:START:REFERENCE-SHEET#\\)$" nil t)
        (if (match-beginning 1)
            (setq start-at (match-beginning 1))
            (progn 
              (search-backward-regexp "^\\(#:START:REFERENCE-SHEET#\\)$" nil t)
              (if (match-beginning 1)
                  (setq start-at (match-beginning 1))
                  (setq use-var t)))))
      (unless use-var 
        (search-forward-regexp "^\\(#:END:REFERENCE-SHEET#\\)$" nil t)
        (if (match-beginning 1)
            (setq end-at (match-end 1))
            (progn 
              (search-backward-regexp "^\\(#:END:REFERENCE-SHEET#\\)$" nil t)
              (if (match-beginning 1)
                  (setq end-at (match-end 1))
                  (setq use-var t))))))
    (cond ((and (not use-var) start-at end-at)
           (setq wikify-this  (buffer-substring-no-properties start-at end-at)))
          ((and (or insrtp intrp) (not start-at) (not end-at))
           (setq shw-msg
                 (concat
                  ":FUNCTION `mon-help-keys-wikify' - " (if intrp " INTRP " " INSRTP ")
                  "didn't match delimited region used USE-VAR value `*mon-help-reference-keys*'"))))
    (setq in-bfr 
          ;;(with-temp-buffer
          (with-current-buffer (get-buffer-create "*TEST-MDHU*")
            (erase-buffer)
            (save-excursion
                     (if use-var
                         ;;(insert *mon-help-reference-keys*)
                         ;;(insert wikify-this)))
                         (prin1 *mon-help-reference-keys* (current-buffer))
                         (prin1 wikify-this (current-buffer))))
            ;; Parse buffer contents as a string in `emacs-lisp-mode' first to get at the 
            ;; font-lock-constant-face props with `mon-get-next-face-property-change'
            ;; Add props to get them back out post regex looping. We need to add the ewiki 
            ;; Manual:show-paren-mode links and it won't be pretty if we're not in the right
            ;; syntax-mode and properly font-locked.
            ;; grab the buffer contents to a var and regurgitate them back in with `princ'.
            ;;(emacs-lisp-mode) ;; (when (equal mode-name "Emacs-Lisp") (fundamental-mode))
            ;; (mon-get-next-face-property-change 'font-lock-constant-face from-posn)
            ;; (while (plist-conses
            ;; (add-text-properties 
            (let ((regexp-replace-list
                          '(("^\\(\"?\\)\\(#:START:REFERENCE-SHEET#\\)" . "")
                            ("^\\(#:END:REFERENCE-SHEET#\\)\\(\"?\\)" . "")
                            ;; :WAS ("^\\(.*\\):$" . "||||**\\1**||")
                            ;; :NOTE the new match is a kludge. we replace just to stay in loop.
                            ("^;; \\(:[A-Z-]+\\)" . ";; \\1")
                            ("^\\(.+?\\)\\( -- \\(.*\\)\\)?$" . "||##\\1##||\\3||")
                            ("^\n" . ""))))
                     ;;(flush-lines "^;")
                     ;;(regexpl-search-replace-list regexp-replace-list))
                     (dolist (rrl regexp-replace-list)
                       (goto-char (buffer-end 0))
                       (while (search-forward-regexp (car rrl) nil t)
                         (replace-match (cdr rrl)))))    
                   (setq accum-anchors (mon-help-keys-wikify-anchors))
                   ;;(buffer-substring-no-properties (buffer-end 0) (buffer-end 1))))
                   ;; :NOTE don't clobber the text-props we have stuff on them.
                   (buffer-substring (buffer-end 0) (buffer-end 1))))
    (setq in-bfr 
          (mon-help-keys-wikify-heading `(,in-bfr ,accum-anchors) 2 "Keybinding Table Sections"))
    (if (or intrp insrtp)
        (progn
          (when wikify-this (delete-region start-at end-at))
          (save-excursion
            (newline)
            (princ (concat (car in-bfr) "\n" (cadr in-bfr)) (current-buffer))
            (newline))
          (if shw-msg ;;(let ((warning-suppress-types '(mon-doc-help-utils)))
              (display-warning 'mon-doc-help-utils shw-msg :debug
                               (get-buffer-create "*MON-HELP-KEYS-WIKIFY*")))) ;)
        in-bfr)))
;;
;;; :TEST-ME (mon-help-keys-wikify t t)
;;
;; (search-forward-regexp "^\\(.+?\\)\\( -- \\(.*\\)\\)?$")
;; (search-forward-regexp "\\(|\\{4\\}'\\{3\\}\\[::.*]'\\{3\\}|\\{2\\}\\)")

;;; ==============================
;;; :CREATED <Timestamp: #{2010-02-27T14:32:18-05:00Z}#{10086} - by MON KEY>
(defun mon-help-keys-wikify-TEST ()
  "Test function for `mon-help-keys-wikify' helper functions.\n
Return cumulative result of evaluating:
 `mon-help-keys-wikify', `mon-help-keys-wikify-anchors'
 `mon-help-keys-wikify-heading'\n
Return value displayed in buffer named *MON-HELP-KEYS-WIKIFY-TEST*.\n
:SEE `mon-help-keys-wikify' for details of return value format.\n
:EXAMPLE\n\n(mon-help-keys-wikify-TEST)\n
:SEE-ALSO `*mon-help-reference-keywords*', `mon-help-keys',
`mon-help-escape-for-ewiki', `mon-help-unescape-for-ewiki', 
`mon-help-key-functions'.\n►►►"
  (let ((mhkwh (mon-help-keys-wikify)))
    (setq mhkwh (mon-help-keys-wikify-heading `(,(cadr mhkwh) ,(caddr mhkwh))
                                              2 "Keybinding Table Sections"))
    (with-current-buffer (get-buffer-create "*MON-HELP-KEYS-WIKIFY-TEST*")
      (erase-buffer)
      (save-excursion (prin1 mhkwh (current-buffer)))
      (pp-buffer)
      (display-buffer (current-buffer) t))))

;;; ==============================
;;; :NOTE Maybe MON remembers stealing this from Pascal Bourguignon?
;;; :MODIFICATIONS <Timestamp: Saturday May 30, 2009 @ 06:26.12 PM - by MON KEY>
(defun mon-help-escape-for-ewiki (&optional start end ref-sheet)
  "Escape special characters in the region as if a Lisp string.
Inserts backslashes in front of special characters (namely  `\' backslash,
`\"' double quote, `(' `)' parens in the region, according to the docstring escape
requirements.\n
Don't expect good results evaluation this form on strings with regexps.
:NOTE region should only contain the characters actually comprising the string
supplied without the surrounding quotes.\n
:SEE-ALSO `mon-help-unescape-for-ewiki', `mon-help-keys-wikify'
`*mon-help-reference-keys*', `*mon-help-reference-keywords*'. ►►►"
  (interactive "*r")
  (save-excursion
    (save-restriction
      (let (ref-start ref-end)
	(if ref-sheet
	   (progn
	     (search-forward-regexp "^\\(#:START:REFERENCE-SHEET#\\)$" nil t)
	     (setq ref-start  (match-beginning 1))
	     (search-forward-regexp "^\\(#:END:REFERENCE-SHEET#\\)$" nil t)
	     (setq ref-end  (match-beginning 1)))
	  (progn
	    (setq ref-start start)
	    (setq ref-end end)))
      (narrow-to-region ref-start ref-end)
      (goto-char ref-start)
      (while (search-forward "\\" nil t)
	(replace-match "\\\\" nil t))
      (goto-char ref-start)
      (while (search-forward "\"" nil t)
	(replace-match "\\\"" nil t))
      ;;MON KEY additions
      (goto-char ref-start)
      (while (search-forward "(" nil t)
	(replace-match "\\\(" nil t))
      (goto-char ref-start)
      (while (search-forward ")" nil t)
	(replace-match "\\\)" nil t))))))
;;
;;; :TEST-ME
;;; (save-excursion (let ((this-point (point)))
;;; (newline)(princ *mon-help-reference-keys* (current-buffer))
;;; (goto-char this-point)(mon-help-escape-for-ewiki nil nil t)))

;;; ==============================
;;; :NOTE Maybe MON remember stealing this from Pascal Bourguignon?
;;; :MODIFICATIONS <Timestamp: Saturday May 30, 2009 @ 06:26.12 PM - by MON KEY>
(defun mon-help-unescape-for-ewiki (&optional start end ref-sheet)
  "Unescape special characters from the CL string specified by the region.
This amounts to removing preceeding backslashes from characters they escape.\n
Don't expect good results evaluation this form on strings with regexps.
:NOTE Region should only contain the characters actually comprising the string
without the surrounding quotes.\n
:EXAMPLE
:SEE-ALSO 
`mon-help-escape-for-ewiki', `mon-help-keys-wikify',
`mon-get-next-face-property-change',
`*mon-help-reference-keys*', `*mon-help-reference-keywords*'.\n►►►"
  (interactive "*r")
  (save-excursion
    (save-restriction
      (let (ref-start ref-end)
	(if ref-sheet
	   (progn
	     (search-forward-regexp "^\\(\"#:START:REFERENCE-SHEET#\\)$" nil t)
	     (setq ref-start  (match-beginning 1))
	     (search-forward-regexp "^\\(#:END:REFERENCE-SHEET#\"\\)$" nil t)
	     (setq ref-end  (match-beginning 1)))
	  (progn
	    (setq ref-start start)
	    (setq ref-end end)))
	  (narrow-to-region ref-start ref-end)
	  (goto-char ref-start)
	  (while (search-forward "\\" nil t)
	    (replace-match "" nil t)
	    (forward-char))))))

;;; ==============================
;;; :CREATED <Timestamp: #{2010-02-26T13:39:13-05:00Z}#{10085} - by MON KEY>
;; (let ((this-point (point))
;;       (mhrk '*mon-help-reference-keys*))
;;   (with-current-buffer 
;;       (get-buffer-create (upcase (symbol-name mhrk)))
;;     (erase-buffer)
;;     (prin1 (symbol-value (intern-soft (symbol-name mhrk)))(current-buffer))
;;     (goto-char this-point)
;;;     mon-help-escape-for-ewiki
;;     (mon-help-unescape-for-ewiki (buffer-end 0) (buffer-end 1))
;;   (display-buffer (current-buffer) t)))

;;; ==============================
;;; :REQUIRES `mon-check-feature-for-loadtime' <- mon-utils.el
;;; :CREATED <Timestamp: #{2010-02-24T14:22:02-05:00Z}#{10083} - by MON KEY>
(defun mon-help-utils-loadtime ()
  "Loadtime function to pull in additional libraries after mon-doc-help-utils.\n
Following libraries pulled in by a require statement if present in load-path:\n
 mon-doc-help-pacman mon-doc-help-proprietary\n
SEE-ALSO `mon-bind-nefs-photos-at-loadtime', `mon-bind-cifs-vars-at-loadtime',
`mon-bind-doc-help-proprietery-vars-at-loadtime',
`mon-bind-iptables-vars-at-loadtime', `mon-set-register-tags-loadtime',
`mon-CL-cln-colon-swap'.\n►►►"
  (mon-check-feature-for-loadtime 'mon-doc-help-pacman) 
  ;; Load doc functions which can't possibly be GPL/GFDL e.g MS-C0RP API etc.
  (mon-check-feature-for-loadtime 'mon-doc-help-proprietary))

;;; ==============================
(provide 'mon-doc-help-utils)
;;; ==============================


;;; ================================================================
;;; mon-doc-help-utils.el ends here
;;; EOF
