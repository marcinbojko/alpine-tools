FROM alpine:3.15.0 AS build
LABEL version="v0.0.3"
LABEL release="alpine-tools"
LABEL maintainer="marcinbojko"
SHELL ["/bin/ash", "-eo", "pipefail", "-c"]
# shellcheck disable=SC2169
RUN apk add --no-cache --update -t deps ca-certificates curl bash gettext tar gzip openssl openssh rsync python3 python3-dev py3-pip py3-wheel tzdata git httpie nmap tcpdump sshfs shellcheck  httpie nmap \
  && pip3 install --upgrade pip \
  && pip3 install --no-cache-dir --upgrade wheel pip yamllint jsonlint dos2unix\
  && mkdir -p ~/.ssh \
  && eval "$(ssh-agent -s)" \
  && echo -e "Host *\n\tStrictHostKeyChecking no\n\n" > ~/.ssh/config \
  && chmod -R 700 ~/.ssh
CMD ["busybox"]
