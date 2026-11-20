;; extends
; Gruvbox Flutter: extra captures so Neovim matches the VS Code Dart grammar.

; import/export URIs are green (themes/overrides.json "Dart: import/export URIs")
((uri (string_literal) @string.special.url)
  (#set! priority 101))

; void is storage.type.primitive.dart (red), not a class type
((void_type) @type.builtin
  (#set! priority 101))

; `is` / `is!` are keyword.operator.dart (orange)
((is_operator) @keyword.operator
  (#set! priority 101))
((is_operator "is" @keyword.operator)
  (#set! priority 101))

; only the member-access dot is grey (punctuation.dot.dart)
(["." "?."] @punctuation.delimiter.dot
  (#set! priority 101))
