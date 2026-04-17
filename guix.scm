(use-modules (guix packages)
             (guix git-download)
             (guix build-system gnu)
             (gnu packages guile)
             (gnu packages cairo)
             (gnu packages pkg-config)
             (gnu packages autotools)
             ((guix licenses) #:prefix license:))

(define %version
  (string-trim-right
   (call-with-input-file
       (in-vicinity (dirname (current-filename)) "VERSION")
     read-line)))

(package
  (name "cairog")
  (version %version)
  (source (local-file "." "cairog-checkout"
                      #:recursive? #t
                      #:select? (git-predicate ".")))
  (build-system gnu-build-system)
  (arguments
   '(#:phases
     (modify-phases %standard-phases
       (add-before 'configure 'bootstrap
         (lambda _ (invoke "sh" "bootstrap"))))))
  (inputs (list guile-3.0 cairo))
  (native-inputs (list autoconf automake pkg-config))
  (synopsis "Cairo 2D graphics binding for GNU Guile")
  (description
   "Cairog exposes the Cairo vector graphics library to GNU Guile \
through the foreign function interface (FFI).  It provides bindings \
for drawing contexts, image surfaces, path construction, and PNG export.")
  (home-page "https://github.com/zictogo/cairog")
  (license license:gpl3+))
