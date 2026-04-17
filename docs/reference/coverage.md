# API coverage

This page lists Cairo API groups and their current availability in Cairog.

The full Cairo C API reference is at <https://www.cairographics.org/manual/>.

All available bindings are accessible via the single top-level module:

```scheme
(use-modules (cairog))
```

## Available

| Module | Cairo API group |
|---|---|
| Core | [Version information](https://www.cairographics.org/manual/cairo-Version-Information.html) |
| Surface | [Image surfaces](https://www.cairographics.org/manual/cairo-Image-Surfaces.html), [PNG support](https://www.cairographics.org/manual/cairo-PNG-Support.html), [surface lifecycle](https://www.cairographics.org/manual/cairo-cairo-surface-t.html) (create/destroy/status) |
| Context | [Drawing context](https://www.cairographics.org/manual/cairo-cairo-t.html) (lifecycle, save/restore, source, operator, line width), [paint/fill/stroke verbs](https://www.cairographics.org/manual/cairo-cairo-t.html), [path construction](https://www.cairographics.org/manual/cairo-Paths.html) (move-to, line-to, rectangle, arc, close-path) |

## Not yet available

The following Cairo API groups are not yet exposed by this binding. The type definitions and enum constants for these groups are present in `cairog/types.scm` but commented out until the corresponding modules are added.

| Cairo API group | Reference | Blocked on |
|---|---|---|
| Transformations | [cairo_matrix_t](https://www.cairographics.org/manual/cairo-cairo-matrix-t.html), [cairo_set_matrix](https://www.cairographics.org/manual/cairo-Transformations.html) | `cairo-matrix-t` struct binding |
| Patterns | [cairo_pattern_t](https://www.cairographics.org/manual/cairo-cairo-pattern-t.html) — solid, linear, radial, mesh, surface | `cairo-pattern-t` opaque wrapper |
| Extended source | [cairo_set_source_surface](https://www.cairographics.org/manual/cairo-cairo-t.html#cairo-set-source-surface), [cairo_set_source](https://www.cairographics.org/manual/cairo-cairo-t.html#cairo-set-source) | `cairo-pattern-t` |
| Clipping | [cairo_clip](https://www.cairographics.org/manual/cairo-cairo-t.html#cairo-clip), [cairo_reset_clip](https://www.cairographics.org/manual/cairo-cairo-t.html#cairo-reset-clip) | context module extension |
| Masking | [cairo_mask](https://www.cairographics.org/manual/cairo-cairo-t.html#cairo-mask), [cairo_mask_surface](https://www.cairographics.org/manual/cairo-cairo-t.html#cairo-mask-surface) | `cairo-pattern-t` |
| Groups | [cairo_push_group](https://www.cairographics.org/manual/cairo-cairo-t.html#cairo-push-group), [cairo_pop_group](https://www.cairographics.org/manual/cairo-cairo-t.html#cairo-pop-group) | `cairo-pattern-t` |
| Curve paths | [cairo_curve_to](https://www.cairographics.org/manual/cairo-Paths.html#cairo-curve-to), [cairo_rel_curve_to](https://www.cairographics.org/manual/cairo-Paths.html#cairo-rel-curve-to) | context module extension |
| Path query | [cairo_copy_path](https://www.cairographics.org/manual/cairo-Paths.html#cairo-copy-path), [cairo_get_current_point](https://www.cairographics.org/manual/cairo-Paths.html#cairo-get-current-point) | `cairo-path-t` binding |
| Style query | [cairo_get_line_width](https://www.cairographics.org/manual/cairo-cairo-t.html#cairo-get-line-width), [cairo_get_operator](https://www.cairographics.org/manual/cairo-cairo-t.html#cairo-get-operator), etc. | context module extension |
| Dash | [cairo_set_dash](https://www.cairographics.org/manual/cairo-cairo-t.html#cairo-set-dash), [cairo_get_dash](https://www.cairographics.org/manual/cairo-cairo-t.html#cairo-get-dash) | context module extension |
| Fill rule / line cap / join | [cairo_set_fill_rule](https://www.cairographics.org/manual/cairo-cairo-t.html#cairo-set-fill-rule), [cairo_set_line_cap](https://www.cairographics.org/manual/cairo-cairo-t.html#cairo-set-line-cap), [cairo_set_line_join](https://www.cairographics.org/manual/cairo-cairo-t.html#cairo-set-line-join) | context module extension |
| Antialiasing | [cairo_set_antialias](https://www.cairographics.org/manual/cairo-cairo-t.html#cairo-set-antialias) | context module extension |
| Text / toy font | [cairo_show_text](https://www.cairographics.org/manual/cairo-text.html#cairo-show-text), [cairo_select_font_face](https://www.cairographics.org/manual/cairo-text.html#cairo-select-font-face), [cairo_set_font_size](https://www.cairographics.org/manual/cairo-text.html#cairo-set-font-size) | font-face and text-extents bindings |
| Glyph API | [cairo_show_glyphs](https://www.cairographics.org/manual/cairo-text.html#cairo-show-glyphs), [cairo_glyph_extents](https://www.cairographics.org/manual/cairo-text.html#cairo-glyph-extents) | `cairo-glyph-t` struct binding |
| Scaled font | [cairo_scaled_font_t](https://www.cairographics.org/manual/cairo-cairo-scaled-font-t.html) | `cairo-scaled-font-t` opaque wrapper |
| Font options | [cairo_font_options_t](https://www.cairographics.org/manual/cairo-cairo-font-options-t.html) — hint style, subpixel order, colour mode | `cairo-font-options-t` opaque wrapper |
| Device | [cairo_device_t](https://www.cairographics.org/manual/cairo-cairo-device-t.html) | `cairo-device-t` opaque wrapper |
| Region | [cairo_region_t](https://www.cairographics.org/manual/cairo-Regions.html) | `cairo-region-t` opaque wrapper |
| Additional surface types | PDF, PS, SVG, script, recording surfaces | separate surface modules |
| Stroke/fill extents | [cairo_stroke_extents](https://www.cairographics.org/manual/cairo-cairo-t.html#cairo-stroke-extents), [cairo_fill_extents](https://www.cairographics.org/manual/cairo-cairo-t.html#cairo-fill-extents) | context module extension |
| Hit testing | [cairo_in_stroke](https://www.cairographics.org/manual/cairo-cairo-t.html#cairo-in-stroke), [cairo_in_fill](https://www.cairographics.org/manual/cairo-cairo-t.html#cairo-in-fill) | context module extension |
| User data | [cairo_set_user_data](https://www.cairographics.org/manual/cairo-cairo-t.html#cairo-set-user-data) | context module extension |
