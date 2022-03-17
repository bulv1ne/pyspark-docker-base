# Works for databricks instances running 9.1
FROM openjdk:8-jdk-slim

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
    curl -O https://www.python.org/ftp/python/3.8.13/Python-3.8.13.tgz && \
    tar xf Python-3.8.13.tgz && \
    cd Python-3.8.13 && \
    ./configure --enable-optimizations --enable-loadable-sqlite-extensions && \
    make && \
    make altinstall && \
    rm -rf /var/lib/apt/lists/* && \
    ln /usr/local/bin/python3.8 /usr/local/bin/python && \
    ln /usr/local/bin/python3.8 /usr/local/bin/python3 && \
    python -m pip install --no-cache-dir -U pip poetry
