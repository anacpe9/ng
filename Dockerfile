FROM node:9.2.0-alpine

LABEL maintainer="Anucha Nualsi <ana.cpe9@gmail.com>"

VOLUME /.npm/

RUN apk add --no-cache --update \
        python \
        make \
        g++ && \
    npm config set cache /.npm/ --global && \
    npm install -g --unsafe-perm \
        node-gyp \
        node-zopfli \
        node-sass \
        sass-loader \
        @angular/cli@1.6.0-rc.1 && \
    npm cache verify && \
    npm cache clean --force && \
    npm cache verify && \
    rm -rf /tmp/* && \
    rm -rf /var/tmp/* && \
    rm -rf /var/cache/apk/* && \
    npm prune && \
    npm upgrade && \
    node --version && \
    npm --version && \
    ng --version
