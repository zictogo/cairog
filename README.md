# Cairog

Cairo binding for GNU Guile.

## Installation

```bash
guix package -f guix.scm
```

## Development

```bash
guix shell -f guix.scm   # shell with all dependencies
./bootstrap && ./configure && make   # build in-tree
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
