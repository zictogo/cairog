# Surface module

The `surface` module creates and manages Cairo surfaces. A surface is the destination for drawing operations — in this binding, in-memory bitmap images that can be exported to PNG.

See the [Cairo surface documentation](https://www.cairographics.org/manual/cairo-cairo-surface-t.html) for the full C API reference.

```scheme
(use-modules (cairog))
```

## Procedures

### `(cairo-image-surface-create format width height)` → `<cairo-surface>`

Corresponds to [`cairo_image_surface_create`](https://www.cairographics.org/manual/cairo-Image-Surfaces.html#cairo-image-surface-create).

Creates an in-memory image surface of the given pixel format and dimensions. `format` is one of the `CAIRO-FORMAT-*` constants (see the table below).

```scheme
(cairo-image-surface-create CAIRO-FORMAT-ARGB32 800 600)
```

### `(cairo-surface-destroy surface)`

Corresponds to [`cairo_surface_destroy`](https://www.cairographics.org/manual/cairo-cairo-surface-t.html#cairo-surface-destroy).

Decrements the reference count on `surface`. The surface is freed when the count reaches zero. Call this once you are done drawing.

### `(cairo-surface-status surface)` → `integer`

Corresponds to [`cairo_surface_status`](https://www.cairographics.org/manual/cairo-cairo-surface-t.html#cairo-surface-status).

Returns the current error status of `surface` as one of the `CAIRO-STATUS-*` integers. A healthy surface returns `CAIRO-STATUS-SUCCESS` (0).

### `(cairo-surface-write-to-png surface filename)` → `integer`

Corresponds to [`cairo_surface_write_to_png`](https://www.cairographics.org/manual/cairo-PNG-Support.html#cairo-surface-write-to-png).

Writes the surface contents to a PNG file at `filename`. Returns a `CAIRO-STATUS-*` integer; `CAIRO-STATUS-SUCCESS` on success.

```scheme
(cairo-surface-write-to-png surface "/tmp/output.png")
```

## Format constants

Pixel formats for `cairo-image-surface-create`, from [`cairo_format_t`](https://www.cairographics.org/manual/cairo-Image-Surfaces.html#cairo-format-t):

| Constant | Description |
|---|---|
| `CAIRO-FORMAT-ARGB32` | 32-bit ARGB with pre-multiplied alpha |
| `CAIRO-FORMAT-RGB24` | 32-bit RGB, no alpha |
| `CAIRO-FORMAT-A8` | 8-bit alpha channel only |
| `CAIRO-FORMAT-A1` | 1-bit alpha channel only |
| `CAIRO-FORMAT-RGB16-565` | 16-bit RGB |
| `CAIRO-FORMAT-RGB30` | 30-bit RGB |
| `CAIRO-FORMAT-RGB96F` | 96-bit RGB, floating-point |
| `CAIRO-FORMAT-RGBA128F` | 128-bit RGBA, floating-point |
| `CAIRO-FORMAT-INVALID` | Invalid format (error sentinel) |
