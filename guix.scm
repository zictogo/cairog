(use-modules (ice-9 rdelim)
             (guix gexp)
             (guix packages)
             (guix git-download)
             (guix build-system gnu)
             (gnu packages guile)
             (gnu packages gtk)
             (gnu packages pkg-config)
             (gnu packages autotools)
             (gnu packages texinfo)
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
   `(#:phases
     (modify-phases %standard-phases
       (add-before 'configure 'bootstrap
         (lambda _ (invoke "sh" "bootstrap")))
       (add-before 'build 'set-library-path
         (lambda* (#:key inputs #:allow-other-keys)
           (setenv "LD_LIBRARY_PATH"
                   (string-append (assoc-ref inputs "cairo") "/lib")))))))
  (inputs (list guile-3.0 cairo))
  (native-inputs (list autoconf automake pkg-config texinfo))
  (synopsis "Cairo 2D graphics binding for GNU Guile")
  (description
   "Cairog exposes the Cairo vector graphics library to GNU Guile \
through the foreign function interface (FFI).  It provides bindings \
for drawing contexts, image surfaces, path construction, and PNG export.")
  (home-page "https://github.com/zictogo/cairog")
  (license license:gpl3+))
