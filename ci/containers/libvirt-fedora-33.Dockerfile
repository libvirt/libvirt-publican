FROM registry.fedoraproject.org/fedora:33

RUN dnf update -y && \
    dnf install -y \
        ca-certificates \
        git \
        glibc-langpack-en \
        publican && \
    dnf autoremove -y && \
    dnf clean all -y

ENV LANG "en_US.UTF-8"
