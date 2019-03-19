FROM quay.io/spivegin/tlmbasedebian

ENV NODE_VER=11

RUN apt-get update && apt-get install -y gnupg2 tar git curl wget apt-transport-https ca-certificates build-essential &&\
    curl -s https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add && echo 'deb https://deb.nodesource.com/node_${NODE_VER}.x stretch main' > /etc/apt/sources.list.d/nodesource.list && echo 'deb-src https://deb.nodesource.com/node_${NODE_VER}.x stretch main' >> /etc/apt/sources.list.d/nodesource.list &&\
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - &&\
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list &&\
    apt-get update && apt-get install -y nodejs yarn && apt-get clean &&\
    apt-get autoclean && apt-get autoremove &&\
    rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*