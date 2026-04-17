FROM ghcr.io/astral-sh/uv:python3.13-alpine

WORKDIR /app

COPY pyproject.toml ./
COPY uv.lock ./

RUN uv sync --frozen

COPY docs/ ./docs/
COPY zensical.toml ./

EXPOSE 8080

CMD ["uv", "run", "zensical", "serve", "--dev-addr", "0.0.0.0:8080"]