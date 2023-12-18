FROM nginx:alpine as build

RUN apk add --update \
    wget
    
ARG HUGO_VERSION="0.72.0"
RUN wget "https://github.com/gohugoio/hugo/releases/download/v0.121.1/hugo_extended_0.121.1_linux-amd64.tar.gz" && \
    tar xzf hugo_extended_0.121.1_linux-amd64.tar.gz && \
    rm -r hugo_extended_0.121.1_linux-amd64.tar.gz && \
    mv hugo /usr/bin

WORKDIR /site

EXPOSE 80 1313

