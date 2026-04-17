;; ── Cairog ────────────────────────────────────────────────────────────────────
;;
;; Cairo binding for Guile — Type module
;; created by zictogo <zictogo@spinodi.com>, Copyright 2026
;;
;; ──────────────────────────────────────────────────────────────────────────────

(define-module (cairog types)
  #:use-module (srfi srfi-9)
  #:use-module (system foreign)
  #:export (
    ;; Opaque pointer wrappers — currently implemented
    make-cairo              cairo?              cairo-pointer
    make-surface            surface?            surface-pointer

    ;; cairo_status_t — returned by most API functions
    CAIRO-STATUS-SUCCESS
    CAIRO-STATUS-NO-MEMORY
    CAIRO-STATUS-INVALID-RESTORE
    CAIRO-STATUS-INVALID-POP-GROUP
    CAIRO-STATUS-NO-CURRENT-POINT
    CAIRO-STATUS-INVALID-MATRIX
    CAIRO-STATUS-INVALID-STATUS
    CAIRO-STATUS-NULL-POINTER
    CAIRO-STATUS-INVALID-STRING
    CAIRO-STATUS-INVALID-PATH-DATA
    CAIRO-STATUS-READ-ERROR
    CAIRO-STATUS-WRITE-ERROR
    CAIRO-STATUS-SURFACE-FINISHED
    CAIRO-STATUS-SURFACE-TYPE-MISMATCH
    CAIRO-STATUS-PATTERN-TYPE-MISMATCH
    CAIRO-STATUS-INVALID-CONTENT
    CAIRO-STATUS-INVALID-FORMAT
    CAIRO-STATUS-INVALID-VISUAL
    CAIRO-STATUS-FILE-NOT-FOUND
    CAIRO-STATUS-INVALID-DASH
    CAIRO-STATUS-INVALID-DSC-COMMENT
    CAIRO-STATUS-INVALID-INDEX
    CAIRO-STATUS-CLIP-NOT-REPRESENTABLE
    CAIRO-STATUS-TEMP-FILE-ERROR
    CAIRO-STATUS-INVALID-STRIDE
    CAIRO-STATUS-FONT-TYPE-MISMATCH
    CAIRO-STATUS-USER-FONT-IMMUTABLE
    CAIRO-STATUS-USER-FONT-ERROR
    CAIRO-STATUS-NEGATIVE-COUNT
    CAIRO-STATUS-INVALID-CLUSTERS
    CAIRO-STATUS-INVALID-SLANT
    CAIRO-STATUS-INVALID-WEIGHT
    CAIRO-STATUS-INVALID-SIZE
    CAIRO-STATUS-USER-FONT-NOT-IMPLEMENTED
    CAIRO-STATUS-DEVICE-TYPE-MISMATCH
    CAIRO-STATUS-DEVICE-ERROR
    CAIRO-STATUS-INVALID-MESH-CONSTRUCTION
    CAIRO-STATUS-DEVICE-FINISHED
    CAIRO-STATUS-JBIG2-GLOBAL-MISSING
    CAIRO-STATUS-PNG-ERROR
    CAIRO-STATUS-FREETYPE-ERROR
    CAIRO-STATUS-WIN32-GDI-ERROR
    CAIRO-STATUS-TAG-ERROR
    CAIRO-STATUS-DWRITE-ERROR
    CAIRO-STATUS-SVG-FONT-ERROR
    CAIRO-STATUS-LAST-STATUS

    ;; cairo_format_t — pixel format for image surfaces
    CAIRO-FORMAT-INVALID
    CAIRO-FORMAT-ARGB32
    CAIRO-FORMAT-RGB24
    CAIRO-FORMAT-A8
    CAIRO-FORMAT-A1
    CAIRO-FORMAT-RGB16-565
    CAIRO-FORMAT-RGB30
    CAIRO-FORMAT-RGB96F
    CAIRO-FORMAT-RGBA128F

    ;; cairo_operator_t — compositing operators for cairo-set-operator
    CAIRO-OPERATOR-CLEAR
    CAIRO-OPERATOR-SOURCE
    CAIRO-OPERATOR-OVER
    CAIRO-OPERATOR-IN
    CAIRO-OPERATOR-OUT
    CAIRO-OPERATOR-ATOP
    CAIRO-OPERATOR-DEST
    CAIRO-OPERATOR-DEST-OVER
    CAIRO-OPERATOR-DEST-IN
    CAIRO-OPERATOR-DEST-OUT
    CAIRO-OPERATOR-DEST-ATOP
    CAIRO-OPERATOR-XOR
    CAIRO-OPERATOR-ADD
    CAIRO-OPERATOR-SATURATE
    CAIRO-OPERATOR-MULTIPLY
    CAIRO-OPERATOR-SCREEN
    CAIRO-OPERATOR-OVERLAY
    CAIRO-OPERATOR-DARKEN
    CAIRO-OPERATOR-LIGHTEN
    CAIRO-OPERATOR-COLOR-DODGE
    CAIRO-OPERATOR-COLOR-BURN
    CAIRO-OPERATOR-HARD-LIGHT
    CAIRO-OPERATOR-SOFT-LIGHT
    CAIRO-OPERATOR-DIFFERENCE
    CAIRO-OPERATOR-EXCLUSION
    CAIRO-OPERATOR-HSL-HUE
    CAIRO-OPERATOR-HSL-SATURATION
    CAIRO-OPERATOR-HSL-COLOR
    CAIRO-OPERATOR-HSL-LUMINOSITY))


