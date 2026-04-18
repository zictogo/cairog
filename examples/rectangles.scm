;; Overlapping rectangles — cairo-rectangle, cairo-fill-preserve, cairo-stroke,
;;                           cairo-set-source-rgba, cairo-set-line-width
(use-modules (cairog))

(let* ((surface (cairo-image-surface-create CAIRO-FORMAT-ARGB32 256 256))
       (cr      (cairo-create surface)))

  (cairo-set-source-rgb cr 1.0 1.0 1.0)
  (cairo-paint cr)

  (cairo-set-line-width cr 3.0)

  (cairo-set-source-rgba cr 0.8 0.2 0.2 0.7)
  (cairo-rectangle cr 20.0 20.0 140.0 140.0)
  (cairo-fill-preserve cr)
  (cairo-set-source-rgb cr 0.4 0.0 0.0)
  (cairo-stroke cr)

  (cairo-set-source-rgba cr 0.2 0.2 0.8 0.7)
  (cairo-rectangle cr 96.0 96.0 140.0 140.0)
  (cairo-fill-preserve cr)
  (cairo-set-source-rgb cr 0.0 0.0 0.4)
  (cairo-stroke cr)

  (cairo-surface-write-to-png surface "/tmp/rectangles.png")
  (cairo-destroy cr)
  (cairo-surface-destroy surface))
