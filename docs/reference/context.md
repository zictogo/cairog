# Context module

The `context` module wraps `cairo_t`, the central object of Cairo. Every drawing operation goes through a context bound to a surface.

See the [Cairo drawing documentation](https://www.cairographics.org/manual/cairo-cairo-t.html) for the full C API reference.

```scheme
(use-modules (cairog))
```

## Lifecycle

### `(cairo-create surface)` → `<cairo>`

Corresponds to [`cairo_create`](https://www.cairographics.org/manual/cairo-cairo-t.html#cairo-create).

Creates a new drawing context targeting `surface`.

### `(cairo-destroy cr)`

Corresponds to [`cairo_destroy`](https://www.cairographics.org/manual/cairo-cairo-t.html#cairo-destroy).

Decrements the context reference count and frees it when it reaches zero.

### `(cairo-status cr)` → `integer`

Corresponds to [`cairo_status`](https://www.cairographics.org/manual/cairo-cairo-t.html#cairo-status).

Returns the current error state as a `CAIRO-STATUS-*` integer.

### `(cairo-save cr)` / `(cairo-restore cr)`

Correspond to [`cairo_save`](https://www.cairographics.org/manual/cairo-cairo-t.html#cairo-save) / [`cairo_restore`](https://www.cairographics.org/manual/cairo-cairo-t.html#cairo-restore).

Push/pop the full graphics state (source, line width, operator, clip, etc.) onto a stack. Use `cairo-save` before temporary style changes and `cairo-restore` to undo them.

## Source

### `(cairo-set-source-rgb cr r g b)`

Corresponds to [`cairo_set_source_rgb`](https://www.cairographics.org/manual/cairo-cairo-t.html#cairo-set-source-rgb).

Sets an opaque solid colour. `r`, `g`, `b` are doubles in `[0.0, 1.0]`.

### `(cairo-set-source-rgba cr r g b a)`

Corresponds to [`cairo_set_source_rgba`](https://www.cairographics.org/manual/cairo-cairo-t.html#cairo-set-source-rgba).

Sets a solid colour with alpha. `a` is a double in `[0.0, 1.0]` where 1.0 is fully opaque.

## State

### `(cairo-set-line-width cr width)`

Corresponds to [`cairo_set_line_width`](https://www.cairographics.org/manual/cairo-cairo-t.html#cairo-set-line-width).

Sets the stroke line width in user-space units.

### `(cairo-set-operator cr op)`

Corresponds to [`cairo_set_operator`](https://www.cairographics.org/manual/cairo-cairo-t.html#cairo-set-operator).

Sets the compositing operator. `op` is one of the `CAIRO-OPERATOR-*` constants.

## Drawing verbs

### `(cairo-paint cr)`

Corresponds to [`cairo_paint`](https://www.cairographics.org/manual/cairo-cairo-t.html#cairo-paint).

Fills the entire clip region with the current source.

### `(cairo-paint-with-alpha cr alpha)`

Corresponds to [`cairo_paint_with_alpha`](https://www.cairographics.org/manual/cairo-cairo-t.html#cairo-paint-with-alpha).

Like `cairo-paint` but modulates the source with `alpha` (double in `[0.0, 1.0]`).

### `(cairo-fill cr)` / `(cairo-fill-preserve cr)`

Correspond to [`cairo_fill`](https://www.cairographics.org/manual/cairo-cairo-t.html#cairo-fill) / [`cairo_fill_preserve`](https://www.cairographics.org/manual/cairo-cairo-t.html#cairo-fill-preserve).

Fill the current path with the source. `cairo-fill` clears the path afterwards; `cairo-fill-preserve` keeps it for further operations (e.g. a subsequent stroke).

### `(cairo-stroke cr)` / `(cairo-stroke-preserve cr)`

Correspond to [`cairo_stroke`](https://www.cairographics.org/manual/cairo-cairo-t.html#cairo-stroke) / [`cairo_stroke_preserve`](https://www.cairographics.org/manual/cairo-cairo-t.html#cairo-stroke-preserve).

Stroke the current path outline using the current line width and source. `cairo-stroke-preserve` keeps the path.

## Path construction

### `(cairo-move-to cr x y)` / `(cairo-rel-move-to cr dx dy)`

Correspond to [`cairo_move_to`](https://www.cairographics.org/manual/cairo-Paths.html#cairo-move-to) / [`cairo_rel_move_to`](https://www.cairographics.org/manual/cairo-Paths.html#cairo-rel-move-to).

Move the current point to `(x, y)` (absolute) or offset by `(dx, dy)` (relative), starting a new sub-path.

### `(cairo-line-to cr x y)` / `(cairo-rel-line-to cr dx dy)`

Correspond to [`cairo_line_to`](https://www.cairographics.org/manual/cairo-Paths.html#cairo-line-to) / [`cairo_rel_line_to`](https://www.cairographics.org/manual/cairo-Paths.html#cairo-rel-line-to).

Add a straight-line segment to `(x, y)` (absolute) or offset by `(dx, dy)` (relative).

### `(cairo-rectangle cr x y width height)`

Corresponds to [`cairo_rectangle`](https://www.cairographics.org/manual/cairo-Paths.html#cairo-rectangle).

Add a closed rectangular sub-path at `(x, y)` with the given `width` and `height`.

### `(cairo-arc cr xc yc radius angle1 angle2)`

Corresponds to [`cairo_arc`](https://www.cairographics.org/manual/cairo-Paths.html#cairo-arc).

Add a circular arc centred at `(xc, yc)` with `radius`, from `angle1` to `angle2` in radians, going clockwise.

### `(cairo-arc-negative cr xc yc radius angle1 angle2)`

Corresponds to [`cairo_arc_negative`](https://www.cairographics.org/manual/cairo-Paths.html#cairo-arc-negative).

Like `cairo-arc` but goes counter-clockwise.

### `(cairo-close-path cr)`

Corresponds to [`cairo_close_path`](https://www.cairographics.org/manual/cairo-Paths.html#cairo-close-path).

Close the current sub-path by drawing a straight line back to its starting point.

## Operator constants

From [`cairo_operator_t`](https://www.cairographics.org/manual/cairo-cairo-t.html#cairo-operator-t). Used with `cairo-set-operator`:

`CAIRO-OPERATOR-CLEAR`, `CAIRO-OPERATOR-SOURCE`, `CAIRO-OPERATOR-OVER` (default), `CAIRO-OPERATOR-IN`, `CAIRO-OPERATOR-OUT`, `CAIRO-OPERATOR-ATOP`, `CAIRO-OPERATOR-DEST`, `CAIRO-OPERATOR-DEST-OVER`, `CAIRO-OPERATOR-DEST-IN`, `CAIRO-OPERATOR-DEST-OUT`, `CAIRO-OPERATOR-DEST-ATOP`, `CAIRO-OPERATOR-XOR`, `CAIRO-OPERATOR-ADD`, `CAIRO-OPERATOR-SATURATE`, `CAIRO-OPERATOR-MULTIPLY`, `CAIRO-OPERATOR-SCREEN`, `CAIRO-OPERATOR-OVERLAY`, `CAIRO-OPERATOR-DARKEN`, `CAIRO-OPERATOR-LIGHTEN`, `CAIRO-OPERATOR-COLOR-DODGE`, `CAIRO-OPERATOR-COLOR-BURN`, `CAIRO-OPERATOR-HARD-LIGHT`, `CAIRO-OPERATOR-SOFT-LIGHT`, `CAIRO-OPERATOR-DIFFERENCE`, `CAIRO-OPERATOR-EXCLUSION`, `CAIRO-OPERATOR-HSL-HUE`, `CAIRO-OPERATOR-HSL-SATURATION`, `CAIRO-OPERATOR-HSL-COLOR`, `CAIRO-OPERATOR-HSL-LUMINOSITY`.
