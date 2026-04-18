;; Pie chart — cairo-arc, cairo-line-to, cairo-close-path, cairo-fill-preserve,
;;              cairo-stroke, cairo-set-line-width
(use-modules (cairog))

(define pi (acos -1))
(define cx 128.0)
(define cy 128.0)
(define r  100.0)

(define (slice cr start end red green blue)
  (cairo-move-to cr cx cy)
  (cairo-arc cr cx cy r start end)
  (cairo-close-path cr)
  (cairo-set-source-rgb cr red green blue)
  (cairo-fill-preserve cr)
  (cairo-set-source-rgb cr 1.0 1.0 1.0)
  (cairo-stroke cr))

(let* ((surface (cairo-image-surface-create CAIRO-FORMAT-ARGB32 256 256))
       (cr      (cairo-create surface)))

  (cairo-set-source-rgb cr 0.15 0.15 0.15)
  (cairo-paint cr)
  (cairo-set-line-width cr 2.0)

  (slice cr 0.0           (* 0.5 pi)  0.9 0.3 0.3)
  (slice cr (* 0.5 pi)    (* 1.2 pi)  0.3 0.7 0.3)
  (slice cr (* 1.2 pi)    (* 1.75 pi) 0.3 0.4 0.9)
  (slice cr (* 1.75 pi)   (* 2.0 pi)  0.9 0.8 0.2)

  (cairo-surface-write-to-png surface "/tmp/pie.png")
  (cairo-destroy cr)
  (cairo-surface-destroy surface))
