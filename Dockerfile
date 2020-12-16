FROM debian:stable

LABEL maintainer="docker@kn0x.org" \
      repo="https://github.com/jbouter/notegen"

RUN set -eux \
    && apt-get update \
    && apt-get install -y texlive texlive-xetex texlive-fonts-recommended \
    texlive-fonts-extra pandoc python3 \
    && rm -rf /var/cache/apt \
    && groupadd -r --gid 800 pandoc \
    && useradd -r -M -g pandoc --uid 800 pandoc

COPY eisvogel.tex /usr/share/pandoc/data/templates/eisvogel.latex
COPY notegen /usr/local/bin/notegen

WORKDIR /data
USER pandoc
ENTRYPOINT ["notegen"]
