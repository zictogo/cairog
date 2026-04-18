# Cairog

Cairo binding for GNU Guile.

## Installation

```bash
guix package -f guix.scm
```

## Development

```bash
guix shell -D -f guix.scm               # development shell with all build inputs
./bootstrap && ./configure && make       # build in-tree
info -f doc/cairog.info                  # browse the manual without installing
```

## Tests

```bash
make check
```

## Documentation

After installation, the manual is available in Info:

```bash
info cairog
```

Also available at <https://zictogo.github.io/cairog/>.