;; ── Opaque pointer wrappers ───────────────────────────────────────────────────
;;
;; Cairo objects are opaque C structs; only pointers to them are
;; passed around.  Each wrapper holds a raw '* pointer and adds a
;; distinct Scheme type so callers cannot mix them up accidentally.

(define-record-type <cairo>
  (make-cairo pointer) cairo?
  (pointer cairo-pointer))

(define-record-type <surface>
  (make-surface pointer) surface?
  (pointer surface-pointer))

#|
;; ── Not yet implemented — opaque pointer wrappers ────────────────────────────
;;
;; The following types will be exported once corresponding API modules
;; (device, pattern, font, path, region) are available.

(define-record-type <cairo-device>
  (make-cairo-device pointer) cairo-device?
  (pointer cairo-device-pointer))

(define-record-type <cairo-pattern>
  (make-cairo-pattern pointer) cairo-pattern?
  (pointer cairo-pattern-pointer))

(define-record-type <cairo-font-face>
  (make-cairo-font-face pointer) cairo-font-face?
  (pointer cairo-font-face-pointer))

(define-record-type <cairo-scaled-font>
  (make-cairo-scaled-font pointer) cairo-scaled-font?
  (pointer cairo-scaled-font-pointer))

(define-record-type <cairo-font-options>
  (make-cairo-font-options pointer) cairo-font-options?
  (pointer cairo-font-options-pointer))

(define-record-type <cairo-path>
  (make-cairo-path pointer) cairo-path?
  (pointer cairo-path-pointer))

(define-record-type <cairo-region>
  (make-cairo-region pointer) cairo-region?
  (pointer cairo-region-pointer))

;; ── Not yet implemented — FFI struct layouts and record types ─────────────────
;;
;; Used with (make-c-struct layout values) / (parse-c-struct pointer layout).
;; Needed by transform, text, and glyph API modules.

;; typedef int cairo_bool_t;
(define cairo-bool-t int)

;; typedef struct { double xx, yx, xy, yy, x0, y0; } cairo_matrix_t;
(define cairo-matrix-layout
  (list double double double double double double))

(define-record-type <cairo-matrix>
  (make-cairo-matrix xx yx xy yy x0 y0) cairo-matrix?
  (xx cairo-matrix-xx) (yx cairo-matrix-yx)
  (xy cairo-matrix-xy) (yy cairo-matrix-yy)
  (x0 cairo-matrix-x0) (y0 cairo-matrix-y0))

;; typedef struct { double x, y, width, height; } cairo_rectangle_t;
(define cairo-rectangle-layout
  (list double double double double))

(define-record-type <cairo-rectangle>
  (make-cairo-rectangle x y width height) cairo-rectangle?
  (x cairo-rectangle-x)       (y cairo-rectangle-y)
  (width cairo-rectangle-width) (height cairo-rectangle-height))

;; typedef struct { int x, y, width, height; } cairo_rectangle_int_t;
(define cairo-rectangle-int-layout
  (list int int int int))

