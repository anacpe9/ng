FROM node:10.3.0-alpine

LABEL maintainer="Anucha Nualsi <ana.cpe9@gmail.com>"

VOLUME /.npm/

RUN apk add --no-cache --update \
        python \
        make \
        git \
        g++ && \
    npm config --global set cache /.npm/  && \
    # OLD_NODE_USER="$(npm config --global get user)" && \
    # npm config --global set user root && \
    # npm install --global \
    npm install -g --unsafe-perm \
        node-gyp \
        node-sass \
        @angular/cli@6.1.0-beta.0 && \
    npm cache verify && \
    npm cache clean --force && \
    npm cache verify && \
    # npm config --global set user "$OLD_NODE_USER" && \
    # npm config --global get user && \
    npm list --global --depth=0 && \
    # unset OLD_NODE_USER && \
    apk del git && \
    rm -rf /tmp/* && \
    rm -rf /var/tmp/* && \
    rm -rf /var/cache/apk/* && \
    node --version && \
    npm --version && \
    ng --version
    