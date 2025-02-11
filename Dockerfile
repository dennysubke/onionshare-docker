FROM debian:bookworm

# Umgebungsvariablen setzen
ENV ONIONSHARE_VERSION=2.6.2
ENV PIPX_BIN_DIR=/usr/local/bin

# Systemabhängige Pakete installieren
RUN apt-get update && apt-get -yq --no-install-recommends install tor pipx python3-pyqt5

# OnionShare installieren
RUN pipx install onionshare-cli==$ONIONSHARE_VERSION

# Volumes für den Datentransfer
VOLUME ["/shared"]

# Exponieren von Port 9192
EXPOSE 9192

# Startbefehl für den OnionShare-Server mit der UI und Tor
ENTRYPOINT ["/usr/local/bin/onionshare", "gui", "--port", "9192"]
CMD ["--shared-folder", "/shared"]
