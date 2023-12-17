FROM nginx:alpine as build

RUN apk add --update \
    wget
    
ARG HUGO_VERSION="0.72.0"
RUN wget --quiet "https://github.com/gohugoio/hugo/releases/download/v0.121.1/hugo_0.121.1_Linux-64bit.tar.gz" && \
    tar xzf hugo_0.121.1_Linux-64bit.tar.gz && \
    rm -r hugo_0.121.1_Linux-64bit.tar.gz && \
    mv hugo /usr/bin

COPY ./ /site
WORKDIR /site
RUN hugo 

EXPOSE 80 1313

CMD ["hugo"]
CMD [ "hugo", "server", "--disableFastRender", "--buildDrafts", "--watch", "--bind", "0.0.0.0"]
