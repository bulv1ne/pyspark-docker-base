# Works for databricks instances running 15.4

FROM openjdk:8-jdk-slim
ARG PYTHON_VERSION=3.10.12

# hadolint ignore=DL3008,DL3003,DL3013
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        ca-certificates \
        build-essential \
        zlib1g-dev \
        libncurses5-dev \
        libgdbm-dev \
        libnss3-dev \
        libssl-dev \
        libsqlite3-dev \
        libreadline-dev \
        libffi-dev \
        libbz2-dev  \
        curl && \
    curl -O https://www.python.org/ftp/python/$PYTHON_VERSION/Python-$PYTHON_VERSION.tgz && \
    tar xf Python-$PYTHON_VERSION.tgz && \
    cd Python-$PYTHON_VERSION && \
    ./configure --enable-optimizations --enable-loadable-sqlite-extensions && \
    make && \
    make altinstall && \
    rm -rf /var/lib/apt/lists/* && \
    ln /usr/local/bin/python3.10 /usr/local/bin/python && \
    ln /usr/local/bin/python3.10 /usr/local/bin/python3 && \
    python -m pip install --no-cache-dir -U pip poetry