(define-record-type <cairo-rectangle-int>
  (make-cairo-rectangle-int x y width height) cairo-rectangle-int?
  (x cairo-rectangle-int-x)       (y cairo-rectangle-int-y)
  (width cairo-rectangle-int-width) (height cairo-rectangle-int-height))

;; typedef struct { unsigned long index; double x, y; } cairo_glyph_t;
(define cairo-glyph-layout
  (list unsigned-long double double))

(define-record-type <cairo-glyph>
  (make-cairo-glyph index x y) cairo-glyph?
  (index cairo-glyph-index) (x cairo-glyph-x) (y cairo-glyph-y))

;; typedef struct { int num_bytes, num_glyphs; } cairo_text_cluster_t;
(define cairo-text-cluster-layout
  (list int int))

(define-record-type <cairo-text-cluster>
  (make-cairo-text-cluster num-bytes num-glyphs) cairo-text-cluster?
  (num-bytes  cairo-text-cluster-num-bytes)
  (num-glyphs cairo-text-cluster-num-glyphs))

;; typedef struct { double x_bearing, y_bearing, width, height,
;;                         x_advance, y_advance; } cairo_text_extents_t;
(define cairo-text-extents-layout
  (list double double double double double double))

(define-record-type <cairo-text-extents>
  (make-cairo-text-extents x-bearing y-bearing width height x-advance y-advance)
  cairo-text-extents?
  (x-bearing cairo-text-extents-x-bearing)
  (y-bearing cairo-text-extents-y-bearing)
  (width     cairo-text-extents-width)
  (height    cairo-text-extents-height)
  (x-advance cairo-text-extents-x-advance)
  (y-advance cairo-text-extents-y-advance))

;; typedef struct { double ascent, descent, height,
;;                         max_x_advance, max_y_advance; } cairo_font_extents_t;
(define cairo-font-extents-layout
  (list double double double double double))

(define-record-type <cairo-font-extents>
  (make-cairo-font-extents ascent descent height max-x-advance max-y-advance)
  cairo-font-extents?
  (ascent        cairo-font-extents-ascent)
  (descent       cairo-font-extents-descent)
  (height        cairo-font-extents-height)
  (max-x-advance cairo-font-extents-max-x-advance)
  (max-y-advance cairo-font-extents-max-y-advance))

;; ── Not yet implemented — enum constants ─────────────────────────────────────
;;
;; The constants below correspond to Cairo API groups not yet exposed
;; by this binding.  They will be un-commented as the relevant modules
;; are added.

