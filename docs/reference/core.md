# Core module

The `core` module loads `libcairo` and provides low-level FFI bindings.

```scheme
(use-modules (cairog))
```

## Variables

### `libcairo`

The dynamic library handle returned by `(dynamic-link "libcairo")`. Use it to look up additional Cairo symbols via `dynamic-func` when building higher-level bindings.

## Procedures

### `(cairo-version)` → `integer`

Returns the Cairo library version as an encoded integer `(major * 10000 + minor * 100 + micro)`.

```scheme
(cairo-version) ;; => 11802  (meaning 1.18.2)
```

### `(cairo-version-string)` → `pointer`

Returns a pointer to a C string containing the Cairo version. Convert it with `pointer->string`:

```scheme
(pointer->string (cairo-version-string)) ;; => "1.18.2"
```
