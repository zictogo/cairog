# Cairog

Cairo binding for GNU Guile.

## Quickstart

```bash
source env.sh
guile
```

```scheme
(use-modules (system foreign) (cairog core))
(pointer->string (cairo-version-string))
```

## Documentation

```bash
docker compose up -d
```

Available at [http://localhost:8080](http://localhost:8080).

## Tests

```bash
make test
```