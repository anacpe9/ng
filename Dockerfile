FROM node:11.0.0-alpine

LABEL maintainer="Anucha Nualsi <ana.cpe9@gmail.com>"

VOLUME /.npm/

RUN apk add --no-cache --update \
    python \
    make \
    git \
    g++ && \
    # OLD_NODE_USER="$(npm config --global get user)" && \
    # npm config --global set user root && \
    # npm install --global \
    npm config set unsafe-perm true && \
    npm config --global set cache /.npm/  && \
    npm install --global --unsafe-perm \
    node-gyp \
    node-sass \
    # @angular/cli@7.0.0-rc.3 && \
    @angular/cli@7.0.2 && \
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
