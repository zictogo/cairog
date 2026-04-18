;; ── Cairog ────────────────────────────────────────────────────────────────────
;;
;; Cairo binding for Guile — top-level re-export module
;; created by zictogo <zictogo@spinodi.com>, Copyright 2026
;;
;; ──────────────────────────────────────────────────────────────────────────────

(define-module (cairog))

(use-modules (cairog core)
             (cairog types)
             (cairog surface)
             (cairog context))

(for-each
  (lambda (m)
    (module-re-export! (current-module)
                       (module-map (lambda (sym var) sym)
                                   (resolve-interface m))))
  '((cairog core) (cairog types) (cairog surface) (cairog context)))
