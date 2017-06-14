FROM debian:latest

RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    git \
    gcc-mingw-w64-x86-64 \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /.cargo/
COPY cargo_config /.cargo/config

ENV PATH $PATH:/root/.cargo/bin/

RUN curl https://sh.rustup.rs -sSf | sh -s -- -y && \
    rustup default stable && \
    rustup target add x86_64-pc-windows-gnu
