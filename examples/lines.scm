;; Polyline with stroke
(use-modules (cairog))

(let* ((surface (cairo-image-surface-create CAIRO-FORMAT-ARGB32 256 256))
       (cr      (cairo-create surface)))

  (cairo-set-source-rgb cr 1.0 1.0 1.0)
  (cairo-paint cr)

  (cairo-set-source-rgb cr 0.8 0.2 0.1)
  (cairo-set-line-width cr 4.0)

  (cairo-move-to cr 20.0 20.0)
  (cairo-line-to cr 236.0 20.0)
  (cairo-rel-line-to cr 0.0 216.0)
  (cairo-line-to cr 20.0 236.0)
  (cairo-close-path cr)
  (cairo-stroke cr)

  (cairo-surface-write-to-png surface "/tmp/lines.png")
  (cairo-destroy cr)
  (cairo-surface-destroy surface))
