FROM ubuntu:18.04

ARG BASE_PACKAGES="\
    uwsgi-plugin-python \
    python-moinmoin \
"

RUN rm -f /etc/apt/apt.conf.d/docker-clean; echo 'Binary::apt::APT::Keep-Downloaded-Packages "true";' > /etc/apt/apt.conf.d/keep-cache
RUN \
        --mount=type=cache,target=/var/cache/apt,sharing=locked \
        --mount=type=cache,target=/var/lib/apt,sharing=locked \
    \
    apt-get update -q && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get install --yes --no-install-recommends $BASE_PACKAGES

COPY docker-cmd.sh /

# Define ports, volumes and the entrypoint
EXPOSE 8080
EXPOSE 3031
EXPOSE 9191

VOLUME /etc/moin/
VOLUME /moin/data
VOLUME /moin/underlay
VOLUME /moin/log
VOLUME /moin/static

CMD ["/bin/bash", "/docker-cmd.sh"]

