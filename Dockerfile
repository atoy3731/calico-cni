ARG BASE_REGISTRY=nexus-docker-secure.levelup-nexus.svc.cluster.local:18082
ARG BASE_IMAGE=redhat/ubi/ubi7
ARG BASE_TAG=7.8

#FROM ${BASE_REGISTRY}/${BASE_IMAGE}:${BASE_TAG}
FROM registry.access.redhat.com/ubi7/ubi

LABEL name="calico-cni" \
      maintainer="Rancher Labs <support@rancher.com>" \
      vendor="Rancher" \
      version="3.13.0" \
      release="1" \
      summary="calico-cni" \
      description="calico-cni"

COPY LICENSE /licenses/calico-cni

USER root

ADD calico calico-ipam /opt/cni/bin/
ADD install-cni.sh /install-cni.sh
ADD calico.conf.default /calico.conf.tmp

ENV PATH=$PATH:/opt/cni/bin
WORKDIR /opt/cni/bin

RUN chmod +x /opt/cni/bin/calico /opt/cni/bin/calico-ipam /install-cni.sh && \
    chown -R 2000:2000 /opt/cni /licenses && \
    chown 2000:2000 /calico.conf.tmp /install-cni.sh

USER 2000

CMD ["/opt/cni/bin/calico"]