;; cairo_content_t — used by cairo-surface-create-similar (not yet implemented)
(define CAIRO-CONTENT-COLOR        #x1000)
(define CAIRO-CONTENT-ALPHA        #x2000)
(define CAIRO-CONTENT-COLOR-ALPHA  #x3000)

;; cairo_dither_t — used by cairo-image-surface-set-dither (not yet implemented)
(define CAIRO-DITHER-NONE    0)
(define CAIRO-DITHER-DEFAULT 1)
(define CAIRO-DITHER-FAST    2)
(define CAIRO-DITHER-GOOD    3)
(define CAIRO-DITHER-BEST    4)

;; cairo_antialias_t — used by cairo-set-antialias (not yet implemented)
(define CAIRO-ANTIALIAS-DEFAULT   0)
(define CAIRO-ANTIALIAS-NONE      1)
(define CAIRO-ANTIALIAS-GRAY      2)
(define CAIRO-ANTIALIAS-SUBPIXEL  3)
(define CAIRO-ANTIALIAS-FAST      4)
(define CAIRO-ANTIALIAS-GOOD      5)
(define CAIRO-ANTIALIAS-BEST      6)

;; cairo_fill_rule_t — used by cairo-set-fill-rule (not yet implemented)
(define CAIRO-FILL-RULE-WINDING  0)
(define CAIRO-FILL-RULE-EVEN-ODD 1)

;; cairo_line_cap_t — used by cairo-set-line-cap (not yet implemented)
(define CAIRO-LINE-CAP-BUTT   0)
(define CAIRO-LINE-CAP-ROUND  1)
(define CAIRO-LINE-CAP-SQUARE 2)

;; cairo_line_join_t — used by cairo-set-line-join (not yet implemented)
(define CAIRO-LINE-JOIN-MITER 0)
(define CAIRO-LINE-JOIN-ROUND 1)
(define CAIRO-LINE-JOIN-BEVEL 2)

;; cairo_text_cluster_flags_t — used by cairo-show-text-glyphs (not yet implemented)
(define CAIRO-TEXT-CLUSTER-FLAG-BACKWARD #x00000001)

;; cairo_font_slant_t — used by cairo-select-font-face (not yet implemented)
(define CAIRO-FONT-SLANT-NORMAL  0)
(define CAIRO-FONT-SLANT-ITALIC  1)
(define CAIRO-FONT-SLANT-OBLIQUE 2)

;; cairo_font_weight_t — used by cairo-select-font-face (not yet implemented)
(define CAIRO-FONT-WEIGHT-NORMAL 0)
(define CAIRO-FONT-WEIGHT-BOLD   1)

;; cairo_subpixel_order_t — used by cairo-font-options-set-subpixel-order (not yet implemented)
(define CAIRO-SUBPIXEL-ORDER-DEFAULT 0)
(define CAIRO-SUBPIXEL-ORDER-RGB     1)
(define CAIRO-SUBPIXEL-ORDER-BGR     2)
(define CAIRO-SUBPIXEL-ORDER-VRGB    3)
(define CAIRO-SUBPIXEL-ORDER-VBGR    4)

;; cairo_hint_style_t — used by cairo-font-options-set-hint-style (not yet implemented)
(define CAIRO-HINT-STYLE-DEFAULT 0)
(define CAIRO-HINT-STYLE-NONE    1)
(define CAIRO-HINT-STYLE-SLIGHT  2)
(define CAIRO-HINT-STYLE-MEDIUM  3)
(define CAIRO-HINT-STYLE-FULL    4)

;; cairo_hint_metrics_t — used by cairo-font-options-set-hint-metrics (not yet implemented)
(define CAIRO-HINT-METRICS-DEFAULT 0)
(define CAIRO-HINT-METRICS-OFF     1)
(define CAIRO-HINT-METRICS-ON      2)

;; cairo_color_mode_t — used by cairo-font-options-set-color-mode (not yet implemented)
(define CAIRO-COLOR-MODE-DEFAULT   0)
(define CAIRO-COLOR-MODE-NO-COLOR  1)
(define CAIRO-COLOR-MODE-COLOR     2)

;; cairo_font_type_t — used by cairo-font-face-get-type (not yet implemented)
(define CAIRO-FONT-TYPE-TOY    0)
(define CAIRO-FONT-TYPE-FT     1)
(define CAIRO-FONT-TYPE-WIN32  2)
(define CAIRO-FONT-TYPE-QUARTZ 3)
(define CAIRO-FONT-TYPE-USER   4)
(define CAIRO-FONT-TYPE-DWRITE 5)

;; cairo_path_data_type_t — used by path iteration (not yet implemented)
(define CAIRO-PATH-MOVE-TO    0)
(define CAIRO-PATH-LINE-TO    1)
(define CAIRO-PATH-CURVE-TO   2)
(define CAIRO-PATH-CLOSE-PATH 3)

;; cairo_device_type_t — used by cairo-device-get-type (not yet implemented)
(define CAIRO-DEVICE-TYPE-DRM     0)
(define CAIRO-DEVICE-TYPE-GL      1)
(define CAIRO-DEVICE-TYPE-SCRIPT  2)
(define CAIRO-DEVICE-TYPE-XCB     3)
(define CAIRO-DEVICE-TYPE-XLIB    4)
(define CAIRO-DEVICE-TYPE-XML     5)
(define CAIRO-DEVICE-TYPE-COGL    6)
(define CAIRO-DEVICE-TYPE-WIN32   7)
(define CAIRO-DEVICE-TYPE-INVALID -1)

;; cairo_surface_type_t — used by cairo-surface-get-type (not yet implemented)
(define CAIRO-SURFACE-TYPE-IMAGE          0)
(define CAIRO-SURFACE-TYPE-PDF            1)
(define CAIRO-SURFACE-TYPE-PS             2)
(define CAIRO-SURFACE-TYPE-XLIB           3)
(define CAIRO-SURFACE-TYPE-XCB            4)
(define CAIRO-SURFACE-TYPE-GLITZ          5)
(define CAIRO-SURFACE-TYPE-QUARTZ         6)
(define CAIRO-SURFACE-TYPE-WIN32          7)
(define CAIRO-SURFACE-TYPE-BEOS           8)
(define CAIRO-SURFACE-TYPE-DIRECTFB       9)
(define CAIRO-SURFACE-TYPE-SVG           10)
(define CAIRO-SURFACE-TYPE-OS2           11)
(define CAIRO-SURFACE-TYPE-WIN32-PRINTING 12)
(define CAIRO-SURFACE-TYPE-QUARTZ-IMAGE  13)
(define CAIRO-SURFACE-TYPE-SCRIPT        14)
(define CAIRO-SURFACE-TYPE-QT           15)
(define CAIRO-SURFACE-TYPE-RECORDING    16)
(define CAIRO-SURFACE-TYPE-VG           17)
(define CAIRO-SURFACE-TYPE-GL           18)
(define CAIRO-SURFACE-TYPE-DRM          19)
(define CAIRO-SURFACE-TYPE-TEE          20)
(define CAIRO-SURFACE-TYPE-XML          21)
(define CAIRO-SURFACE-TYPE-SKIA         22)
(define CAIRO-SURFACE-TYPE-SUBSURFACE   23)
(define CAIRO-SURFACE-TYPE-COGL         24)

;; cairo_pattern_type_t — used by cairo-pattern-get-type (not yet implemented)
(define CAIRO-PATTERN-TYPE-SOLID         0)
(define CAIRO-PATTERN-TYPE-SURFACE       1)
(define CAIRO-PATTERN-TYPE-LINEAR        2)
(define CAIRO-PATTERN-TYPE-RADIAL        3)
(define CAIRO-PATTERN-TYPE-MESH         4)
(define CAIRO-PATTERN-TYPE-RASTER-SOURCE 5)

;; cairo_extend_t — used by cairo-pattern-set-extend (not yet implemented)
(define CAIRO-EXTEND-NONE    0)
(define CAIRO-EXTEND-REPEAT  1)
(define CAIRO-EXTEND-REFLECT 2)
(define CAIRO-EXTEND-PAD     3)

;; cairo_filter_t — used by cairo-pattern-set-filter (not yet implemented)
(define CAIRO-FILTER-FAST      0)
(define CAIRO-FILTER-GOOD      1)
(define CAIRO-FILTER-BEST      2)
(define CAIRO-FILTER-NEAREST   3)
(define CAIRO-FILTER-BILINEAR  4)
(define CAIRO-FILTER-GAUSSIAN  5)

;; cairo_region_overlap_t — used by cairo-region-contains-rectangle (not yet implemented)
(define CAIRO-REGION-OVERLAP-IN   0)
(define CAIRO-REGION-OVERLAP-OUT  1)
(define CAIRO-REGION-OVERLAP-PART 2)
|#


;; ── cairo_status_t ────────────────────────────────────────────────────────────

(define CAIRO-STATUS-SUCCESS                    0)
(define CAIRO-STATUS-NO-MEMORY                  1)
(define CAIRO-STATUS-INVALID-RESTORE            2)
(define CAIRO-STATUS-INVALID-POP-GROUP          3)
(define CAIRO-STATUS-NO-CURRENT-POINT           4)
(define CAIRO-STATUS-INVALID-MATRIX             5)
(define CAIRO-STATUS-INVALID-STATUS             6)
(define CAIRO-STATUS-NULL-POINTER               7)
(define CAIRO-STATUS-INVALID-STRING             8)
(define CAIRO-STATUS-INVALID-PATH-DATA          9)
(define CAIRO-STATUS-READ-ERROR                10)
(define CAIRO-STATUS-WRITE-ERROR               11)
(define CAIRO-STATUS-SURFACE-FINISHED          12)
(define CAIRO-STATUS-SURFACE-TYPE-MISMATCH     13)
(define CAIRO-STATUS-PATTERN-TYPE-MISMATCH     14)
(define CAIRO-STATUS-INVALID-CONTENT           15)
(define CAIRO-STATUS-INVALID-FORMAT            16)
(define CAIRO-STATUS-INVALID-VISUAL            17)
(define CAIRO-STATUS-FILE-NOT-FOUND            18)
(define CAIRO-STATUS-INVALID-DASH              19)
(define CAIRO-STATUS-INVALID-DSC-COMMENT       20)
(define CAIRO-STATUS-INVALID-INDEX             21)
(define CAIRO-STATUS-CLIP-NOT-REPRESENTABLE    22)
(define CAIRO-STATUS-TEMP-FILE-ERROR           23)
(define CAIRO-STATUS-INVALID-STRIDE            24)
(define CAIRO-STATUS-FONT-TYPE-MISMATCH        25)
(define CAIRO-STATUS-USER-FONT-IMMUTABLE       26)
(define CAIRO-STATUS-USER-FONT-ERROR           27)
(define CAIRO-STATUS-NEGATIVE-COUNT            28)
(define CAIRO-STATUS-INVALID-CLUSTERS          29)
(define CAIRO-STATUS-INVALID-SLANT             30)
(define CAIRO-STATUS-INVALID-WEIGHT            31)
(define CAIRO-STATUS-INVALID-SIZE              32)
(define CAIRO-STATUS-USER-FONT-NOT-IMPLEMENTED 33)
(define CAIRO-STATUS-DEVICE-TYPE-MISMATCH      34)
(define CAIRO-STATUS-DEVICE-ERROR              35)
(define CAIRO-STATUS-INVALID-MESH-CONSTRUCTION 36)
(define CAIRO-STATUS-DEVICE-FINISHED           37)
(define CAIRO-STATUS-JBIG2-GLOBAL-MISSING      38)
(define CAIRO-STATUS-PNG-ERROR                 39)
(define CAIRO-STATUS-FREETYPE-ERROR            40)
(define CAIRO-STATUS-WIN32-GDI-ERROR           41)
(define CAIRO-STATUS-TAG-ERROR                 42)
(define CAIRO-STATUS-DWRITE-ERROR              43)
(define CAIRO-STATUS-SVG-FONT-ERROR            44)
(define CAIRO-STATUS-LAST-STATUS               45)


;; ── cairo_format_t ────────────────────────────────────────────────────────────

(define CAIRO-FORMAT-INVALID   -1)
(define CAIRO-FORMAT-ARGB32     0)
(define CAIRO-FORMAT-RGB24      1)
(define CAIRO-FORMAT-A8         2)
(define CAIRO-FORMAT-A1         3)
(define CAIRO-FORMAT-RGB16-565  4)
(define CAIRO-FORMAT-RGB30      5)
(define CAIRO-FORMAT-RGB96F     6)
(define CAIRO-FORMAT-RGBA128F   7)


;; ── cairo_operator_t ──────────────────────────────────────────────────────────

(define CAIRO-OPERATOR-CLEAR            0)
(define CAIRO-OPERATOR-SOURCE           1)
(define CAIRO-OPERATOR-OVER             2)
(define CAIRO-OPERATOR-IN               3)
(define CAIRO-OPERATOR-OUT              4)
(define CAIRO-OPERATOR-ATOP             5)
(define CAIRO-OPERATOR-DEST             6)
(define CAIRO-OPERATOR-DEST-OVER        7)
(define CAIRO-OPERATOR-DEST-IN          8)
(define CAIRO-OPERATOR-DEST-OUT         9)
(define CAIRO-OPERATOR-DEST-ATOP       10)
(define CAIRO-OPERATOR-XOR             11)
(define CAIRO-OPERATOR-ADD             12)
(define CAIRO-OPERATOR-SATURATE        13)
(define CAIRO-OPERATOR-MULTIPLY        14)
(define CAIRO-OPERATOR-SCREEN          15)
(define CAIRO-OPERATOR-OVERLAY         16)
(define CAIRO-OPERATOR-DARKEN          17)
(define CAIRO-OPERATOR-LIGHTEN         18)
(define CAIRO-OPERATOR-COLOR-DODGE     19)
(define CAIRO-OPERATOR-COLOR-BURN      20)
(define CAIRO-OPERATOR-HARD-LIGHT      21)
(define CAIRO-OPERATOR-SOFT-LIGHT      22)
(define CAIRO-OPERATOR-DIFFERENCE      23)
(define CAIRO-OPERATOR-EXCLUSION       24)
(define CAIRO-OPERATOR-HSL-HUE         25)
(define CAIRO-OPERATOR-HSL-SATURATION  26)
(define CAIRO-OPERATOR-HSL-COLOR       27)
(define CAIRO-OPERATOR-HSL-LUMINOSITY  28)
