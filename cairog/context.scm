;; ── Cairog ────────────────────────────────────────────────────────────────────
;;
;; Cairo binding for Guile — Context module
;; created by zictogo <zictogo@spinodi.com>, Copyright 2026
;;
;; ──────────────────────────────────────────────────────────────────────────────

(define-module (cairog context)
  #:use-module (system foreign)
  #:use-module (cairog core)
  #:use-module (cairog types)
  #:export (;; Lifecycle
            cairo-create
            cairo-destroy
            cairo-status
            cairo-save
            cairo-restore
            ;; Source
            cairo-set-source-rgb
            cairo-set-source-rgba
            ;; State
            cairo-set-line-width
            cairo-set-operator
            ;; Drawing verbs
            cairo-paint
            cairo-paint-with-alpha
            cairo-stroke
            cairo-stroke-preserve
            cairo-fill
            cairo-fill-preserve
            ;; Path verbs
            cairo-move-to
            cairo-rel-move-to
            cairo-line-to
            cairo-rel-line-to
            cairo-rectangle
            cairo-arc
            cairo-arc-negative
            cairo-close-path))


;; ── Lifecycle ─────────────────────────────────────────────────────────────────

;; cairo_t * cairo_create (cairo_surface_t *target);
(define %cairo-create
  (pointer->procedure '*
    (dynamic-func "cairo_create" libcairo)
    (list '*)))

(define (cairo-create surface)
  (make-cairo (%cairo-create (surface-pointer surface))))


;; void cairo_destroy (cairo_t *cr);
(define %cairo-destroy
  (pointer->procedure void
    (dynamic-func "cairo_destroy" libcairo)
    (list '*)))

(define (cairo-destroy cr)
  (%cairo-destroy (cairo-pointer cr)))


;; cairo_status_t cairo_status (cairo_t *cr);
(define %cairo-status
  (pointer->procedure int
    (dynamic-func "cairo_status" libcairo)
    (list '*)))

(define (cairo-status cr)
  (%cairo-status (cairo-pointer cr)))


;; void cairo_save (cairo_t *cr);
(define %cairo-save
  (pointer->procedure void
    (dynamic-func "cairo_save" libcairo)
    (list '*)))

(define (cairo-save cr)
  (%cairo-save (cairo-pointer cr)))


;; void cairo_restore (cairo_t *cr);
(define %cairo-restore
  (pointer->procedure void
    (dynamic-func "cairo_restore" libcairo)
    (list '*)))

(define (cairo-restore cr)
  (%cairo-restore (cairo-pointer cr)))


;; ── Source ────────────────────────────────────────────────────────────────────

;; void cairo_set_source_rgb (cairo_t *cr, double red, double green, double blue);
(define %cairo-set-source-rgb
  (pointer->procedure void
    (dynamic-func "cairo_set_source_rgb" libcairo)
    (list '* double double double)))

(define (cairo-set-source-rgb cr r g b)
  (%cairo-set-source-rgb (cairo-pointer cr) r g b))


;; void cairo_set_source_rgba (cairo_t *cr, double red, double green, double blue, double alpha);
(define %cairo-set-source-rgba
  (pointer->procedure void
    (dynamic-func "cairo_set_source_rgba" libcairo)
    (list '* double double double double)))

(define (cairo-set-source-rgba cr r g b a)
  (%cairo-set-source-rgba (cairo-pointer cr) r g b a))


;; ── State ─────────────────────────────────────────────────────────────────────

;; void cairo_set_line_width (cairo_t *cr, double width);
(define %cairo-set-line-width
  (pointer->procedure void
    (dynamic-func "cairo_set_line_width" libcairo)
    (list '* double)))

(define (cairo-set-line-width cr width)
  (%cairo-set-line-width (cairo-pointer cr) width))


;; void cairo_set_operator (cairo_t *cr, cairo_operator_t op);
(define %cairo-set-operator
  (pointer->procedure void
    (dynamic-func "cairo_set_operator" libcairo)
    (list '* int)))

(define (cairo-set-operator cr operator)
  (%cairo-set-operator (cairo-pointer cr) operator))


;; ── Drawing verbs ─────────────────────────────────────────────────────────────

;; void cairo_paint (cairo_t *cr);
(define %cairo-paint
  (pointer->procedure void
    (dynamic-func "cairo_paint" libcairo)
    (list '*)))

(define (cairo-paint cr)
  (%cairo-paint (cairo-pointer cr)))


;; void cairo_paint_with_alpha (cairo_t *cr, double alpha);
(define %cairo-paint-with-alpha
  (pointer->procedure void
    (dynamic-func "cairo_paint_with_alpha" libcairo)
    (list '* double)))

(define (cairo-paint-with-alpha cr alpha)
  (%cairo-paint-with-alpha (cairo-pointer cr) alpha))


;; void cairo_stroke (cairo_t *cr);
(define %cairo-stroke
  (pointer->procedure void
    (dynamic-func "cairo_stroke" libcairo)
    (list '*)))

(define (cairo-stroke cr)
  (%cairo-stroke (cairo-pointer cr)))


;; void cairo_stroke_preserve (cairo_t *cr);
(define %cairo-stroke-preserve
  (pointer->procedure void
    (dynamic-func "cairo_stroke_preserve" libcairo)
    (list '*)))

(define (cairo-stroke-preserve cr)
  (%cairo-stroke-preserve (cairo-pointer cr)))


;; void cairo_fill (cairo_t *cr);
(define %cairo-fill
  (pointer->procedure void
    (dynamic-func "cairo_fill" libcairo)
    (list '*)))

(define (cairo-fill cr)
  (%cairo-fill (cairo-pointer cr)))


;; void cairo_fill_preserve (cairo_t *cr);
(define %cairo-fill-preserve
  (pointer->procedure void
    (dynamic-func "cairo_fill_preserve" libcairo)
    (list '*)))

(define (cairo-fill-preserve cr)
  (%cairo-fill-preserve (cairo-pointer cr)))


;; ── Path verbs ────────────────────────────────────────────────────────────────

;; void cairo_move_to (cairo_t *cr, double x, double y);
(define %cairo-move-to
  (pointer->procedure void
    (dynamic-func "cairo_move_to" libcairo)
    (list '* double double)))

(define (cairo-move-to cr x y)
  (%cairo-move-to (cairo-pointer cr) x y))


;; void cairo_rel_move_to (cairo_t *cr, double dx, double dy);
(define %cairo-rel-move-to
  (pointer->procedure void
    (dynamic-func "cairo_rel_move_to" libcairo)
    (list '* double double)))

(define (cairo-rel-move-to cr dx dy)
  (%cairo-rel-move-to (cairo-pointer cr) dx dy))


;; void cairo_line_to (cairo_t *cr, double x, double y);
(define %cairo-line-to
  (pointer->procedure void
    (dynamic-func "cairo_line_to" libcairo)
    (list '* double double)))

(define (cairo-line-to cr x y)
  (%cairo-line-to (cairo-pointer cr) x y))


;; void cairo_rel_line_to (cairo_t *cr, double dx, double dy);
(define %cairo-rel-line-to
  (pointer->procedure void
    (dynamic-func "cairo_rel_line_to" libcairo)
    (list '* double double)))

(define (cairo-rel-line-to cr dx dy)
  (%cairo-rel-line-to (cairo-pointer cr) dx dy))


;; void cairo_rectangle (cairo_t *cr, double x, double y, double width, double height);
(define %cairo-rectangle
  (pointer->procedure void
    (dynamic-func "cairo_rectangle" libcairo)
    (list '* double double double double)))

(define (cairo-rectangle cr x y width height)
  (%cairo-rectangle (cairo-pointer cr) x y width height))


;; void cairo_arc (cairo_t *cr, double xc, double yc, double radius, double angle1, double angle2);
(define %cairo-arc
  (pointer->procedure void
    (dynamic-func "cairo_arc" libcairo)
    (list '* double double double double double)))

(define (cairo-arc cr xc yc radius angle1 angle2)
  (%cairo-arc (cairo-pointer cr) xc yc radius angle1 angle2))


;; void cairo_arc_negative (cairo_t *cr, double xc, double yc, double radius, double angle1, double angle2);
(define %cairo-arc-negative
  (pointer->procedure void
    (dynamic-func "cairo_arc_negative" libcairo)
    (list '* double double double double double)))

(define (cairo-arc-negative cr xc yc radius angle1 angle2)
  (%cairo-arc-negative (cairo-pointer cr) xc yc radius angle1 angle2))


;; void cairo_close_path (cairo_t *cr);
(define %cairo-close-path
  (pointer->procedure void
    (dynamic-func "cairo_close_path" libcairo)
    (list '*)))

(define (cairo-close-path cr)
  (%cairo-close-path (cairo-pointer cr)))
