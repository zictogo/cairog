;; ── Cairog ────────────────────────────────────────────────────────────────────
;;
;; Cairo binding for Guile — Surface module
;; created by zictogo <zictogo@spinodi.com>, Copyright 2026
;;
;; ──────────────────────────────────────────────────────────────────────────────

(define-module (cairog surface)
  #:use-module (system foreign)
  #:use-module (cairog core)
  #:use-module (cairog types)
  #:export (cairo-image-surface-create
            cairo-surface-destroy
            cairo-surface-status
            cairo-surface-write-to-png))


;; cairo_surface_t * cairo_image_surface_create (cairo_format_t format, int width, int height);
(define %cairo-image-surface-create
  (pointer->procedure '*
    (dynamic-func "cairo_image_surface_create" libcairo)
    (list int int int)))

(define (cairo-image-surface-create format width height)
  (make-surface (%cairo-image-surface-create format width height)))


;; void cairo_surface_destroy (cairo_surface_t *surface);
(define %cairo-surface-destroy
  (pointer->procedure void
    (dynamic-func "cairo_surface_destroy" libcairo)
    (list '*)))

(define (cairo-surface-destroy surface)
  (%cairo-surface-destroy (surface-pointer surface)))


;; cairo_status_t cairo_surface_status (cairo_surface_t *surface);
(define %cairo-surface-status
  (pointer->procedure int
    (dynamic-func "cairo_surface_status" libcairo)
    (list '*)))

(define (cairo-surface-status surface)
  (%cairo-surface-status (surface-pointer surface)))


;; cairo_status_t cairo_surface_write_to_png (cairo_surface_t *surface, const char *filename);
(define %cairo-surface-write-to-png
  (pointer->procedure int
    (dynamic-func "cairo_surface_write_to_png" libcairo)
    (list '* '*)))

(define (cairo-surface-write-to-png surface filename)
  (%cairo-surface-write-to-png
    (surface-pointer surface)
    (string->pointer filename)))
