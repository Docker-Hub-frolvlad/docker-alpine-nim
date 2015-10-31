FROM frolvlad/alpine-gcc

RUN apk add --update openssl && \
    mkdir -p /opt && \
    cd /opt && wget "https://github.com/nim-lang/Nim/archive/master.zip" && unzip master.zip && rm master.zip && mv Nim-master Nim && \
    cd Nim && sh bootstrap.sh && \
    ln -s /opt/Nim/bin/nim /usr/local/bin/nim && \
    cd /opt && wget "https://github.com/nim-lang/nimble/archive/master.zip" && unzip master.zip && \
    cd nimble-master && nim compile --run src/nimble build && \
    mv nimble /usr/local/bin/ && \
    rm -rf "/opt/Nim/csources" "/opt/Nim/tests" "/opt/nimble" && \
    apk del openssl && \
    rm -rf /var/cache/apk/*
