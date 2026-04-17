(use-modules (srfi srfi-64)
             (cairog types)
             (cairog surface)
             (cairog context))

(test-begin "cairog-context")

;; ── Lifecycle ─────────────────────────────────────────────────────────────────

(test-assert "cairo-create returns a <cairo>"
  (let* ((surface (cairo-image-surface-create CAIRO-FORMAT-ARGB32 120 120))
         (cr      (cairo-create surface)))
    (let ((ok (cairo? cr)))
      (cairo-destroy cr)
      (cairo-surface-destroy surface)
      ok)))

(test-equal "cairo-status is SUCCESS after normal create"
  CAIRO-STATUS-SUCCESS
  (let* ((surface (cairo-image-surface-create CAIRO-FORMAT-ARGB32 120 120))
         (cr      (cairo-create surface))
         (status  (cairo-status cr)))
    (cairo-destroy cr)
    (cairo-surface-destroy surface)
    status))

(test-equal "cairo-save and cairo-restore do not corrupt status"
  CAIRO-STATUS-SUCCESS
  (let* ((surface (cairo-image-surface-create CAIRO-FORMAT-ARGB32 64 64))
         (cr      (cairo-create surface)))
    (cairo-save cr)
    (cairo-set-source-rgb cr 1.0 0.0 0.0)
    (cairo-restore cr)
    (let ((status (cairo-status cr)))
      (cairo-destroy cr)
      (cairo-surface-destroy surface)
      status)))

;; ── Source ────────────────────────────────────────────────────────────────────

(test-equal "cairo-set-source-rgb does not set error"
  CAIRO-STATUS-SUCCESS
  (let* ((surface (cairo-image-surface-create CAIRO-FORMAT-ARGB32 64 64))
         (cr      (cairo-create surface)))
    (cairo-set-source-rgb cr 0.2 0.4 0.6)
    (let ((status (cairo-status cr)))
      (cairo-destroy cr)
      (cairo-surface-destroy surface)
      status)))

(test-equal "cairo-set-source-rgba does not set error"
  CAIRO-STATUS-SUCCESS
  (let* ((surface (cairo-image-surface-create CAIRO-FORMAT-ARGB32 64 64))
         (cr      (cairo-create surface)))
    (cairo-set-source-rgba cr 1.0 0.5 0.0 0.75)
    (let ((status (cairo-status cr)))
      (cairo-destroy cr)
      (cairo-surface-destroy surface)
      status)))

;; ── State ─────────────────────────────────────────────────────────────────────

(test-equal "cairo-set-line-width does not set error"
  CAIRO-STATUS-SUCCESS
  (let* ((surface (cairo-image-surface-create CAIRO-FORMAT-ARGB32 64 64))
         (cr      (cairo-create surface)))
    (cairo-set-line-width cr 3.5)
    (let ((status (cairo-status cr)))
      (cairo-destroy cr)
      (cairo-surface-destroy surface)
      status)))

(test-equal "cairo-set-operator with OVER does not set error"
  CAIRO-STATUS-SUCCESS
  (let* ((surface (cairo-image-surface-create CAIRO-FORMAT-ARGB32 64 64))
         (cr      (cairo-create surface)))
    (cairo-set-operator cr CAIRO-OPERATOR-OVER)
    (let ((status (cairo-status cr)))
      (cairo-destroy cr)
      (cairo-surface-destroy surface)
      status)))

;; ── Drawing verbs ─────────────────────────────────────────────────────────────

(test-equal "cairo-paint does not set error"
  CAIRO-STATUS-SUCCESS
  (let* ((surface (cairo-image-surface-create CAIRO-FORMAT-ARGB32 64 64))
         (cr      (cairo-create surface)))
    (cairo-set-source-rgb cr 1.0 1.0 1.0)
    (cairo-paint cr)
    (let ((status (cairo-status cr)))
      (cairo-destroy cr)
      (cairo-surface-destroy surface)
      status)))

(test-equal "cairo-paint-with-alpha does not set error"
  CAIRO-STATUS-SUCCESS
  (let* ((surface (cairo-image-surface-create CAIRO-FORMAT-ARGB32 64 64))
         (cr      (cairo-create surface)))
    (cairo-set-source-rgb cr 0.0 0.0 1.0)
    (cairo-paint-with-alpha cr 0.5)
    (let ((status (cairo-status cr)))
      (cairo-destroy cr)
      (cairo-surface-destroy surface)
      status)))

(test-equal "cairo-fill does not set error"
  CAIRO-STATUS-SUCCESS
  (let* ((surface (cairo-image-surface-create CAIRO-FORMAT-ARGB32 64 64))
         (cr      (cairo-create surface)))
    (cairo-set-source-rgb cr 0.0 0.0 0.0)
    (cairo-rectangle cr 5.0 5.0 50.0 50.0)
    (cairo-fill cr)
    (let ((status (cairo-status cr)))
      (cairo-destroy cr)
      (cairo-surface-destroy surface)
      status)))

(test-equal "cairo-fill-preserve keeps path and does not set error"
  CAIRO-STATUS-SUCCESS
  (let* ((surface (cairo-image-surface-create CAIRO-FORMAT-ARGB32 64 64))
         (cr      (cairo-create surface)))
    (cairo-set-source-rgb cr 0.0 1.0 0.0)
    (cairo-rectangle cr 5.0 5.0 50.0 50.0)
    (cairo-fill-preserve cr)
    (cairo-set-source-rgb cr 0.0 0.0 0.0)
    (cairo-set-line-width cr 1.0)
    (cairo-stroke cr)
    (let ((status (cairo-status cr)))
      (cairo-destroy cr)
      (cairo-surface-destroy surface)
      status)))

