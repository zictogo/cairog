(use-modules (srfi srfi-64)
             (cairog))

(test-begin "cairog-surface")

(test-assert "cairo-image-surface-create returns a <cairo-surface>"
  (let* ((surface (cairo-image-surface-create CAIRO-FORMAT-ARGB32 120 120)))
    (let ((ok (surface? surface)))
      (cairo-surface-destroy surface)
      ok)))

(test-equal "cairo-surface-status is SUCCESS after normal creation"
  CAIRO-STATUS-SUCCESS
  (let* ((surface (cairo-image-surface-create CAIRO-FORMAT-ARGB32 120 120))
         (status  (cairo-surface-status surface)))
    (cairo-surface-destroy surface)
    status))

(test-assert "cairo-surface-write-to-png writes a file"
  (let* ((surface  (cairo-image-surface-create CAIRO-FORMAT-ARGB32 120 120))
         (filename "/tmp/cairog-surface-test.png")
         (status   (cairo-surface-write-to-png surface filename)))
    (cairo-surface-destroy surface)
    (and (= status CAIRO-STATUS-SUCCESS)
         (file-exists? filename))))

(test-end "cairog-surface")
