FROM alpine:3.6

MAINTAINER Open Justice Broker Consortium

ENV AWS_CLI_VERSION 1.11.131

RUN apk --no-cache update && \
    apk --no-cache add python py-pip py-setuptools ca-certificates groff less && \
    pip --no-cache-dir install awscli==${AWS_CLI_VERSION} && \
    pip install --upgrade pip &&\
    rm -rf /var/cache/apk/*


