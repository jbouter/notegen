FROM debian:stable

LABEL maintainer="docker@kn0x.org" \
      repo="https://github.com/jbouter/notegen"

RUN set -eux \
    && apt-get update \
    && apt-get install -y --no-install-recommends texlive texlive-xetex \
    texlive-fonts-recommended texlive-fonts-extra lmodern pandoc python3 \
    && rm -rf /var/cache/apt

RUN set -eux \
    && groupadd -r --gid 800 pandoc \
    && useradd -r -m -g pandoc -d /usr/local/share/pandoc --uid 800 pandoc \
    && ln -s /dev/stdout /usr/local/share/pandoc/stdout.pdf

COPY eisvogel.tex /usr/share/pandoc/data/templates/eisvogel.latex

WORKDIR /usr/local/share/pandoc/
USER pandoc
ENTRYPOINT ["/usr/bin/pandoc", "--template", "eisvogel.latex", "-f", "markdown", "--pdf-engine", "xelatex", "--listings", "-o", "/usr/local/share/pandoc/stdout.pdf"]
