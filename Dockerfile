FROM debian:bookworm

ENV ONIONSHARE_VERSION=2.6.1
ENV PIPX_BIN_DIR=/root/.local/bin

RUN apt-get update && apt-get install -yq --no-install-recommends \
    tor \
    pipx \
    python3-pyqt5 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN pipx install onionshare-cli==$ONIONSHARE_VERSION

EXPOSE 9192

VOLUME ["/shared"]

ENTRYPOINT ["/root/.local/bin/onionshare-cli", "--website"]
