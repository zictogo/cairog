;; Save/restore graphics state — cairo-save, cairo-restore,
;;                                cairo-set-line-width, cairo-stroke, cairo-fill
;; Draws three stroked circles, each with an isolated graphics state.
(use-modules (cairog))

(define pi (acos -1))

(define (circle cr x y radius r g b line-width)
  (cairo-save cr)
  (cairo-set-source-rgba cr r g b 0.7)
  (cairo-set-line-width cr line-width)
  (cairo-arc cr x y radius 0.0 (* 2 pi))
  (cairo-fill-preserve cr)
  (cairo-set-source-rgb cr r g b)
  (cairo-stroke cr)
  (cairo-restore cr))

(let* ((surface (cairo-image-surface-create CAIRO-FORMAT-ARGB32 256 256))
       (cr      (cairo-create surface)))

  (cairo-set-source-rgb cr 0.15 0.15 0.15)
  (cairo-paint cr)

  (circle cr  90.0  90.0 60.0  0.9 0.2 0.2  3.0)
  (circle cr 166.0  90.0 60.0  0.2 0.8 0.2  3.0)
  (circle cr 128.0 166.0 60.0  0.2 0.2 0.9  3.0)

  (cairo-surface-write-to-png surface "/tmp/save-restore.png")
  (cairo-destroy cr)
  (cairo-surface-destroy surface))
