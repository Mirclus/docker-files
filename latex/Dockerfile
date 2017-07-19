FROM debian:batman/r-base-debian-latest

RUN apt-get update && apt-get install -y \
    curl \
    git \
    biber \
    latexmk \
    texlive-full \
    graphviz \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /data
VOLUME ["/data"]
