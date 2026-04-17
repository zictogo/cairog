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

Available at <https://zictogo.github.io/cairog/>.

To browse locally:

```bash
docker compose up -d   # served at http://localhost:8080
```
