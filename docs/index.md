# Cairog

Cairog is a Cairo binding for GNU Guile. It exposes the [Cairo](https://www.cairographics.org/) 2D graphics library through Guile's Foreign Function Interface, allowing you to draw vector graphics directly from Scheme.

## Requirements

- [GNU Guix](https://guix.gnu.org/)

## Installation

```bash
guix package -f guix.scm
```

After installation the modules are available with no extra configuration:

```scheme
(use-modules (cairog))
```

## Development

```bash
guix shell -f guix.scm               # shell with all dependencies
./bootstrap && ./configure && make   # build in-tree
```

## Quick example

```scheme
(use-modules (cairog))

(let* ((surface (cairo-image-surface-create CAIRO-FORMAT-ARGB32 256 256))
       (cr      (cairo-create surface)))

  ;; White background
  (cairo-set-source-rgb cr 1.0 1.0 1.0)
  (cairo-paint cr)

  ;; Blue filled circle
  (cairo-set-source-rgb cr 0.2 0.4 0.8)
  (cairo-arc cr 128.0 128.0 80.0 0.0 (* 2 3.14159265))
  (cairo-fill cr)

  (cairo-surface-write-to-png surface "/tmp/circle.png")
  (cairo-destroy cr)
  (cairo-surface-destroy surface))
```

## Running the tests

```bash
make check
```

## Reference

- [Core module](reference/core.md) — library loading and version
- [Surface module](reference/surface.md) — surface creation and I/O
- [Context module](reference/context.md) — drawing operations

## API coverage

See [API coverage](reference/coverage.md) for the list of Cairo API groups that are not yet available in this binding.
