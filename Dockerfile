FROM frolvlad/alpine-gcc

RUN export NIM_VERSION=2.0.2 && \
    export NIMBLE_VERSION=0.14.2 && \
    \
    apk add --no-cache libcrypto3 libssl3 && \
    apk add --no-cache --virtual=.build-dependencies wget ca-certificates git make && \
    mkdir -p "/opt" && \
    \
    cd "/opt" && \
    wget "https://github.com/nim-lang/Nim/archive/v$NIM_VERSION.tar.gz" -O - | tar xz && \
    mv "./Nim-$NIM_VERSION" "./Nim" && \
    cd "./Nim" && \
    wget "https://github.com/nim-lang/csources_v2/archive/master.tar.gz" -O - | tar xz && \
    mv "./csources_v2-master" "./csources" && \
    cd "./csources" && \
    make -j && \
    cd .. && \
    ./bin/nim c -d:release koch && \
    ./koch boot -d:release && \
    chmod +x "/opt/Nim/bin/nim" && \
    ln -s "/opt/Nim/bin/nim" "/usr/local/bin/nim" && \
    rm -r "./csources" "./tests" && \
    \
    cd "/opt" && \
    wget "https://github.com/nim-lang/nimble/archive/v$NIMBLE_VERSION.tar.gz" -O - | tar xz && \
    cd "./nimble-$NIMBLE_VERSION" && \
    nim compile --run "src/nimble" build --accept && \
    rm -rf /tmp/* && \
    chmod +x nimble && \
    mv nimble "/usr/local/bin/" && \
    rm -rf "/opt/nimble-$NIMBLE_VERSION" && \
    \
    apk del .build-dependencies
