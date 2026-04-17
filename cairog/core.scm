;; ── Cairog ────────────────────────────────────────────────────────────────────
;;
;; Cairo binding for Guile — Core module
;; created by zictogo <zictogo@spinodi.com>, Copyright 2026
;;
;; ──────────────────────────────────────────────────────────────────────────────

(define-module (cairog core)
  #:use-module (system foreign)
  #:export (libcairo
            cairo-version
            cairo-version-string))

(define libcairo
  (dynamic-link "libcairo"))


;; int cairo_version (void);
(define cairo-version
  (pointer->procedure int
    (dynamic-func "cairo_version" libcairo)
    '()))


;; const char* cairo_version_string (void);
(define cairo-version-string
  (pointer->procedure '*
    (dynamic-func "cairo_version_string" libcairo)
    '()))
