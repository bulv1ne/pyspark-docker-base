# Works for databricks instances running 17.3LTS

FROM amazoncorretto:17

COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/


ENV PATH="/root/.local/bin:$PATH"
# hadolint ignore=DL3008,DL3003,DL3013
RUN yum groupinstall "Development Tools" && \
    uv python install 3.12 && \
    uv tool install poetry

