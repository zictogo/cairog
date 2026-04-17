(use-modules (srfi srfi-64)
             (system foreign)
             (cairog core))

(test-begin "cairog-core")

(test-assert "libcairo loaded and cairo_version symbol resolvable"
  (not (null-pointer? (dynamic-func "cairo_version" libcairo))))

(test-assert "cairo-version returns a positive integer"
  (let ((v (cairo-version)))
    (and (integer? v) (> v 0))))

(test-assert "cairo-version-string returns a non-empty string"
  (let ((s (pointer->string (cairo-version-string))))
    (and (string? s) (> (string-length s) 0))))

(test-end "cairog-core")
