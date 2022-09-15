[Back](./index.md)

Docker image to compile `.tex` files into `.pdf` files.
Uses `texliveonfly` to install missing TeX packages.

Mount volume with the input file to `/work` directory, and pass file name to the run command

```dockerfile
# syntax=docker/dockerfile:1
FROM debian:bookworm-slim

WORKDIR work

# Required to install and run texlive
RUN apt-get update
RUN apt-get install -y wget perl python-is-python3

# Install texlive
RUN wget -O texlive.tar.gz https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz && \
    mkdir texlive && \
    tar -xz -f texlive.tar.gz -C texlive --strip-components=1 && \
    perl ./texlive/install-tl --no-interaction --scheme=basic --no-doc-install --no-src-install --texdir=/usr/local/texlive && \
    rm -rf texlive && \
    rm texlive.tar.gz

ENV PATH=/usr/local/texlive/bin/aarch64-linux:$PATH

# Install texliveonfly to handle missing packages
RUN tlmgr install texliveonfly

ENTRYPOINT texliveonfly --compiler=pdflatex --arguments="-synctex=0 -interaction=nonstopmode"

```
