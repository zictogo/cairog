;; Filled circle
(use-modules (cairog))

(define pi (acos -1))

(let* ((surface (cairo-image-surface-create CAIRO-FORMAT-ARGB32 256 256))
       (cr      (cairo-create surface)))

  (cairo-set-source-rgb cr 1.0 1.0 1.0)
  (cairo-paint cr)

  (cairo-set-source-rgb cr 0.2 0.4 0.8)
  (cairo-arc cr 128.0 128.0 80.0 0.0 (* 2 pi))
  (cairo-fill cr)

  (cairo-surface-write-to-png surface "/tmp/circle.png")
  (cairo-destroy cr)
  (cairo-surface-destroy surface))
