FROM node:10.2.1-alpine

LABEL maintainer="Anucha Nualsi <ana.cpe9@gmail.com>"

VOLUME /.npm/

RUN apk add --no-cache --update \
        python \
        make \
        git \
        g++ && \
    npm config set cache /.npm/ --global && \
    npm install -g --unsafe-perm \
        node-gyp \
        node-zopfli \
        node-sass \
        sass-loader \
        @angular/cli@6.0.5 && \
    npm cache verify && \
    npm cache clean --force && \
    npm cache verify && \
    apk del git && \
    rm -rf /tmp/* && \
    rm -rf /var/tmp/* && \
    rm -rf /var/cache/apk/* && \
    npm prune && \
    npm upgrade && \
    node --version && \
    npm --version && \
    ng --version
    # npm --version
