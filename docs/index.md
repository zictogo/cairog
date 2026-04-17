# Cairog

Cairog is a Cairo binding for GNU Guile. It exposes the [Cairo](https://www.cairographics.org/) 2D graphics library through Guile's Foreign Function Interface, allowing you to draw vector graphics directly from Scheme.

## Requirements

- GNU Guile 3.0+
- libcairo (e.g. `libcairo2-dev` on Debian/Ubuntu, `cairo-devel` on Fedora)

## Installation

```bash
git clone https://github.com/zictogo/cairog.git
cd cairog
source env.sh
```

`env.sh` sets `GUILE_LOAD_PATH` to the project root so modules are resolvable without any extra flags.

## Quick example

```scheme
(use-modules (cairog types)
             (cairog surface)
             (cairog context))

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
make test
```

## Reference

- [Core module](reference/core.md) — library loading and version
- [Surface module](reference/surface.md) — surface creation and I/O
- [Context module](reference/context.md) — drawing operations

## API coverage

See [API coverage](reference/coverage.md) for the list of Cairo API groups that are not yet available in this binding.
