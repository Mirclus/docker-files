FROM debian:stretch

RUN apt-get update && apt-get install -y gnupg apt-transport-https

COPY git-lfs.list /etc/apt/sources.list.d/git-lfs.list
COPY git-lfs.pub /
RUN apt-key add /git-lfs.pub
RUN rm /git-lfs.pub

RUN apt-get update && apt-get install -y \
    curl \
    git \
    biber \
    latexmk \
    texlive-full \
    graphviz \
    git-lfs \
    && rm -rf /var/lib/apt/lists/*

RUN git lfs install

WORKDIR /data
VOLUME ["/data"]