(test-equal "cairo-stroke does not set error"
  CAIRO-STATUS-SUCCESS
  (let* ((surface (cairo-image-surface-create CAIRO-FORMAT-ARGB32 64 64))
         (cr      (cairo-create surface)))
    (cairo-set-source-rgb cr 0.0 0.0 0.0)
    (cairo-set-line-width cr 2.0)
    (cairo-rectangle cr 5.0 5.0 50.0 50.0)
    (cairo-stroke cr)
    (let ((status (cairo-status cr)))
      (cairo-destroy cr)
      (cairo-surface-destroy surface)
      status)))

(test-equal "cairo-stroke-preserve keeps path and does not set error"
  CAIRO-STATUS-SUCCESS
  (let* ((surface (cairo-image-surface-create CAIRO-FORMAT-ARGB32 64 64))
         (cr      (cairo-create surface)))
    (cairo-set-source-rgb cr 1.0 0.0 0.0)
    (cairo-set-line-width cr 1.5)
    (cairo-rectangle cr 10.0 10.0 40.0 40.0)
    (cairo-stroke-preserve cr)
    (cairo-set-source-rgba cr 0.0 0.0 1.0 0.5)
    (cairo-fill cr)
    (let ((status (cairo-status cr)))
      (cairo-destroy cr)
      (cairo-surface-destroy surface)
      status)))

;; ── Path construction ─────────────────────────────────────────────────────────

(test-equal "cairo-move-to and cairo-line-to do not set error"
  CAIRO-STATUS-SUCCESS
  (let* ((surface (cairo-image-surface-create CAIRO-FORMAT-ARGB32 64 64))
         (cr      (cairo-create surface)))
    (cairo-set-source-rgb cr 0.0 0.0 0.0)
    (cairo-set-line-width cr 1.0)
    (cairo-move-to cr 0.0 0.0)
    (cairo-line-to cr 64.0 64.0)
    (cairo-stroke cr)
    (let ((status (cairo-status cr)))
      (cairo-destroy cr)
      (cairo-surface-destroy surface)
      status)))

(test-equal "cairo-rel-move-to and cairo-rel-line-to do not set error"
  CAIRO-STATUS-SUCCESS
  (let* ((surface (cairo-image-surface-create CAIRO-FORMAT-ARGB32 64 64))
         (cr      (cairo-create surface)))
    (cairo-set-source-rgb cr 0.0 0.0 0.0)
    (cairo-set-line-width cr 1.0)
    (cairo-move-to cr 10.0 10.0)
    (cairo-rel-move-to cr 5.0 5.0)
    (cairo-rel-line-to cr 20.0 0.0)
    (cairo-stroke cr)
    (let ((status (cairo-status cr)))
      (cairo-destroy cr)
      (cairo-surface-destroy surface)
      status)))

(test-equal "cairo-arc does not set error"
  CAIRO-STATUS-SUCCESS
  (let* ((surface (cairo-image-surface-create CAIRO-FORMAT-ARGB32 64 64))
         (cr      (cairo-create surface)))
    (cairo-set-source-rgb cr 0.0 0.0 0.0)
    (cairo-set-line-width cr 1.0)
    (cairo-arc cr 32.0 32.0 20.0 0.0 (* 2 3.14159265))
    (cairo-stroke cr)
    (let ((status (cairo-status cr)))
      (cairo-destroy cr)
      (cairo-surface-destroy surface)
      status)))

(test-equal "cairo-arc-negative does not set error"
  CAIRO-STATUS-SUCCESS
  (let* ((surface (cairo-image-surface-create CAIRO-FORMAT-ARGB32 64 64))
         (cr      (cairo-create surface)))
    (cairo-set-source-rgb cr 0.0 0.0 0.0)
    (cairo-set-line-width cr 1.0)
    (cairo-arc-negative cr 32.0 32.0 20.0 (* 2 3.14159265) 0.0)
    (cairo-stroke cr)
    (let ((status (cairo-status cr)))
      (cairo-destroy cr)
      (cairo-surface-destroy surface)
      status)))

(test-equal "cairo-close-path does not set error"
  CAIRO-STATUS-SUCCESS
  (let* ((surface (cairo-image-surface-create CAIRO-FORMAT-ARGB32 64 64))
         (cr      (cairo-create surface)))
    (cairo-set-source-rgb cr 0.0 0.0 0.0)
    (cairo-set-line-width cr 1.0)
    (cairo-move-to cr 10.0 10.0)
    (cairo-line-to cr 50.0 10.0)
    (cairo-line-to cr 30.0 50.0)
    (cairo-close-path cr)
    (cairo-stroke cr)
    (let ((status (cairo-status cr)))
      (cairo-destroy cr)
      (cairo-surface-destroy surface)
      status)))

;; ── End-to-end ────────────────────────────────────────────────────────────────

(test-assert "full drawing pipeline produces a valid PNG"
  (let* ((surface  (cairo-image-surface-create CAIRO-FORMAT-ARGB32 120 120))
         (cr       (cairo-create surface))
         (filename "/tmp/cairog-context-test.png"))

    (cairo-set-source-rgb cr 1.0 1.0 1.0)
    (cairo-paint cr)

    (cairo-set-source-rgb cr 0.0 0.0 0.0)
    (cairo-rectangle cr 10.0 10.0 100.0 100.0)
    (cairo-fill cr)

    (cairo-set-source-rgba cr 1.0 0.0 0.0 0.8)
    (cairo-set-line-width cr 2.0)
    (cairo-rectangle cr 20.0 20.0 80.0 80.0)
    (cairo-stroke cr)

    (let ((status (cairo-surface-write-to-png surface filename)))
      (cairo-destroy cr)
      (cairo-surface-destroy surface)
      (and (= status CAIRO-STATUS-SUCCESS)
           (file-exists? filename)))))

(test-end "cairog-context")
