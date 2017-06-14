FROM debian:latest

RUN apt-get update && apt-get install -y \
    curl \
    git \
    gcc-mingw-w64-x86-64 \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /.cargo/
COPY cargo_config /.cargo/config

RUN groupadd -g 1000 rust && \
    useradd -u 1000 -g 1000 -m rust

RUN mkdir /builds && chown rust:rust /builds

USER rust

ENV PATH $PATH:/home/rust/.cargo/bin/

RUN curl https://sh.rustup.rs -sSf | sh -s -- -y && \
    rustup default stable && \
    rustup target add x86_64-pc-windows-gnu
