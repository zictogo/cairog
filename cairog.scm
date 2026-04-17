;; ── Cairog ────────────────────────────────────────────────────────────────────
;;
;; Cairo binding for Guile — top-level re-export module
;; created by zictogo <zictogo@spinodi.com>, Copyright 2026
;;
;; Usage: (use-modules (cairog))
;;
;; ──────────────────────────────────────────────────────────────────────────────

(define-module (cairog))

(use-modules (cairog core)
             (cairog types)
             (cairog surface)
             (cairog context))

(let ((this (current-module)))
  (for-each (lambda (mod-name)
              (let ((iface (resolve-interface mod-name)))
                (module-for-each
                 (lambda (sym var)
                   (module-re-export! this (list sym)))
                 iface)))
            '((cairog core)
              (cairog types)
              (cairog surface)
              (cairog context))))
